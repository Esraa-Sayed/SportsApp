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
    func fetchingDataSuccess()
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
    func viewDidLoad() {
        getSports()
    }
    private func getSports() {
        view?.showIndicator()
       interactor.getSports { [weak self](result) in
           self?.view?.hideIndicator()
            switch result{
            case .success(let response):
                self?.sports = response?.sports ?? []
                print(self?.sports[0].idSport)
                self?.view?.fetchingDataSuccess()
            case .failure(_):
                print("Error")
            }
        }
    }
}
