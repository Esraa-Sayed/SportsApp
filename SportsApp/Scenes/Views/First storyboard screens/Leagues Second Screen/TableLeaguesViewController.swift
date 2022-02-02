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
    var sportName:String = ""
    var presenter :AllLeaguesVCPresenter!
    var indicator :UIActivityIndicatorView?
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Leagues"

        indicator = UIActivityIndicatorView(style: .large)
        indicator?.center = self.view.center
        self.view.addSubview(indicator!)
        presenter = AllLeaguesVCPresenter(view: self)
        presenter.setSportName(sportName: sportName)
       if !presenter.viewDidLoad()
       {
           Toast.showToast(controller: self, message : "No internet connection", seconds: 2.0)
       }
        //viewInCell.layer.cornerRadius = 10
        
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
        /*let maskLayer = CALayer()
        maskLayer.cornerRadius = 8   //if you want round edges
        maskLayer.backgroundColor = UIColor.black.cgColor
        maskLayer.frame = CGRect(x: cell.bounds.origin.x, y: cell.bounds.origin.y, width: cell.bounds.width, height: cell.bounds.height).insetBy(dx: 0, dy: verticalPadding/2)
        cell.layer.mask = maskLayer*/
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
        headerView.backgroundColor = UIColor(red: 0.0/255.0, green: 129.0/255.0, blue: 138.0/255.0, alpha: 1.0)
        return headerView
    }
}
