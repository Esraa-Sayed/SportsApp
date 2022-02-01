//
//  AllLeaguesVCPresenter.swift
//  SportsApp
//
//  Created by esraa on 2/1/22.
//  Copyright © 2022 esraa. All rights reserved.
//

import Foundation
protocol LeaguesView :class {
    func showIndicator()
    func hideIndicator()
    func navigateToLeagueDetils(league:Country)
    func fetchingDataSuccess()
 
}
protocol LeaguesViewCell {
    var youtubePressed:  (() -> (String))? { get set }
    func displayImag(imagURL:String)
    func displayName(leaguesName:String)
}
class AllLeaguesVCPresenter
{
    private weak var view: LeaguesView?
    private let interactor:LeaguesAPiProtocol = LeaguesAPi()
    private var Leagues = [Country]()
    private var sportName:String?
    func setSportName(sportName:String) {
        self.sportName = sportName
    }
    init(view :LeaguesView)
    {
        self.view = view
    }
    func viewDidLoad()->Bool {
         view?.showIndicator()
        if CheckInternetConnectivity.isConnectedToInternet {
               print("Yes! internet is available.")
               getLeagues()
            return true;
        }
        else
        {
            view?.hideIndicator()
            return false;
        }
       
    }
    private func getLeagues() {
        interactor.getLeagues(sportsName: sportName ?? "", complition: { [weak self](result) in
        self?.view?.hideIndicator()
            switch result{
            case .success(let response):
                self?.Leagues = response?.countrys ?? []
                self?.view?.fetchingDataSuccess()
            case .failure(_):
                print("Error")
            }
        })
    }
    func getLeaguesCount()->Int
    {
       Leagues.count
    }
    func configure(cell:inout LeagueViewCell ,forIndex: Int){
        let league = Leagues[forIndex]
        cell.displayImag(imagURL: league.strBadge ?? "https://i.pinimg.com/564x/ff/f4/ae/fff4ae3259e01a20794bfed0fbd1ed13.jpg")
        cell.displayName(leaguesName: league.strLeague )
        cell.youtubePressed =
            {
                return (league.strYoutube ?? "fail")
        }
    }
    func didSelectedRow(index:Int)
       {
           let league = Leagues[index]
        view?.navigateToLeagueDetils(league: league)
       }
}
