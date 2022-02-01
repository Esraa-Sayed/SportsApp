//
//  Leagues.swift
//  SportsApp
//
//  Created by esraa on 2/1/22.
//  Copyright © 2022 esraa. All rights reserved.
//

import Foundation
class Countrys:Decodable
{
    var idLeague: String?
    var strSport: String?
    var strYoutube:String?
    var strBadge:String?
}
class LeaguesResponse:Decodable
{
    var countrys:[Countrys]
}
