//
//  LeagueDetailsVCExtension.swift
//  SportsApp
//
//  Created by Mohamed Toba on 2/1/22.
//  Copyright © 2022 esraa. All rights reserved.
//

import Foundation
import UIKit
extension LeagueDetailsViewController {
   
    
    func showIndicator() {
        indicator?.startAnimating()
    }
    
    func hideIndicator() {
         indicator?.stopAnimating()
    }
    
    func updateUIViewLatestResult(latestResult: [Event]) {
            print("updateUIViewLatestResult")
           latestResultsArray = latestResult
          // latestResultsCollectionView.reloadData()
       }
       
       func updateUIViewTeam(teams: [Team]) {
           teamsArray = teams
           print("updateUIViewTeam")
          // teamsCollectionView.reloadData()
       }
       
       func updateUIViewEvent(events: [Event]) {
          // print("updateUIViewEvent")
           eventssArray = events
          // eventsCollectionView.reloadData()
       }
    
    
}
