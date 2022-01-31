//
//  LeagueDetailsResponse.swift
//  SportsApp
//
//  Created by Mohamed Toba on 1/31/22.
//  Copyright © 2022 esraa. All rights reserved.
//

import Foundation

class EventsResponse: Decodable {
    var events:[Event]
}

class LatestEventsResponse: Decodable {
    var latestEvents:[Event]
}

class TeamsResponse: Decodable {
    var teams:[Team]
}
