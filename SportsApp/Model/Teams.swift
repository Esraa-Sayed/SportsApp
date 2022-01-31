//
//  Teams.swift
//  SportsApp
//
//  Created by Mohamed Toba on 1/31/22.
//  Copyright © 2022 esraa. All rights reserved.
//

import Foundation
class Team : Decodable{
    
    var imageURL : String
    var ID :Int
    init (imageURL : String , ID :Int){
        self.imageURL = imageURL
        self.ID = ID
    }
}
