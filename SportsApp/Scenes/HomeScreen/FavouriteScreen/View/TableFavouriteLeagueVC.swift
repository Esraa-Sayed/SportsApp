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
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.getFavLeaguesSectionCount()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getFavLeaguesRowCount(index: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "FavouriteLeaguesViewCell", for: indexPath) as! FavouriteLeaguesViewCell

        presenter.configure(cell: &cell, forSection: indexPath.section, forIndex: indexPath.row)
        let _: CGFloat = 8
        cell.viewInCell.layer.cornerRadius = 8
        return cell
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return presenter.sectionName(section: section)
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectedSectionAtIndex(section: indexPath.section, row: indexPath.row)
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 100
       }
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int){

        view.tintColor = UIColor.clear
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.white
        header.textLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        header.textLabel?.frame = header.frame
        header.textLabel?.textAlignment = NSTextAlignment.center
    }
       override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
           return 48
       }
    override func viewWillAppear(_ animated: Bool) {
         if !presenter.viewDidLoad()
           {
               Toast.showToast(controller: self, message : "No Data found", seconds: 2.0)
           }
        tableView.reloadData()
    }
}
