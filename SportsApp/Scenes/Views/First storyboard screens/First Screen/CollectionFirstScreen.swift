//
//  CollectionViewFirstScreen.swift
//  SportsApp
//
//  Created by esraa on 1/31/22.
//  Copyright © 2022 esraa. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class CollectionFirstScreen: UICollectionViewController {
    var presenter :AllSportsVCPresenter!
    var indicator :UIActivityIndicatorView?
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sports"
        indicator = UIActivityIndicatorView(style: .large)
        indicator?.center = self.view.center
        self.view.addSubview(indicator!)
        
        presenter = AllSportsVCPresenter(view: self)
        if !presenter.viewDidLoad(indicator: indicator)
        {
            showToast(controller: self, message : "No internet connection", seconds: 4.0)
        }
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return presenter.getSportsCount()
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
    
        presenter.configure(cell: cell, forIndex: indexPath.row)
    
        return cell
    }
    func showToast(controller: UIViewController, message : String, seconds: Double) {
        let alert = UIAlertController(title: nil, message:nil, preferredStyle: .alert)
        //rgb(0, 129, 138)
        alert.view.backgroundColor =  UIColor(red: 100.0/255.0, green: 130.0/255.0, blue: 230.0/255.0, alpha: 0.8)
       
        let titleAttributes = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 20)!, NSAttributedString.Key.foregroundColor:UIColor(red: 0.0/255.0, green: 129.0/255.0, blue: 138.0/255.0, alpha: 1.0)]
        let titleString = NSAttributedString(string: message, attributes: titleAttributes)
        alert.setValue(titleString, forKey: "attributedTitle")
        alert.view.alpha = 0.9
        alert.view.layer.cornerRadius = 15

        controller.present(alert, animated: true)

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
            alert.dismiss(animated: true)
        }
    }
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
