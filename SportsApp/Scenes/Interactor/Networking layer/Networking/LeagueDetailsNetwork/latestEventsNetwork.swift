//
//  latestEventsNetwork.swift
//  SportsApp
//
//  Created by Mohamed Toba on 1/31/22.
//  Copyright © 2022 esraa. All rights reserved.
//

import Foundation
enum latestEventsNetwork
{
    case getLatestEvents
}
extension latestEventsNetwork:TargetType
{
    var baseURL: String
    {
        return ApiLinkes.baseLink.rawValue
    }
    
    var path: String
    {
        return ApiLinkes.allLatestEvents.rawValue
    }
    
    var method: HTTPMethod
    {
        return .get
    }
    
    var task: Task
    {
        return .requestPlain
    }
    var headers: [String : String]?
    {
        return [:]
    }
    
}

