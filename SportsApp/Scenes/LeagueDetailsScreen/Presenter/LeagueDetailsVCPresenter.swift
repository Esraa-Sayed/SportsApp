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
     func viewDidLoad(league : Country)->Bool 
    func isFovorite(leagueId: Int)-> Bool
    func removeFromfaVorite(league: Country)
    
   }
protocol LeagueDetailsViewProtocol :class {
    func showIndicator()
    func hideIndicator()
    func updateUIViewEvent(events: [Event])
    func updateUIViewLatestResult(latestResult: [Event])
    func updateUIViewTeam(teams: [TeamDetailsModel])
     func refresh ()
    func alertMessage ()
    func navigateToTeamDetails(team:TeamDetailsModel)
 
}


class LeagueDetailsPresenter : LeagueDetailsProtocol {
    
    lazy var dbSource: CoreDataServices = CoreDataServices()

    
    var leagueDetailsView:LeagueDetailsViewProtocol?
    var dataSource = EventDataSource()
    var eventsArray : [Event]?
    var latestResultsArray : [Event]?
    var teamsArray : [TeamDetailsModel]?

    init(view:LeagueDetailsViewProtocol)
       {
           self.leagueDetailsView = view
       }
       
    func viewDidLoad(league: Country)->Bool {
         leagueDetailsView?.showIndicator()
        if CheckInternetConnectivity.isConnectedToInternet {
            print("Yes! internet is available.")
          
//           loadEvents(id:league.idLeague!)
//           loadLatestResults(id:league.idLeague!)
//           loadTeams(id: league.strLeague)
            
            loadEvents(id:"")
            loadLatestResults(id:"4328")
            loadTeams(id: "English%20Premier%20League")
            
            print(league.idLeague!)
            return true;
        }
        else
        {
            
            leagueDetailsView?.hideIndicator()
            return false;
        }
       
    }
    
    
    func loadEvents(id:String) {
        dataSource.getEvents(id: id, complitionHandler: { (result,Error) in
        self.eventsArray = result
        self.leagueDetailsView?.hideIndicator()
        self.leagueDetailsView?.updateUIViewEvent(events: self.eventsArray!)
        })
        self.leagueDetailsView?.refresh()
       }
       
       func getEventsCount()->Int{
           return eventsArray!.count
       }
    
      
    
    func loadLatestResults(id:String){
     dataSource.getLatestResults(id: id, complitionHandler: { (result,Error) in
     self.latestResultsArray = result
     self.leagueDetailsView?.hideIndicator()
        self.leagueDetailsView?.updateUIViewLatestResult(latestResult: self.latestResultsArray!)
     })
     self.leagueDetailsView?.refresh()
    }
    
    func getLatestResultsCount()->Int{
        return latestResultsArray!.count
    }
    
   
    func loadTeams(id:String) {
     dataSource.getTeam(id: id, complitionHandler: { (result,Error) in
     self.teamsArray = result
     self.leagueDetailsView?.hideIndicator()
        self.leagueDetailsView?.updateUIViewTeam(teams: self.teamsArray!)
     })
     self.leagueDetailsView?.refresh()
    }
    
    func getTeamsCount()->Int{
        return teamsArray!.count
    }
    
    func didSelectedRow(index:Int)
    {
      let team = teamsArray![index]
      leagueDetailsView?.navigateToTeamDetails(team: team)
    }
    func isFovorite(leagueId: Int)-> Bool{
        return dbSource.isFovorite(leagueId: leagueId)
    }
     
    func addTofaVorite(league: Country){
        dbSource.insertfavouriteLeague(league: league)
    }
      
    func removeFromfaVorite(league: Country){
        dbSource.deleteSoredLeague(league: league)
    }
   
}
