//
//  LeaguesVC+Delegate.swift
//  SportsApp
//
//  Created by esraa on 2/1/22.
//  Copyright © 2022 esraa. All rights reserved.
//

import Foundation
extension TableLeaguesViewController:LeaguesView
{
   func showIndicator() {
            indicator?.startAnimating()
    }
    
    func hideIndicator() {
         indicator?.stopAnimating()
    }
  /*  func navigateToLeagueDetils() {
        <#code#>
    }*/
    
    func fetchingDataSuccess() {
        myTable?.reloadData()
    }
    
    
}
