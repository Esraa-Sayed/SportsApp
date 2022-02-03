//
//  LeagueDetailsVCPresenter.swift
//  SportsApp
//
//  Created by Mohamed Toba on 2/1/22.
//  Copyright © 2022 esraa. All rights reserved.
//

import Foundation
import Kingfisher

protocol LeagueDetailsProtocol {
    
    func loadEvents(id:String)
    func getEventsCount()->Int
    func loadLatestResults(id:String)
    func getLatestResultsCount()->Int
    func loadTeams(id:String)
    func  getTeamsCount() -> Int
     func viewDidLoad(league : Country)->Bool 
    
    
   }
protocol LeagueDetailsViewProtocol :class {
    func showIndicator()
    func hideIndicator()
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
       
    func viewDidLoad(league: Country)->Bool {
         leagueDetailsView?.showIndicator()
        if CheckInternetConnectivity.isConnectedToInternet {
            print("Yes! internet is available.")
          
//           loadEvents(id:league.idLeague!)
//           loadLatestResults(id:league.idLeague!)
//           loadTeams(id: league.strLeague)
            
            loadEvents(id:"")
         //   loadLatestResults(id:"")
        //  loadTeams(id: "English%20Premier%20League")
            
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
        self.leagueDetailsView?.refresh()
        print(self.getEventsCount())
        })
        
       }
       
       func getEventsCount()->Int{
        return self.eventsArray!.count
       }
    
      
    
    func loadLatestResults(id:String){
     dataSource.getLatestResults(id: id, complitionHandler: { (result,Error) in
     self.latestResultsArray = result
     self.leagueDetailsView?.hideIndicator()
    self.leagueDetailsView?.refresh()
        print(self.getLatestResultsCount())

     })
    }
    
    func getLatestResultsCount()->Int{
        
        return self.latestResultsArray!.count
    }
    
   
    func loadTeams(id:String) {
     dataSource.getTeam(id: id, complitionHandler: { (result,Error) in
     self.teamsArray = result
     self.leagueDetailsView?.hideIndicator()
     self.leagueDetailsView?.refresh()
     print(self.getTeamsCount())
     })
    }
    
    func getTeamsCount()->Int{
        return self.teamsArray!.count
    }
    
    func configureEventCell(cell:EventCollectionViewCell ,forIndex: Int){
        let event = self.eventsArray![forIndex]
        cell.eventName.text = event.eventName
        cell.eventDate.text = event.eventDate
        cell.eventTime.text = event.eventTime
        
    }
    
    func configureLatestResultsCell(cell:LastResultCollectionViewCell ,forIndex: Int){
        let latestResult = self.latestResultsArray![forIndex]
        cell.teamName.text = latestResult.eventName
        cell.teamScore.text = String (describing:latestResult.intHomeScore )
                         + " VS " + String (describing: latestResult.intAwayScore )
        cell.teamDate.text = latestResult.eventDate
        cell.teamTime.text = latestResult.eventTime
        
    }
    
    func configureTeamCell(cell:TeamCollectionViewCell ,forIndex: Int){
        let team = self.teamsArray![forIndex]
        cell.teamImage.kf.indicatorType = .activity
        cell.teamImage.kf.setImage(with: URL(string: team.teamImage!),placeholder: UIImage(named: "PlaceholderImg"))
       }
   
    
    
}
