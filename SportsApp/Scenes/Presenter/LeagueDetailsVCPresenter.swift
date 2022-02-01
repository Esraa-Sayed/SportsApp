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
protocol LeagueDetailsViewProtocol :class {
    func showIndicator()
    func hideIndicator()
    func updateUIViewEvent(events: [Event])
    func updateUIViewLatestResult(latestResult: [Event])
    func updateUIViewTeam(teams: [Team])
     func refresh ()
    func alertMessage ()
 
}


class LeagueDetailsPresenter : LeagueDetailsProtocol {
    
    
    var leagueDetailsView:LeagueDetailsViewProtocol?
    var dataSource = EventDataSource()
    var eventsArray : [Event]?
    var latestResultsArray : [Event]?
    var teamsArray : [Team]?

    init(view:LeagueDetailsViewProtocol)
       {
           self.leagueDetailsView = view
       }
       
    
    func loadEvents(id:String) {
        dataSource.getEvents(id: id, complitionHandler: { (result) in
        self.eventsArray = result
        self.leagueDetailsView?.hideIndicator()
        self.leagueDetailsView?.updateUIViewEvent(events: result!)
        print(self.eventsArray?.count ?? 0)
        })
        self.leagueDetailsView?.refresh()
       }
       
       func getEventsCount()->Int{
           return eventsArray!.count
       }
       

    
    func loadLatestResults(id:String){
     dataSource.getLatestResults(id: id, complitionHandler: { (result) in
     self.latestResultsArray = result
     self.leagueDetailsView?.hideIndicator()
     self.leagueDetailsView?.updateUIViewLatestResult(latestResult: result!)
     print(self.latestResultsArray?.count ?? 0)
     })
     self.leagueDetailsView?.refresh()
    }
    
    func getLatestResultsCount()->Int{
        return latestResultsArray!.count
    }
    
   
    func loadTeams(id:String) {
     dataSource.getTeam(id: id, complitionHandler: { (result) in
     self.teamsArray = result
     self.leagueDetailsView?.hideIndicator()
     self.leagueDetailsView?.updateUIViewTeam(teams: result!)
     print(self.teamsArray?.count ?? 0)
     })
     self.leagueDetailsView?.refresh()
    }
    
    func getTeamsCount()->Int{
        return teamsArray!.count
    }
    
   
}
