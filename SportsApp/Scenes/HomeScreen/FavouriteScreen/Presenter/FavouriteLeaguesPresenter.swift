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
    func navigateToLeagueDetils(league:Country)
 
}
protocol FavouriteViewCell {
    var youtubePressed:  (() -> (String))? { get set }
    func displayImag(imagURL:String)
    func displayName(leaguesName:String)
}
class FavouriteLeaguesPresenter
{
    private weak var view: FavouriteView?
    private let coreData:CoreDataServices = CoreDataServices()
    private var result:[String:[FavouriteLeagues]] = [:]
    init(view :FavouriteView)
       {
           self.view = view
       }
    func viewDidLoad()->Bool
    {
        view?.showIndicator()
        getFavouriteLeagues()
        view?.hideIndicator()
        if(result.count == 0)
        {
            return false
        }
        return true
    }
    private func getFavouriteLeagues()
    {
        result = coreData.displayFavouriteLeagues()
    }
    func getFavLeaguesSectionCount() -> Int {
        return result.count
    }
    func getFavLeaguesRowCount(index:Int) -> Int
    {
       
        return Array(result)[index].value.count
    }
    func configure(cell:inout FavouriteLeaguesViewCell,forSection:Int,forIndex:Int) {
        let league = Array(result)[forSection].value[forIndex]
        cell.displayImag(imagURL: league.strBadge ?? "https://i.pinimg.com/564x/ff/f4/ae/fff4ae3259e01a20794bfed0fbd1ed13.jpg")
        cell.displayName(leaguesName: league.strLeague ?? "Not found")
        cell.youtubePressed =
         {
                var youtube = league.strYoutube
                if CheckInternetConnectivity.isConnectedToInternet {
                    if youtube!.isEmpty
                      {
                          return "No link found"
                      }
                      else
                      {
                         return youtube!
                    }
                }
                else
                {
                    return "No internet connection"
                }
        }
    }
    func sectionName(section:Int) -> String {
        return Array(result)[section].key
    }
}
