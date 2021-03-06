//
//  LeagueDetailsViewController.swift
//  SportsApp
//
//  Created by Mohamed Toba on 1/31/22.
//  Copyright © 2022 esraa. All rights reserved.
//

import UIKit

class LeagueDetailsViewController: UIViewController ,LeagueDetailsViewProtocol,UICollectionViewDataSource , UICollectionViewDelegate  {
   
    
   
    @IBOutlet weak var addLeagueToFavourite: UIButton!
    
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
    let refreshControl = UIRefreshControl()

    
    @IBOutlet weak var ScrollView: UIScrollView!
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
        setUpFavorite()
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)]
       refreshControl.attributedTitle = NSAttributedString(string: "Refresh", attributes: attributes)
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
       refreshControl.tintColor = .white
       eventsCollectionView.refreshControl = refreshControl
       latestResultsCollectionView.refreshControl = refreshControl
       teamsCollectionView.refreshControl = refreshControl
               
    }
    
    @objc func refresh(_ sender: AnyObject) {
        if !(leaguePresenter?.viewDidLoad(league: league!))!
             {
                 Toast.showToast(controller: self, message : "No internet connection", seconds: 1.0)
             }
        teamsCollectionView.reloadData()
        latestResultsCollectionView.reloadData()
        eventsCollectionView.reloadData()
           refreshControl.endRefreshing()
          
       }
    
    func setUpFavorite(){
           if ((leaguePresenter?.isFovorite(leagueId:Int(league!.idLeague!) ?? 0 ))!) {
               if #available(iOS 13.0, *) {
                addLeagueToFavourite.setImage(UIImage(systemName: "star.fill"), for: UIControl.State.normal)
               }
           }else {
               if #available(iOS 13.0, *) {
                addLeagueToFavourite.setImage(UIImage(systemName: "star"), for: UIControl.State.normal)
              }
           }
       }
       func addToFavorites(){
           leaguePresenter?.addTofaVorite(league: league!)
       }
       func RemoveFromFavorites(){
           leaguePresenter?.removeFromfaVorite(league: league!)
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
               leaguePresenter!.didSelectedRow(index: indexPath.row)
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
            cell.thumbImage.kf.setImage(with: URL(string: latestResultsArray![indexPath.row].thumbURL),placeholder: UIImage(named: "newPlaceHolder"))
            cell.layer.cornerRadius = 20

               return cell
           }
           else if collectionView == self.eventsCollectionView {
           let   cell = eventsCollectionView.dequeueReusableCell(withReuseIdentifier: "eventCell", for: indexPath) as! EventCollectionViewCell

            cell.eventName.text = eventsArray?[indexPath.row].eventName  ?? ""
            cell.eventDate.text = eventsArray![indexPath.row].eventDate
            cell.eventTime.text = eventsArray![indexPath.row].eventTime
            cell.layer.cornerRadius = 20

               return cell
               
           }else  if collectionView == self.teamsCollectionView  {
                 let  cell = teamsCollectionView.dequeueReusableCell(withReuseIdentifier: "teamCell", for: indexPath) as! TeamCollectionViewCell
               cell.teamImage.kf.indicatorType = .activity
            cell.teamImage.kf.setImage(with: URL(string: teamsArray![indexPath.row].teamImage!),placeholder: UIImage(named: "PlaceholderImg"))
                return cell
               
           }

           return UICollectionViewCell()
       }

    
  
    @IBAction func addLeagueToFavourite(_ sender: Any) {
        if (!((leaguePresenter?.isFovorite(leagueId: Int(league!.idLeague!) ?? 0 ))!)){
           if #available(iOS 13.0, *) {
               
            addLeagueToFavourite.setImage(UIImage(systemName: "star.fill"), for: UIControl.State.normal)
            leaguePresenter?.addTofaVorite(league: league!)
           } else {
             
           }
       }else {
           if #available(iOS 13.0, *) {
              
            addLeagueToFavourite.setImage(UIImage(systemName: "star"), for: UIControl.State.normal)
              leaguePresenter?.removeFromfaVorite(league: league!)
          } else {
            
          }
       }
    }
    
    
}
