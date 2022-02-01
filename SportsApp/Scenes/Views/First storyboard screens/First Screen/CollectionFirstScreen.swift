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
        if !presenter.viewDidLoad()
        {
            Toast.showToast(controller: self, message : "No internet connection", seconds: 4.0)
        }
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return presenter.getSportsCount()
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
    
        presenter.configure(cell: cell, forIndex: indexPath.row)
    
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.didSelectedRow(index: indexPath.row)
    }

}
