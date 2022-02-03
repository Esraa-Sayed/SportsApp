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
        indicator.center = self.view.center
        self.view.addSubview(indicator)
        indicator.startAnimating()
    }
    
    func hideIndicator() {
         indicator.stopAnimating()
    }
    
    func updateUIViewLatestResult(latestResult: [Event]) {
        createAsyncArray(list : latestResult,completion: { (result) in
        self.latestResultsArray = result as? [Event]
        self.latestResultsCollectionView.reloadData()
        print("updateUIViewLatestResults")
        })
       }
       
       func updateUIViewTeam(teams: [TeamDetailsModel]) {
        createAsyncArray(list : teams,completion: { (result) in
        self.teamsArray = result as? [TeamDetailsModel]
        self.teamsCollectionView.reloadData()
        print("updateUIViewTeam")
        })
       }
       
       func updateUIViewEvent(events: [Event]) {
        createAsyncArray(list : events,completion: { (result) in
            self.eventsArray = result as? [Event]
            self.eventsCollectionView.reloadData()
            print("updateUIViewEvent")
        })
       }
    
    func refresh (){
        eventsCollectionView.reloadData()
        teamsCollectionView.reloadData()
        latestResultsCollectionView.reloadData()
    }
    
    func alertMessage (){
        Toast.showToast(controller: self, message : "No internet connection", seconds: 4.0)
    }
    
    func createAsyncArray(list: [Any], completion: @escaping ([Any]) -> Void) {
        var count = 0; //Keep track of the number of items we have created
        var array = [Any]()
        //Loop itemCount times.
        for i in list {
            let delay = Double.random(in: 0.3...0.4)
            //Delay a random time before creating a random number (to simulate an async network response)
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                array.append(i)
                count += 1
                if count == list.count {
                    completion(array)
                }
            }
        }
    }

}
