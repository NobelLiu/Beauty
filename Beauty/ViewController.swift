//
//  ViewController.swift
//  Beauty
//
//  Created by Nobel on 2016/11/13.
//  Copyright © 2016年 Nobel. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var gradientLayer: CAGradientLayer!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: "HomePageCell", bundle: Bundle.main), forCellWithReuseIdentifier: "cell")
        createGradientLayer()
        let realm = try! Realm()
        
        for idx in 0...10 {
            let note = Note()
            note.image = "tmp1"
            note.title = "小家伙第\(idx)次咬我头发"
            note.content = "这是目前的第\(idx)篇记事篇记事篇记事篇记事篇记事篇记事篇记事篇记事篇记事篇记事篇记事篇记事篇记事篇记事篇记事篇记事篇记事篇记事篇记事篇记事篇记事篇记事"
            try! realm.write {
                realm.add(note)
            }
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        var frame = view.frame
        frame.origin.y = frame.size.height
        view.frame = frame
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.35, delay: 0, usingSpringWithDamping: 10, initialSpringVelocity: 10, options: UIViewAnimationOptions.curveEaseInOut, animations: {() -> Void in
            var frame = self.view.frame
            frame.origin.y = 0
            self.view.frame = frame
        }, completion: nil)
    }
    
    func createGradientLayer() {
        gradientLayer = CAGradientLayer()
        var frame = view.bounds
        frame.size.height /= 2
        gradientLayer.frame = frame
        gradientLayer.colors = [Beauty.tintColor().cgColor, UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1).cgColor]
        view.layer.insertSublayer(gradientLayer, below: collectionView.layer)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let realm = try! Realm()
        let notes = realm.objects(Note.self)
        return notes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return self.collectionView.bounds.size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let realm = try! Realm()
        let notes = realm.objects(Note.self)
        let note = notes[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomePageCell
        cell.fillWith(note: note)
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

