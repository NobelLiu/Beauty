//
//  HomePageCell.swift
//  Beauty
//
//  Created by Nobel on 2016/11/13.
//  Copyright © 2016年 Nobel. All rights reserved.
//

import UIKit

class Cell: UICollectionViewCell {
    
    var cornerView = UIView()
    var insideView = UIView()
    var imageView = UIImageView()
    var shadowImageView = UIImageView()
    var titleLabel = UILabel()
    var contentLabel = UILabel()
    var imageViewWidth: NSLayoutConstraint!
    var imageViewHeight: NSLayoutConstraint!
    var note = Note()
    
    init(n: Note) {
        super.init(frame: CGRect.zero)
        note = n
        addSubview(insideView)
        insideView.backgroundColor = UIColor.clear
        
        insideView.addSubview(cornerView)
        cornerView.layer.cornerRadius = 12
        cornerView.layer.masksToBounds = true
        
        insideView.addSubview(shadowImageView)
        imageView.layer.cornerRadius = 12
        imageView.layer.masksToBounds = true
        
        insideView.addSubview(imageView)
        imageView.layer.cornerRadius = 12
        imageView.layer.masksToBounds = true
        
        cornerView.addSubview(titleLabel)
        titleLabel.textAlignment = .center
        titleLabel.textColor = UIColor.darkGray
        titleLabel.font = UIFont.systemFont(ofSize: 17)
        
        cornerView.addSubview(contentLabel)
        contentLabel.textAlignment = .center
        contentLabel.textColor = UIColor.darkGray
        contentLabel.font = UIFont.systemFont(ofSize: 13)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func applyBlurEffect(image: UIImage) -> UIImage {
        let imageToBlur = CIImage(image: image)
        let blurfilter = CIFilter(name: "CIGaussianBlur")
        blurfilter?.setValue(imageToBlur, forKey: "inputImage")
        let resultImage = blurfilter?.value(forKey: "outputImage") as! CIImage
        let blurredImage = UIImage(ciImage: resultImage)
        return blurredImage
    }
    
    func fillWith(note: Note) {
        self.note = note
        
        titleLabel.text = note.title
        contentLabel.text = note.content
        imageView.image = UIImage(named: note.image)
        
        shadowImageView.image = applyBlurEffect(image: imageView.image!)
    }

}
