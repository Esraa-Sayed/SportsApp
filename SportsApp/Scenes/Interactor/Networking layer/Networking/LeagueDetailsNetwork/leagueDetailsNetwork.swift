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

protocol EventDataSourceProtocol {
    func getEvents(id:String,completion : ()->())->[Event]
    func getLatestResults (id:String)->[Event]
    func getTeam(id:String)->[Team]
    
}


class EventDataSource : EventDataSourceProtocol {
    
    
    func getEvents(id: String,completion : ()->())->[Event] {
        let url = "https://www.thesportsdb.com/api/v1/json/2/searchevents.php?e="+id
        var eventsArray = [Event]()
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
                            eventsArray.append(Event(ID: id , eventName: name ,  eventDate: date , eventTime: time ))

                        }

                    }
                    print(eventsArray.count)
                }
        completion()
        return eventsArray
    }
    
    
     func getLatestResults(id: String) ->[Event]{
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
            }
        return latestResultsArray
        }
        
    
    func getTeam(id : String)->[Team] {
            let url = "https://www.thesportsdb.com/api/v1/json/2/search_all_teams.php?l="
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
            }
        return teamsArray
        }
    
    
}


