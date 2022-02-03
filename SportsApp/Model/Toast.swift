//
//  Toast.swift
//  SportsApp
//
//  Created by esraa on 2/1/22.
//  Copyright © 2022 esraa. All rights reserved.
//

import Foundation
import UIKit
class Toast {
  static func showToast(controller: UIViewController, message : String, seconds: Double) {
        let alert = UIAlertController(title: nil, message:nil, preferredStyle: .alert)
        //rgb(0, 129, 138)
        alert.view.backgroundColor =  UIColor(red: 100.0/255.0, green: 130.0/255.0, blue: 230.0/255.0, alpha: 0.8)
       
        let titleAttributes = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 20)!, NSAttributedString.Key.foregroundColor:UIColor(red: 0.0/255.0, green: 129.0/255.0, blue: 138.0/255.0, alpha: 1.0)]
        let titleString = NSAttributedString(string: message, attributes: titleAttributes)
        alert.setValue(titleString, forKey: "attributedTitle")
        alert.view.layer.cornerRadius = 15
        controller.present(alert, animated: true)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
            alert.dismiss(animated: true)
        }
    }
}
