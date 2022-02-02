//
//  FavouriteLeaguesPresenter.swift
//  SportsApp
//
//  Created by esraa on 2/2/22.
//  Copyright © 2022 esraa. All rights reserved.
//

import Foundation
protocol FavouriteView :class {
    func showIndicator()
    func hideIndicator()
    func fetchingDataSuccess()
 
}
protocol FavouriteViewCellProtocol {
    var youtubePressed:  (() -> (String))? { get set }
    func displayImag(imagURL:String)
    func displayName(leaguesName:String)
}
class FavouriteLeaguesPresenter
{
    private weak var view: FavouriteView?
    init(view :FavouriteView)
       {
           self.view = view
       }
    func viewDidLoad()
    {
        view?.showIndicator()
         getFavouriteLeagues()
        view?.hideIndicator()
    }
    private func getFavouriteLeagues()
    {
        
    }
}
