//
//  Leagues.swift
//  SportsApp
//
//  Created by esraa on 2/1/22.
//  Copyright © 2022 esraa. All rights reserved.
//

import Foundation
class Country:Decodable
{
    var idLeague: String?
    var strSport: String?
    var strYoutube:String?
    var strBadge:String?
    var strLeague:String
}
class LeaguesResponse:Decodable
{
    var countrys:[Country]
}
