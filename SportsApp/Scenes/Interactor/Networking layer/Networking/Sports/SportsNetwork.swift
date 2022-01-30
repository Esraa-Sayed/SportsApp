//
//  SportsNetwork.swift
//  SportsApp
//
//  Created by esraa on 1/31/22.
//  Copyright © 2022 esraa. All rights reserved.
//

import Foundation
enum SportsNetwork
{
    case getUsers
}
extension SportsNetwork:TargetType
{
    var baseURL: String
    {
        return ApiLinkes.baseLink.rawValue
    }
    
    var path: String
    {
        return ApiLinkes.allSports.rawValue
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
