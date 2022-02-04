//
//  TeamDetailsViewController.swift
//  SportsApp
//
//  Created by Mohamed Toba on 2/2/22.
//  Copyright © 2022 esraa. All rights reserved.
//

import UIKit

class TeamDetailsViewController: UIViewController {

    var myTeam : TeamDetailsModel?

    @IBAction func backButton(_ sender: Any) {

        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBOutlet weak var staduimImage: UIImageView!
    
    @IBOutlet weak var teamLogo: UIImageView!
    
    @IBOutlet weak var staduimName: UILabel!
    
    @IBOutlet weak var staduimLocation: UILabel!
    
    @IBOutlet weak var teamName: UILabel!
    
    @IBOutlet weak var formedYear: UILabel!
    
    @IBOutlet weak var leagueName: UILabel!
    
    @IBOutlet weak var countryName: UILabel!
    
    @IBOutlet weak var locationView: UIView!
    
    @IBOutlet weak var stadeNameView: UIView!
    var team : TeamDetailsModel?
    
    @IBOutlet weak var nameView: UIView!
    
    @IBOutlet weak var detailview: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
    
      staduimName.text = team?.stadiumName
      staduimLocation.text = team?.stadiumLocation
      teamName.text = team?.teamName
      formedYear.text = team?.formedYear
      countryName.text = team?.countryTeam
    leagueName.text = team?.leagueName
     staduimImage.kf.setImage(with: URL(string: team!.stadiumImage!),placeholder: UIImage(named: "PlaceholderImg"))
     teamLogo.kf.setImage(with: URL(string: team!.teamImage!),placeholder: UIImage(named: "PlaceholderImg"))
        
        
        detailview.layer.cornerRadius = 20
        staduimImage.layer.cornerRadius = 40
        locationView.layer.cornerRadius = 20
        stadeNameView.layer.cornerRadius = 20
        nameView.layer.cornerRadius = 20

        
}
    

    

}
