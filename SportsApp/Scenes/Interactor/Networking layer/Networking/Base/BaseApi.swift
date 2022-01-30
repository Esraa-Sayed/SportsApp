//
//  BaseApi.swift
//  SportsApp
//
//  Created by esraa on 1/30/22.
//  Copyright © 2022 esraa. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
class BaseApi<T:TargetType>
{
    func fetchData<M:Decodable>(target:T,responseClass:M.Type,Completion:@escaping(Result<M?>)->Void) {
        let method = Alamofire.HTTPMethod(rawValue: target.method.rawValue)
        let headers = Alamofire.HTTPHeaders(target.headers)
    }
}
