//
//  LeagueDetailsViewController.swift
//  SportsApp
//
//  Created by Mohamed Toba on 1/31/22.
//  Copyright © 2022 esraa. All rights reserved.
//

import UIKit

class LeagueDetailsViewController: UIViewController ,LeagueDetailsViewProtocol,UICollectionViewDataSource , UICollectionViewDelegate  {
   
   
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)

    }
    
    @IBOutlet weak var eventsCollectionView: UICollectionView!
    
    @IBOutlet weak var latestResultsCollectionView: UICollectionView!
    
    @IBOutlet weak var teamsCollectionView: UICollectionView!
    
    public var leaguePresenter : LeagueDetailsPresenter?

   let indicator = UIActivityIndicatorView(style: .large)
    var league : Country?
    var checkNet :Bool?
    
    override func viewDidAppear(_ animated: Bool) {
        if !(checkNet!) {
             Toast.showToast(controller: self, message : "No internet connection", seconds: 4.0)
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        leaguePresenter = LeagueDetailsPresenter(view:self )
        
        self.eventsCollectionView.delegate = self
        self.eventsCollectionView.dataSource = self
              
        self.latestResultsCollectionView.delegate = self
        self.latestResultsCollectionView.dataSource = self
              
        self.teamsCollectionView.delegate = self
        self.teamsCollectionView.dataSource = self
       
        checkNet = leaguePresenter!.viewDidLoad(league: league!)
        
               
    }
   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
             if (collectionView == self.eventsCollectionView) {
                return  leaguePresenter!.getEventsCount()
           } else if (collectionView == self.latestResultsCollectionView){
                return  leaguePresenter!.getLatestResultsCount()
                
             } else {
                return  leaguePresenter!.getTeamsCount()
           }
       }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           if collectionView == self.teamsCollectionView {
               
           }
       }
       
       func numberOfSections(in collectionView: UICollectionView) -> Int {
           if (collectionView == self.eventsCollectionView) {
               return 1
           } else if (collectionView == self.latestResultsCollectionView){
               return  1
           } else {
               return 1
           }
       }
       
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           if collectionView == self.latestResultsCollectionView {
               let    cell = latestResultsCollectionView.dequeueReusableCell(withReuseIdentifier: "latestResultCell", for: indexPath) as! LastResultCollectionViewCell
               leaguePresenter?.configureLatestResultsCell(cell: cell, forIndex: indexPath.row)
               return cell
           }
           else if collectionView == self.eventsCollectionView {
           let   cell = eventsCollectionView.dequeueReusableCell(withReuseIdentifier: "eventCell", for: indexPath) as! EventCollectionViewCell

            leaguePresenter?.configureEventCell(cell: cell, forIndex: indexPath.row)
               return cell
               
           }else  if collectionView == self.teamsCollectionView  {
                 let  cell = teamsCollectionView.dequeueReusableCell(withReuseIdentifier: "teamCell", for: indexPath) as! TeamCollectionViewCell
            leaguePresenter?.configureTeamCell(cell: cell, forIndex: indexPath.row)

                return cell
               
           }

           return UICollectionViewCell()
       }

  
}
