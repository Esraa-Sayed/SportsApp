//
//  TargetType.swift
//  SportsApp
//
//  Created by esraa on 1/30/22.
//  Copyright © 2022 esraa. All rights reserved.
//

import Foundation
import Alamofire
enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
    //commit 
}
enum Task {
    case requestPlain
    case requestParameters(parameters: [String: Any], encoding: ParameterEncoding)
}
protocol TargetType {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var task: Task { get }
    var headers: [String: String]? { get }
}
