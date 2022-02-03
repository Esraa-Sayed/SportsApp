//
//  SportsNetwork.swift
//  SportsApp
//
//  Created by esraa on 1/31/22.
//  Copyright © 2022 esraa. All rights reserved.
//

import Foundation
import Alamofire
enum ALLSportsNetwork
{
    case getSports
}
extension ALLSportsNetwork:TargetType
{
    var baseURL: String
    {
        return Constants.baseLink
    }
    
    var path: String
    {
        return Constants.allSports
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
enum AllLeaguesNetwork
{
    case getLegues(sportName:String)
}
extension AllLeaguesNetwork:TargetType
{
    var baseURL: String
       {
           return Constants.baseLink
       }
       
       var path: String
       {
           return Constants.allLeagues
       }
       
       var method: HTTPMethod
       {
           return .get
       }
       
       var task: Task
       {
        switch self {
        case .getLegues(let sportName):
            return .requestParameters(parameters: ["s":sportName], encoding: URLEncoding.default)
        }
       
       }
       var headers: [String : String]?
       {
           return [:]
       }
}
