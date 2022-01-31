//
//  AllSportsVCPresenter.swift
//  SportsApp
//
//  Created by esraa on 1/31/22.
//  Copyright © 2022 esraa. All rights reserved.
//

import Foundation
import UIKit
protocol SportsView :class {
    func showIndicator(indicator :UIActivityIndicatorView?)
    func hideIndicator(indicator :UIActivityIndicatorView?)
    func fetchingDataSuccess()
}
protocol sportViewCell {
    func displayImag(imagURL:String)
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
    func viewDidLoad(indicator :UIActivityIndicatorView?) {
        getSports(indicator: indicator)
    }
    private func getSports(indicator :UIActivityIndicatorView?) {
        view?.showIndicator(indicator: indicator)
       interactor.getSports { [weak self](result) in
        self?.view?.hideIndicator(indicator: indicator)
            switch result{
            case .success(let response):
                self?.sports = response?.sports ?? []
                print("\(self?.sports[0].idSport)")
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
    }
    func didSelectedRow(index:Int)
    {
         let sport = sports[index]
    }
}
