//
//  SplashViewController.swift
//  SportsApp
//
//  Created by Mohamed Toba on 2/9/22.
//  Copyright © 2022 esraa. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super .viewDidLayoutSubviews()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3 , execute: {self.animate()
        })
    }
    
    
    private func animate(){
        UIView.animate(withDuration: 1, animations: {
            let size = self.view.frame.size.width*3
            let diffX = size - self.view.frame.size.width
            let diffY = self.view.frame.size.height - size
            
            self.imageView.frame = CGRect(
                x: -(diffX/2)
                , y: diffY/2
                , width: size
                , height: size
            )
        })
        
        UIView.animate(withDuration: 1.5, animations: {
            self.imageView.alpha = 0
        }, completion: {done in
            if done {
                DispatchQueue.main.asyncAfter(deadline: .now()+0.3, execute: {
                   let VC =  self.storyboard?.instantiateViewController(withIdentifier: "CollectionViewFirstScreen") as! CollectionFirstScreen
                    VC.modalTransitionStyle = .crossDissolve
                    VC.modalPresentationStyle = .fullScreen
                   self.present(VC, animated: true, completion: nil)
                    
                })
            }
        })
    }

    
}
