//
//  CollectionView+PresenterDelegate.swift
//  SportsApp
//
//  Created by esraa on 1/31/22.
//  Copyright © 2022 esraa. All rights reserved.
//

import Foundation
import UIKit
extension CollectionFirstScreen:SportsView
{
    func navigateToLeagues(sportName: String) {
        var VC =  self.storyboard?.instantiateViewController(withIdentifier: "TableLeaguesViewController") as! TableLeaguesViewController
        VC.sportName = sportName
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    func showIndicator() {
            indicator?.startAnimating()
    }
    
    func hideIndicator() {
         indicator?.stopAnimating()
    }
    
    func fetchingDataSuccess() {
        self.collectionView.reloadData()
    }
    
    
}
