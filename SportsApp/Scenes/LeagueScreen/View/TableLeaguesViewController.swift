//
//  TableLeaguesViewController.swift
//  SportsApp
//
//  Created by esraa on 1/31/22.
//  Copyright © 2022 esraa. All rights reserved.
//

import UIKit

class TableLeaguesViewController: UITableViewController {
    @IBOutlet var myTable: UITableView!
    let refreshControlTable = UIRefreshControl()
    var sportName:String = ""
    var presenter :AllLeaguesVCPresenter!
    var indicator :UIActivityIndicatorView?
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Leagues"

        indicator = UIActivityIndicatorView(style: .large)
        indicator?.center = self.view.center
        self.view.addSubview(indicator!)
        
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)]
               refreshControlTable.attributedTitle = NSAttributedString(string: "Refresh", attributes: attributes)
                refreshControlTable.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
               refreshControlTable.tintColor = .white
             tableView.refreshControl =  refreshControlTable
        
        presenter = AllLeaguesVCPresenter(view: self)
        presenter.setSportName(sportName: sportName)
       if !presenter.viewDidLoad()
       {
           Toast.showToast(controller: self, message : "No internet connection", seconds: 2.0)
       }
        //viewInCell.layer.cornerRadius = 10
        
    }
    @objc func refresh(_ sender: AnyObject) {
        if !presenter.viewDidLoad()
          {
              Toast.showToast(controller: self, message : "No internet connection", seconds: 1.0)
          }
        tableView.reloadData()
        refreshControlTable.endRefreshing()
       
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return presenter.getLeaguesCount()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "LeagueViewCell", for: indexPath) as! LeagueViewCell
        presenter.configure(cell: &cell, forIndex: indexPath.section)
        let verticalPadding: CGFloat = 8
        cell.ViewInCell.layer.cornerRadius = 8

        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectedRow(index: indexPath.section)
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 16
    }
    // Make the background color show through
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        //rgb(0, 129, 138)
        headerView.backgroundColor = UIColor(red: 0.0/255.0, green: 95.0/255.0, blue: 91.0/255.0, alpha: 1.0)
        return headerView
    }
}
