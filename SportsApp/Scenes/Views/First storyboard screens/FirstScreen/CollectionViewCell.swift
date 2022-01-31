//
//  CollectionViewCell.swift
//  SportsApp
//
//  Created by esraa on 1/31/22.
//  Copyright © 2022 esraa. All rights reserved.
//

import UIKit
import Kingfisher
class CollectionViewCell: UICollectionViewCell,sportViewCell {
    @IBOutlet weak var viewToTitle: UIView!
    @IBOutlet weak var sportName: UILabel!
    @IBOutlet weak var sportImage: UIImageView!
    func displayImag(imagURL: String) {
        sportImage.kf.setImage(with: URL(string: imagURL),placeholder: UIImage(named: "PlaceholderImg"))
         sportImage.layer.cornerRadius = 15
        sportImage.layer.masksToBounds = true
        viewToTitle.layer.cornerRadius = 15
    }
    func displayName(sportName:String)
    {
        self.sportName.text = sportName
    }
    
}
