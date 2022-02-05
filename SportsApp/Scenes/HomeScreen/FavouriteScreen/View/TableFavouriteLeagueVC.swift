//
//  TableFavouriteLeagueVC.swift
//  SportsApp
//
//  Created by esraa on 2/2/22.
//  Copyright © 2022 esraa. All rights reserved.
//

import UIKit

class TableFavouriteLeagueVC: UITableViewController {
    var sportName:String = ""
    var presenter :FavouriteLeaguesPresenter!
    var indicator :UIActivityIndicatorView?
    override func viewDidLoad() {
        super.viewDidLoad()
        indicator = UIActivityIndicatorView(style: .large)
        indicator?.center = self.view.center
        self.view.addSubview(indicator!)
        presenter = FavouriteLeaguesPresenter(view: self)
        if !presenter.viewDidLoad()
        {
            Toast.showToast(controller: self, message : "No Data found", seconds: 2.0)
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return presenter.getFavLeaguesSectionCount()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return presenter.getFavLeaguesRowCount(index: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "FavouriteLeaguesViewCell", for: indexPath) as! FavouriteLeaguesViewCell

        presenter.configure(cell: &cell, forSection: indexPath.section, forIndex: indexPath.row)

        return cell
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return presenter.sectionName(section: section)
    }
}
