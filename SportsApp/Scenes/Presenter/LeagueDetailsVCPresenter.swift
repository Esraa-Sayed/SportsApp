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
    func getEventsCount()->Int
    func loadLatestResults(id:String)
    func getLatestResultsCount()->Int
    func loadTeams(id:String)
    func  getTeamsCount() -> Int
     func viewDidLoad(leagueName : String)->Bool 
    
    
   }
protocol LeagueDetailsViewProtocol :class {
    func showIndicator()
    func hideIndicator()
    func updateUIViewEvent(events: [Event])
    func updateUIViewLatestResult(latestResult: [Event])
    func updateUIViewTeam(teams: [TeamDetailsModel])
     func refresh ()
    func alertMessage ()
 
}


class LeagueDetailsPresenter : LeagueDetailsProtocol {
    
    
    var leagueDetailsView:LeagueDetailsViewProtocol?
    var dataSource = EventDataSource()
    var eventsArray : [Event]?
    var latestResultsArray : [Event]?
    var teamsArray : [TeamDetailsModel]?

    init(view:LeagueDetailsViewProtocol)
       {
           self.leagueDetailsView = view
       }
       
    func viewDidLoad(leagueName : String)->Bool {
         leagueDetailsView?.showIndicator()
        if CheckInternetConnectivity.isConnectedToInternet {
            print("Yes! internet is available.")
            loadEvents(id:"")
            loadLatestResults(id:leagueName)
            print(leagueName)
            loadTeams(id: "English%20Premier%20League")
            return true;
        }
        else
        {
            
            leagueDetailsView?.hideIndicator()
            return false;
        }
       
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
