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
    func getEvents(id:String,complitionHandler : @escaping ([Event]?) -> Void)
    func getLatestResults (id:String,complitionHandler : @escaping ([Event]?) -> Void)
    func getTeam(id:String,complitionHandler : @escaping ([Team]?) -> Void)
    
}


class EventDataSource : EventDataSourceProtocol {
    
    
    func getEvents(id: String,complitionHandler : @escaping ([Event]?) -> Void) {
        let url = "https://www.thesportsdb.com/api/v1/json/2/searchevents.php?e="+id
        var eventsArray = [Event]()
        Alamofire.request(url).response { response in

                    if let data = response.data {
                        let json = JSON(data)
                        let events = json[Constants.EVENTS].arrayValue
                        for event in events {
                            let id = event[Constants.idEvent].intValue
                            let name = event[Constants.strEvent].stringValue
                            let date = event[Constants.strDateEvent].stringValue
                            let time = event[Constants.strTimeEvent].stringValue
                            eventsArray.append(Event(ID: id , eventName: name ,  eventDate: date , eventTime: time ))
                        }
                    }
                   complitionHandler(eventsArray)
                    print(eventsArray.count)
                }
    }
    
    
     func getLatestResults(id: String,complitionHandler : @escaping ([Event]?) -> Void){
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
                complitionHandler(latestResultsArray)
               print(latestResultsArray.count)
            }
        }
        
    
    func getTeam(id : String,complitionHandler : @escaping ([Team]?) -> Void) {
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
                 complitionHandler(teamsArray)
               print(teamsArray.count)
            }
        }
    
    
}


