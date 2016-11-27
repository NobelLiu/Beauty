//
//  NewNoteController.swift
//  Beauty
//
//  Created by Nobel on 2016/11/15.
//  Copyright © 2016年 Nobel. All rights reserved.
//

import UIKit

class NewNoteController: UIViewController {
    
    var gradientLayer: CAGradientLayer!
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        createGradientLayer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismiss(_ sender: UIGestureRecognizer) {
//        if sender.isKind(of: UITapGestureRecognizer()) {
            self.dismiss(animated: true, completion: nil)
//        } else {
//            let pan = sender as! UIPanGestureRecognizer
//        }
    }
    
    func createGradientLayer() {
        gradientLayer = CAGradientLayer()
        var frame = view.bounds
        frame.size.height /= 2
        gradientLayer.frame = frame
        gradientLayer.colors = [Beauty.tintColor().cgColor, UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1).cgColor]
        view.layer.insertSublayer(gradientLayer, below: imageView.layer)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
