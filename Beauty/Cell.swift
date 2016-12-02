//
//  HomePageCell.swift
//  Beauty
//
//  Created by Nobel on 2016/11/13.
//  Copyright © 2016年 Nobel. All rights reserved.
//

import UIKit
import SnapKit

class Cell: UICollectionViewCell {
    
    var cornerView = UIView()
    var insideView = UIView()
    var imageView = UIImageView()
    var shadowImageView = UIImageView()
    var titleLabel = UILabel()
    var contentLabel = UILabel()
    var imageViewWidth: NSLayoutConstraint!
    var imageViewHeight: NSLayoutConstraint!
    var model = Note()
    
//    init(note: Note) {
//        super.init(frame: CGRect.zero)
//    }
    // 后台线程处理所有model的blurimage model 添加blurimage key
    //http://stackoverflow.com/questions/34964043/gaussian-blur-on-full-screen
    func applyBlurEffect(image: UIImage) -> UIImage {
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 10, y: 10, width: image.size.width, height: image.size.height)
        let clearView = UIView(frame: CGRect(x: 0, y: 0, width: image.size.width + 20, height: image.size.height + 20))
        clearView.addSubview(imageView)
        
        UIGraphicsBeginImageContext(clearView.bounds.size);
        clearView.layer.render(in: UIGraphicsGetCurrentContext()!)
        let screenShot = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        let imageToBlur = CIImage(image: screenShot!)
        let blurfilter = CIFilter(name: "CIGaussianBlur")
        blurfilter?.setValue(imageToBlur, forKey: "inputImage")
        let resultImage = blurfilter?.value(forKey: "outputImage") as! CIImage
        let blurredImage = UIImage(ciImage: resultImage)
        return blurredImage
    }
    
    func fillWith(note: Note) {
        self.model = note
        addSubview(insideView)
        insideView.backgroundColor = UIColor.clear
        insideView.snp.makeConstraints { (make) in
            make.width.equalToSuperview().offset(-40)
            make.center.equalToSuperview()
        }
        
        insideView.addSubview(cornerView)
        cornerView.layer.cornerRadius = 5
        cornerView.backgroundColor = UIColor.white
        cornerView.layer.masksToBounds = true
        cornerView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        insideView.addSubview(imageView)
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: model.image)
        imageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(-20)
            make.centerX.equalToSuperview()
//            if note.imageWidth > note.imageHeight {
//                make.width.lessThanOrEqualToSuperview().offset(-20)
//                make.height.equalTo(imageView.snp.width).multipliedBy(3.0 / 4.0)
//            } else {
            make.height.equalTo(insideView.snp.width).offset(-40)
            make.width.equalTo(imageView.snp.height).multipliedBy(1)
//            }
        }
        
        insideView.insertSubview(shadowImageView, belowSubview: imageView)
        //        shadowImageView.layer.cornerRadius = 12
        //        shadowImageView.layer.masksToBounds = true
        shadowImageView.image = applyBlurEffect(image: imageView.image!)
        shadowImageView.snp.makeConstraints { (make) in
            make.top.equalTo(imageView).offset(5)
            make.width.equalTo(imageView).offset(10)
            make.height.equalTo(imageView).offset(10)
            make.centerX.equalTo(imageView)
        }
        
        cornerView.addSubview(titleLabel)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.textColor = UIColor.darkGray
        titleLabel.font = UIFont.systemFont(ofSize: 17)
        titleLabel.text = model.title
        titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(shadowImageView.snp.bottom).offset(20)
            make.width.equalToSuperview().offset(-40)
        }
        
        cornerView.addSubview(contentLabel)
        contentLabel.numberOfLines = 0
        contentLabel.textColor = UIColor.darkGray
        contentLabel.font = UIFont.systemFont(ofSize: 13)
        contentLabel.text = model.content
        contentLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(12)
            make.width.equalTo(titleLabel)
            make.bottom.equalToSuperview().offset(-20)
        }
    }
}
