//
//  LeagueDetailsVCPresenter.swift
//  SportsApp
//
//  Created by Mohamed Toba on 2/1/22.
//  Copyright © 2022 esraa. All rights reserved.
//

import Foundation
protocol LeagueDetailsProtocol {
    
    func loadEvents(id:String)
    
    func loadLatestResults(id:String)
    
    func loadTeams(id:String)
        
    
   }
protocol LeagueDetailsView :class {
    func showIndicator()
    func hideIndicator()
    func fetchingDataSuccess()
 
}


class LeagueDetailsPresenter : LeagueDetailsProtocol {
    
    
    // var leagueDetailsView:LeagueDetailsViewPotocol?
    var dataSource:EventDataSource?
    var eventsArray : [Event]?
    var latestResultsArray : [Event]?
    var teamsArray : [Team]?

    
    
    func loadLatestResults(id:String) {
       latestResultsArray = dataSource?.getLatestResults(id: id)
       print(latestResultsArray?.count ?? 0)

    }
    
    func loadTeams(id:String) {
        teamsArray = dataSource?.getTeam(id: id)
         print(teamsArray?.count ?? 0)
    }
 
    
    func loadEvents(id:String) {
        eventsArray = dataSource?.getEvents(id: id)
         print(eventsArray?.count ?? 0)
    }
    

}
