//
//  AllSportsVCPresenter.swift
//  SportsApp
//
//  Created by esraa on 1/31/22.
//  Copyright © 2022 esraa. All rights reserved.
//

import Foundation
protocol SportsView :class {
    func showIndicator()
    func hideIndicator()
    func navigateToLeagues(sportName:String)
    func fetchingDataSuccess()
 
}
protocol sportViewCell {
    func displayImag(imagURL:String)
    func displayName(sportName:String)
}
class AllSportsVCPresenter
{
    private weak var view: SportsView?
    private let interactor:SportsAPiProtocol = SportsAPi()
    private var sports = [Sports]()
    init(view:SportsView)
    {
        self.view = view
    }
    func viewDidLoad()->Bool {
         view?.showIndicator()
        if CheckInternetConnectivity.isConnectedToInternet {
               print("Yes! internet is available.")
               getSports()
            return true;
        }
        else
        {
            view?.hideIndicator()
            return false;
        }
        
    }
    private func getSports() {
        interactor.getSports { [weak self](result) in
        self?.view?.hideIndicator()
            switch result{
            case .success(let response):
                self?.sports = response?.sports ?? []
                self?.view?.fetchingDataSuccess()
            case .failure(_):
                print("Error")
            }
        }
    }
    func getSportsCount()->Int
    {
        sports.count
    }
    func configure(cell:sportViewCell ,forIndex: Int){
        let sport = sports[forIndex]
        cell.displayImag(imagURL: sport.strSportThumb ?? "https://i.pinimg.com/564x/ff/f4/ae/fff4ae3259e01a20794bfed0fbd1ed13.jpg")
        cell.displayName(sportName: sport.strSport ?? "UnKnown")
    }
    func didSelectedRow(index:Int)
    {
        let sport = sports[index]
        view?.navigateToLeagues(sportName:sport.strSport ?? "")
    }

}
