//
//  CollectionView+PresenterDelegate.swift
//  SportsApp
//
//  Created by esraa on 1/31/22.
//  Copyright © 2022 esraa. All rights reserved.
//

import Foundation
import UIKit
extension CollectionViewFirstScreen:SportsView
{
    func showIndicator(indicator :UIActivityIndicatorView?) {
            indicator?.startAnimating()
    }
    
    func hideIndicator(indicator :UIActivityIndicatorView?) {
         indicator?.stopAnimating()
    }
    
    func fetchingDataSuccess() {
        self.collectionView.reloadData()
    }
    
    
}
