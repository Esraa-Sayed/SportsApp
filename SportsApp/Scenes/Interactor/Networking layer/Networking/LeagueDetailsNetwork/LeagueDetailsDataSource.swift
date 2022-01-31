//
//  LeagueDetailsDataSource.swift
//  SportsApp
//
//  Created by Mohamed Toba on 1/31/22.
//  Copyright © 2022 esraa. All rights reserved.
//

import Foundation
import Foundation
protocol LDDataSourceProtocol {
    
    func getEvents(complition: @escaping(Result<EventsResponse?,NSError>)->Void)
    
    func getLatestEvents(complition: @escaping(Result<LatestEventsResponse?,NSError>)->Void)
    
    func getTeams(complition: @escaping(Result<TeamsResponse?,NSError>)->Void)


    
}
class LDDataSource:BaseApi<AllEventsNetwork>,LDDataSourceProtocol
{
    static let shared = LDDataSource()
    func getEvents(complition: @escaping(Result<EventsResponse?,NSError>)->Void) {
        self.fetchData(target: .getEvents, responseClass: EventsResponse.self) { (result) in
            complition(result)
        }
    }
    func getLatestEvents(complition: @escaping(Result<LatestEventsResponse?,NSError>)->Void) {
           self.fetchData(target: .getEvents, responseClass: LatestEventsResponse.self) { (result) in
               complition(result)
           }
    }
       
    func getTeams(complition: @escaping(Result<TeamsResponse?,NSError>)->Void) {
           self.fetchData(target: .getEvents, responseClass: TeamsResponse.self) { (result) in
               complition(result)
           }
       }
}
