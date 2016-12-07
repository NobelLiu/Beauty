//
//  NewNoteController.swift
//  Beauty
//
//  Created by Nobel on 2016/11/15.
//  Copyright © 2016年 Nobel. All rights reserved.
//

import UIKit

class ContainerController: UIViewController {
    
    var gradientLayer: CAGradientLayer!
    
    @IBOutlet weak var centerY: NSLayoutConstraint!
    @IBOutlet weak var containnerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        centerY.constant = self.view.frame.size.height
        containnerView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        containnerView.alpha = 0
        self.view.layoutIfNeeded()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.35, delay: 0, usingSpringWithDamping: 0.85, initialSpringVelocity: 5, options: UIViewAnimationOptions.curveEaseInOut, animations: {() -> Void in
            self.centerY.constant = 0
            self.containnerView.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.containnerView.alpha = 1
            self.view.backgroundColor = UIColor(white: 0, alpha: 0.25)
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.75, initialSpringVelocity: 5, options: UIViewAnimationOptions.curveEaseInOut, animations: {() -> Void in
//            self.centerY.constant = self.view.frame.size.height
//            self.containnerView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
//            self.containnerView.alpha = 0
//            self.view.backgroundColor = UIColor(white: 0, alpha: 0)
//            self.view.layoutIfNeeded()
//        })
    }
    
}

class NewNoteController: UIViewController {
    
    var gradientLayer: CAGradientLayer!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var chooseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        createGradientLayer()
    }
    
    @IBAction func dismiss(_ sender: AnyObject) {
        let _ = navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: Any) {
        dismiss(UIButton())
    }
    
    @IBAction func choosePhoto(_ sender: Any) {
        self.navigationController?.pushViewController(UIViewController(), animated: true)
    }
    
    func createGradientLayer() {
        gradientLayer = CAGradientLayer()
        var frame = view.bounds
        frame.size.height /= 2
        gradientLayer.frame = frame
        gradientLayer.colors = [Beauty.tintColor().cgColor, UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1).cgColor]
        //        view.layer.insertSublayer(gradientLayer, below: imageView.layer)
        view.layer.addSublayer(gradientLayer)
    }
    
}
