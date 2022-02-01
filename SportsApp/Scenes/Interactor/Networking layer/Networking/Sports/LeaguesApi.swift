//
//  LeaguesApi.swift
//  SportsApp
//
//  Created by esraa on 2/1/22.
//  Copyright © 2022 esraa. All rights reserved.
//

import Foundation
protocol LeaguesAPiProtocol {
    func getLeagues(sportsName:String,complition: @escaping(Result<LeaguesResponse?,NSError>)->Void)
}
class LeaguesAPi:BaseApi<AllLeaguesNetwork>,LeaguesAPiProtocol
{
    static let shared = LeaguesAPi()
    func getLeagues(sportsName:String,complition: @escaping(Result<LeaguesResponse?,NSError>)->Void) {
        self.fetchData(target: .getLegues(sportName: sportsName), responseClass: LeaguesResponse.self) { (result) in
            complition(result)
        }
    }
}
