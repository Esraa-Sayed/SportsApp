//
//  Events.swift
//  SportsApp
//
//  Created by Mohamed Toba on 1/31/22.
//  Copyright © 2022 esraa. All rights reserved.
//

import Foundation
class Event : Decodable , NSCopying{
    func copy(with zone: NSZone? = nil) -> Any {
        let copy = Event(ID: ID, eventName: eventName, eventDate: eventDate, eventTime: eventTime, intHomeScore: intHomeScore, intAwayScore: intAwayScore)
        return copy
    }
    
   
    var ID : Int
    var eventName : String
    var eventDate : String
    var eventTime : String
    var intHomeScore : String
    var intAwayScore : String
    
    init(ID:Int , eventName : String , eventDate : String , eventTime : String ,intHomeScore : String ,  intAwayScore : String ) {
        self.ID = ID
        self.eventName = eventName
        self.eventDate = eventDate
        self.eventTime = eventTime
        self.intHomeScore = intHomeScore
        self.intAwayScore = intAwayScore
    }
    
}
