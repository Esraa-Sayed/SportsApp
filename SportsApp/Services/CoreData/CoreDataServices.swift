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
        league.strLeague = league.strLeague.replacingOccurrences(of: "%20", with:" ")
        print("Insert league with name  \(league.strLeague)")
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
    
    func deleteSoredLeague(league: Country){
        DispatchQueue.global(qos: .background).async {[weak self] in
        guard let self = self else {return}
        do {
            if let mContext = self.manageContext{
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FavouriteLeagues")
            fetchRequest.predicate = NSPredicate(format: "idLeague == %@", league.idLeague?.description ?? "")
            let result = try mContext.fetch(fetchRequest)
            mContext.delete((result as! [NSManagedObject]).first!)
            try self.manageContext?.save()
            print("league deleted successfully")
               }
           } catch let error {
               print("Detele all data in LeaguesEntity error :", error)
           }
        }
    }
    
    func isFovorite(leagueId: Int)-> Bool{
       do {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FavouriteLeagues")
           fetchRequest.predicate = NSPredicate(format: "idLeague == %@", leagueId.description)
            
          if let mContext = self.manageContext{
                let result = try mContext.fetch(fetchRequest)
            if result.count > 0 {
                return true
            }
                  }
              } catch let error {
                  print("Detele all data in LeaguesEntity error :", error)
              }
        return false
    }
    func displayFavouriteLeagues() -> [String:[FavouriteLeagues]]
    {
        var favLeagues:[String:[FavouriteLeagues]] = [:]
        var leagues:[FavouriteLeagues] = []
        let fetchReq = NSFetchRequest<NSManagedObject>(entityName: "FavouriteLeagues")
        do{
            leagues = try manageContext?.fetch(fetchReq) as! [FavouriteLeagues]
            for i in leagues
            {
                if(favLeagues[i.strSport!] == nil)
                {
                    favLeagues[i.strSport!] = []
                }
                favLeagues[i.strSport!]?.append(i)
            }
        }catch let error as NSError{
            print(error)
        }
        return favLeagues
    }
}
