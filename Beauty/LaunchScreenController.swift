//
//  LaunchScreenController.swift
//  Beauty
//
//  Created by Nobel on 2016/11/16.
//  Copyright © 2016年 Nobel. All rights reserved.
//

import UIKit

class LaunchScreenController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageViewCenter: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.35, delay: 1, usingSpringWithDamping: 10, initialSpringVelocity: 10, options: UIViewAnimationOptions.curveEaseInOut, animations: {() -> Void in
            self.imageViewCenter.constant = -100
            self.imageView.layoutIfNeeded()
            self.imageView.alpha = 0
            self.view.backgroundColor = Beauty.tintColor()
        }, completion: {(Bool) -> Void in
            let stb = UIStoryboard(name: "Main", bundle: Bundle.main)
            let home = stb.instantiateViewController(withIdentifier: "Home")
            UIApplication.shared.keyWindow?.rootViewController = home
        })
    }
}
