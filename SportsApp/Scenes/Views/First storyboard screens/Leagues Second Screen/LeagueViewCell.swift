//
//  LeagueViewCell.swift
//  SportsApp
//
//  Created by esraa on 2/1/22.
//  Copyright © 2022 esraa. All rights reserved.
//

import UIKit

class LeagueViewCell: UITableViewCell,LeaguesViewCell {
    var youtubePressed: (() -> (String))?
    @IBOutlet weak var ViewInCell: UIView!
    @IBOutlet weak var leaguesTitle: UILabel!
    @IBOutlet weak var leaguesImg: UIImageView!
    @IBAction func youTube(_ sender: UIButton)
    {
        let result:String = (youtubePressed?())!
        if(result ==  "No internet connection")
        {
            Toast.showToast(controller: parentViewController!, message: "No internet connection" , seconds: 2)
                      
        }
        else
        {
            if(result == "No link found")
            {
                Toast.showToast(controller: parentViewController!, message: "No link found", seconds: 2)
            }
            else
            {
                //Go to youtube
                  let appURL =  NSURL(string:"youtube://"+result)
                  let webURL =  NSURL(string:"https://"+result)
                  let application = UIApplication.shared

                   if application.canOpenURL(appURL! as URL)
                   {
                       application.open(appURL! as URL)
                      }
                   else {
                          // if Youtube app is not installed, open URL inside Safari
                       application.open(webURL! as URL)
                      }
            }
        }
    }
}
extension LeagueViewCell {
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
        leaguesImg.kf.setImage(with: URL(string: imagURL),placeholder: UIImage(named: "PlaceholderImg"))
        leaguesImg.layer.cornerRadius = 15
        leaguesImg.layer.masksToBounds = true
        leaguesImg.layer.cornerRadius = 5
    }
    
    func displayName(leaguesName: String) {
        leaguesTitle?.text = leaguesName
    }
    
}
