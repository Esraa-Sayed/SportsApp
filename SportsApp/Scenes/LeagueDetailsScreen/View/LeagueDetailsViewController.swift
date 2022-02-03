//
//  LeagueDetailsViewController.swift
//  SportsApp
//
//  Created by Mohamed Toba on 1/31/22.
//  Copyright © 2022 esraa. All rights reserved.
//

import UIKit

class LeagueDetailsViewController: UIViewController ,LeagueDetailsViewProtocol,UICollectionViewDataSource , UICollectionViewDelegate, UIScrollViewDelegate  {
   
   
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)

    }
    
    @IBOutlet weak var eventsCollectionView: UICollectionView!
    
    @IBOutlet weak var latestResultsCollectionView: UICollectionView!
    
    @IBOutlet weak var teamsCollectionView: UICollectionView!
    
    public var leaguePresenter : LeagueDetailsPresenter?

   let indicator = UIActivityIndicatorView(style: .large)
    var eventsArray:[Event]?
    var latestResultsArray:[Event]?
    var teamsArray:[TeamDetailsModel]?
    var league : Country?
    var checkNet :Bool?
    
    @IBOutlet weak var ScrollView: UIScrollView!
    override func viewDidAppear(_ animated: Bool) {
        if !(checkNet!) {
             Toast.showToast(controller: self, message : "No internet connection", seconds: 4.0)
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        leaguePresenter = LeagueDetailsPresenter(view:self )
        self.ScrollView.delegate = self
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
            cell.thumbImage.kf.setImage(with: URL(string: latestResultsArray![indexPath.row].thumbURL),placeholder: UIImage(named: "PlaceholderImg"))
               return cell
           }
           else if collectionView == self.eventsCollectionView {
           let   cell = eventsCollectionView.dequeueReusableCell(withReuseIdentifier: "eventCell", for: indexPath) as! EventCollectionViewCell

            cell.eventName.text = eventsArray?[indexPath.row].eventName  ?? ""
            cell.eventDate.text = eventsArray![indexPath.row].eventDate
            cell.eventTime.text = eventsArray![indexPath.row].eventTime
               return cell
               
           }else  if collectionView == self.teamsCollectionView  {
                 let  cell = teamsCollectionView.dequeueReusableCell(withReuseIdentifier: "teamCell", for: indexPath) as! TeamCollectionViewCell
               cell.teamImage.kf.indicatorType = .activity
            cell.teamImage.kf.setImage(with: URL(string: teamsArray![indexPath.row].teamImage!),placeholder: UIImage(named: "PlaceholderImg"))
                return cell
               
           }

           return UICollectionViewCell()
       }

  
}
