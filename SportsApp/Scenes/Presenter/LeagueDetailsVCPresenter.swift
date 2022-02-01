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
    func alertMessage ()
 
}


class LeagueDetailsPresenter : LeagueDetailsProtocol {
    
    
    var leagueDetailsView:LeagueDetailsViewProtocol?
    var dataSource:EventDataSource?
    var eventsArray : [Event]?
    var latestResultsArray : [Event]?
    var teamsArray : [Team]?

    init(view:LeagueDetailsViewProtocol)
       {
           self.leagueDetailsView = view
       }
       func viewDidLoad()->Bool {
            leagueDetailsView?.showIndicator()
        if CheckInternetConnectivity.isConnectedToInternet {
            print("Yes! internet is available.")
            loadTeams(id: " ")
            loadEvents(id: " ")
            loadLatestResults(id: " ")
            return true;
        }
        else
        {
            leagueDetailsView?.hideIndicator()
            leagueDetailsView?.alertMessage()
            return false;
        }
          
       }
    
    func loadLatestResults(id:String) {
       latestResultsArray = dataSource?.getLatestResults(id: id)
        if latestResultsArray == nil{
            self.leagueDetailsView?.hideIndicator()
            self.leagueDetailsView?.updateUIViewLatestResult(latestResult: latestResultsArray!)
            //view controller func
        }else{
            self.leagueDetailsView?.hideIndicator()
            print("error loading latestResults")
        }
       print(latestResultsArray?.count ?? 0)

    }
    
    func getLatestResultsCount()->Int{
        return latestResultsArray!.count
    }
    
   
    func loadTeams(id:String) {
        teamsArray = dataSource?.getTeam(id: id)
        if teamsArray == nil{
            self.leagueDetailsView?.hideIndicator()
            self.leagueDetailsView?.updateUIViewTeam(teams: teamsArray!)
            //view controller func
        }else{
            self.leagueDetailsView?.hideIndicator()
            print("error loading teams")
        }
         print(teamsArray?.count ?? 0)
    }
    
    func getTeamsCount()->Int{
        return teamsArray!.count
    }
    
    func loadEvents(id:String) {
        eventsArray = dataSource?.getEvents(id: id)
        if eventsArray == nil{
            self.leagueDetailsView?.hideIndicator()
            self.leagueDetailsView?.updateUIViewEvent(events: eventsArray!)
            //view controller func
        }else{
            self.leagueDetailsView?.hideIndicator()
            print("error loading events")
        }
         print(eventsArray?.count ?? 0)
    }
    
    func getEventsCount()->Int{
        return eventsArray!.count
    }
    

}
