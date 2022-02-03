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
    
    
    func refresh (){
        eventsCollectionView.reloadData()
        teamsCollectionView.reloadData()
        latestResultsCollectionView.reloadData()
    }
    
    func alertMessage (){
        Toast.showToast(controller: self, message : "No internet connection", seconds: 4.0)
    }
    
    

}
