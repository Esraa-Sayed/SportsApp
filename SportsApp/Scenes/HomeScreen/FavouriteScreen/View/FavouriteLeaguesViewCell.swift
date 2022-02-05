//
//  FavouriteLeaguesViewCell.swift
//  SportsApp
//
//  Created by esraa on 2/2/22.
//  Copyright © 2022 esraa. All rights reserved.
//

import UIKit

class FavouriteLeaguesViewCell: UITableViewCell,FavouriteViewCell {
    @IBOutlet weak var favouriteLeagueImg: UIImageView!
     @IBOutlet weak var favLeagueText: UILabel!
    @IBAction func favLeagueButton(_ sender: UIButton) {
        
    }
    var youtubePressed: (() -> (String))?
}
extension FavouriteLeaguesViewCell
{
    var parentViewController: UIViewController?
    {
        var parentResponder: UIResponder? = self
        while parentResponder != nil
        {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController
            {
                return viewController
            }
        }
        return nil
    }
    func displayImag(imagURL: String) {
       favouriteLeagueImg.kf.setImage(with: URL(string: imagURL),placeholder: UIImage(named: "PlaceholderImg"))
        favouriteLeagueImg.layer.cornerRadius = 15
        favouriteLeagueImg.layer.masksToBounds = true
       favouriteLeagueImg.layer.cornerRadius = 5
    }
    
    func displayName(leaguesName: String) {
        favLeagueText?.text = leaguesName
    }
}
