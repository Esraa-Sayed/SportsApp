//
//  LeagueViewCell.swift
//  SportsApp
//
//  Created by esraa on 2/1/22.
//  Copyright © 2022 esraa. All rights reserved.
//

import UIKit

class LeagueViewCell: UITableViewCell,LeaguesViewCell {
    func displayImag(imagURL: String) {
        leaguesImg.kf.setImage(with: URL(string: imagURL),placeholder: UIImage(named: "PlaceholderImg"))
        leaguesImg.layer.cornerRadius = 15
        leaguesImg.layer.masksToBounds = true
        leaguesImg.layer.cornerRadius = 5
    }
    
    func displayName(leaguesName: String) {
        leaguesTitle?.text = leaguesName
    }
    
    func displayVideo(videoURL: String) {
        
    }
    
    @IBOutlet weak var leaguesTitle: UILabel!
    @IBOutlet weak var leaguesImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func youTube(_ sender: UIButton) {
        
    }
  
    
    

}
