//
//  ViewController.swift
//  SportsApp
//
//  Created by esraa on 1/27/22.
//  Copyright © 2022 esraa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let api:SportsAPiProtocol = SportsAPi()
        api.getSports { [weak self](result) in
                switch result{
                case .success(let response):
                    var sports = response?.sports
                    print(sports?[0].idSport)
                    print(sports?.count)
                case .failure(_):
                    print("Error")
                }
            }
        
    }


}

