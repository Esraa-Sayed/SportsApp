//
//  LeagueDetailsViewController.swift
//  SportsApp
//
//  Created by Mohamed Toba on 1/31/22.
//  Copyright © 2022 esraa. All rights reserved.
//

import UIKit

class LeagueDetailsViewController: UIViewController ,LeagueDetailsViewProtocol,UICollectionViewDataSource , UICollectionViewDelegate  {
   
    
    @IBOutlet weak var eventsCollectionView: UICollectionView!
    
    @IBOutlet weak var latestResultsCollectionView: UICollectionView!
    
    @IBOutlet weak var teamsCollectionView: UICollectionView!
    var indicator :UIActivityIndicatorView?
    var eventssArray:[Event]?
    var latestResultsArray:[Event]?
    var teamsArray:[Team]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           <#code#>
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           <#code#>
       }

  
}
