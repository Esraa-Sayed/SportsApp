//
//  FavouriteLeaguesViewCell.swift
//  SportsApp
//
//  Created by esraa on 2/2/22.
//  Copyright © 2022 esraa. All rights reserved.
//

import UIKit

class FavouriteLeaguesViewCell: UITableViewCell {
    @IBOutlet weak var favouriteLeagueImg: UIImageView!
    

    @IBAction func favLeagueButton(_ sender: UIButton) {
    }
    @IBOutlet weak var favLeagueText: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
