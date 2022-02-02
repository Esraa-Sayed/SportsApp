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
    
   let indicator = UIActivityIndicatorView(style: .large)
    var eventsArray:[Event]?
    var latestResultsArray:[Event]?
    var teamsArray:[Team]?
    var league : Country?
    
    var leaguePresenter:LeagueDetailsProtocol?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "League Details"
        self.tabBarController?.tabBar.isHidden = true

        self.eventsCollectionView.delegate = self
        self.eventsCollectionView.dataSource = self
              
        self.latestResultsCollectionView.delegate = self
        self.latestResultsCollectionView.dataSource = self
              
        self.teamsCollectionView.delegate = self
        self.teamsCollectionView.dataSource = self
              
        self.league?.strLeague = self.league?.strLeague.replacingOccurrences(of: "", with: "%20") ?? ""
        print(league!.strLeague)

       leaguePresenter = LeagueDetailsPresenter(view: self)
        
        self.showIndicator()
             if CheckInternetConnectivity.isConnectedToInternet {
                 print("Yes! internet is available.")
                leaguePresenter?.loadEvents(id:"")
                leaguePresenter?.loadLatestResults(id:league!.strLeague)
                leaguePresenter?.loadTeams(id: "")
             }
             else
             {
                 self.hideIndicator()
                 self.alertMessage()
      
        }
               
    }
   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
             if (collectionView == self.eventsCollectionView) {
                return  eventsArray?.count ?? 0
           } else if (collectionView == self.latestResultsCollectionView){
                return  latestResultsArray?.count ?? 0
             } else {
                return  teamsArray?.count ?? 0
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
               cell.teamName.text = latestResultsArray![indexPath.row].eventName
               cell.teamScore.text = String (describing: latestResultsArray![indexPath.row].intHomeScore )
                   + " VS " + String (describing: latestResultsArray![indexPath.row].intAwayScore )
               cell.teamDate.text = latestResultsArray![indexPath.row].eventDate
               cell.teamTime.text = latestResultsArray![indexPath.row].eventTime
               print("cell latest result")
               return cell
           }
           else if collectionView == self.eventsCollectionView {
           let   cell = eventsCollectionView.dequeueReusableCell(withReuseIdentifier: "eventCell", for: indexPath) as! EventCollectionViewCell

            cell.eventName.text = eventsArray?[indexPath.row].eventName  ?? ""
            cell.eventDate.text = eventsArray![indexPath.row].eventDate
               cell.eventTime.text = eventsArray![indexPath.row].eventTime
            print(eventsArray![indexPath.row].eventDate)
               return cell
               
           }else  if collectionView == self.teamsCollectionView  {
                 let  cell = teamsCollectionView.dequeueReusableCell(withReuseIdentifier: "teamCell", for: indexPath) as! TeamCollectionViewCell
               cell.teamImage.kf.indicatorType = .activity
               cell.teamImage.kf.setImage(with: URL(string: teamsArray![indexPath.row].imageURL))
            print(teamsArray![indexPath.row].imageURL)
                return cell
               
           }

           return UICollectionViewCell()
       }

  
}
