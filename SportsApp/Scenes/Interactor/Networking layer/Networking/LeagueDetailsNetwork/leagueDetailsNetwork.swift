//
//  leagueDetailsManager.swift
//  SportsApp
//
//  Created by Mohamed Toba on 1/31/22.
//  Copyright © 2022 esraa. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
class EventDataSource {
    
    func getEvents(id: String) {
        let url = "https://www.thesportsdb.com/api/v1/json/2/searchevents.php?e="+id
        var eventssArray = [Event]()
        Alamofire.request(url).response { response in

                    if let data = response.data {

                        let json = JSON(data)

                        let events = json[Constants.EVENTS].arrayValue

                        print("here")
                        for event in events {
                            let id = event[Constants.idEvent].intValue
                            let name = event[Constants.strEvent].stringValue
                            let date = event[Constants.strDateEvent].stringValue
                            let time = event[Constants.strTimeEvent].stringValue
                            print(name)
                            eventssArray.append(Event(ID: id , eventName: name ,  eventDate: date , eventTime: time ))

                        }

                    }
                    print(eventssArray.count)
                    debugPrint(response.data)
                }
    }
     func getLatestResults(id: String) {
            let url = "https://www.thesportsdb.com/api/v1/json/1/eventspastleague.php?id="+id
            var latestResultsArray = [Event]()
            Alamofire.request(url).response { response in
                
                if let data = response.data {
                    
                    let json = JSON(data)
                    let latestResults = json[Constants.EVENTS].arrayValue
                    
                    for result in latestResults {
                        let id = result[Constants.idEvent].intValue
                        
                        let name = result[Constants.strEvent].stringValue
                        let date = result[Constants.strDateEvent].stringValue
                        let time = result[Constants.strTimeEvent].stringValue
                        let intHomeScore = result[Constants.strTimeEvent].int
                        let intAwayScore = result[Constants.strTimeEvent].int
                        latestResultsArray.append(Event(ID: id , eventName: name ,  eventDate: date , eventTime: time , intHomeScore: intHomeScore ?? 0 , intAwayScore: intAwayScore ?? 0))
                   
                    }
                    
                }
                
               print(latestResultsArray.count)
                
                debugPrint(response.data)
            }
        }
        
        func getTeam(id:String) {
            let url = "https://www.thesportsdb.com/api/v1/json/2/search_all_teams.php?l="+id
            var teamsArray = [Team]()
            Alamofire.request(url).response { response in
                
                if let data = response.data {
                    let json = JSON(data)
                    let teams = json[Constants.TEAMS].arrayValue
                    
                    for team in teams {
                        let id = team[Constants.idTeam].intValue
                        
                        let url = team[Constants.strTeamBadge].stringValue
                      
                        teamsArray.append(Team(imageURL: url, ID: id))
                        
            
                    }
                   
                }
                
               print(teamsArray.count)
                
                debugPrint(response.data)
            }
        }
    
    
}

