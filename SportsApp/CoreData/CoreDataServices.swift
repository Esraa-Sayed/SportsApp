//
//  CoreDataServices.swift
//  SportsApp
//
//  Created by esraa on 2/2/22.
//  Copyright © 2022 esraa. All rights reserved.
//

import Foundation
import UIKit
import CoreData
class CoreDataServices
{
    var  manageContext :NSManagedObjectContext?
    init() {
        let appDelegte = UIApplication.shared.delegate as! AppDelegate
        manageContext = appDelegte.persistentContainer.viewContext
    }
    func insertfavouriteLeague(league:Country)
    {
        let entity = NSEntityDescription.entity(forEntityName: "FavouriteLeagues", in: manageContext!)
        let leagueAttr = NSManagedObject(entity: entity!, insertInto: manageContext)
        leagueAttr.setValue(league.idLeague, forKey: "idLeague")
        leagueAttr.setValue(league.strSport, forKey: "strSport")
        leagueAttr.setValue(league.strLeague, forKey: "strLeague")
        leagueAttr.setValue(league.strBadge, forKey: "strBadge")
        leagueAttr.setValue(league.strYoutube, forKey: "strYoutube")
        do{
            try manageContext?.save()
            print("league inserted successfully")
          }catch let error as NSError{
           print(error)
          }
    }
}
