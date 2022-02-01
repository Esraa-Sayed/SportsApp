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
   // func navigateToLeagueDetils()
    func fetchingDataSuccess()
 
}
protocol LeaguesViewCell {
    func displayImag(imagURL:String)
    func displayName(leaguesName:String)
    func displayVideo(videoURL:String)
}
class AllLeaguesVCPresenter
{
    private weak var view: LeaguesView?
    private let interactor:LeaguesAPiProtocol = LeaguesAPi()
    private var Leagues = [Countrys]()
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
}
