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
    func displayImag(imagURL: String) {
        sportImage.kf.setImage(with: URL(string: imagURL),placeholder: UIImage(named: "PlaceholderImg"))
    }
    
    @IBOutlet weak var sportImage: UIImageView!
    
}
