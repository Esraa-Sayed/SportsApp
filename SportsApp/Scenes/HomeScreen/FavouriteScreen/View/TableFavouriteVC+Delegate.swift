//
//  TableFavouriteVC+Delegate.swift
//  SportsApp
//
//  Created by esraa on 2/2/22.
//  Copyright © 2022 esraa. All rights reserved.
//

import Foundation
import UIKit
extension TableFavouriteLeagueVC:FavouriteView
{
    func showIndicator() {
         indicator?.startAnimating()
    }
    
    func hideIndicator() {
        indicator?.stopAnimating()
    }
    
    func fetchingDataSuccess() {
        tableView.reloadData()
    }
    func navigateToLeagueDetils(league:Country) {
        let storyboard = UIStoryboard(name: "SecondStoryboard", bundle: nil)
        print(league.strLeague)
        let VC = storyboard.instantiateViewController(withIdentifier: "LeagueDetailsVC") as! LeagueDetailsViewController
        VC.league = league
        self.present(VC, animated: true, completion: nil)

    }
    
}
