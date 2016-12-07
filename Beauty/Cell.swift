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
    var blurView = UIVisualEffectView(effect: UIBlurEffect(style: .extraLight))
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
    
    func a(image: UIImage) -> UIImage {
        
        let blurRadius = 5
        let ciimage: CIImage = CIImage(image: image)!
        
        // Added "CIAffineClamp" filter
        let affineClampFilter = CIFilter(name: "CIAffineClamp")!
        affineClampFilter.setDefaults()
        affineClampFilter.setValue(ciimage, forKey: kCIInputImageKey)
        let resultClamp = affineClampFilter.value(forKey: kCIOutputImageKey)
        
        // resultClamp is used as input for "CIGaussianBlur" filter
        let filter: CIFilter = CIFilter(name:"CIGaussianBlur")!
        filter.setDefaults()
        filter.setValue(resultClamp, forKey: kCIInputImageKey)
        filter.setValue(blurRadius, forKey: kCIInputRadiusKey)
        
        
        let ciContext = CIContext(options: nil)
        let result = filter.value(forKey: kCIOutputImageKey) as! CIImage!
        let cgImage = ciContext.createCGImage(result!, from: ciimage.extent) // changed to ciiimage.extend
        
        let finalImage = UIImage(cgImage: cgImage!)
        return finalImage
    }
    
    
    
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
        insideView.addSubview(cornerView)
        insideView.addSubview(imageView)
        cornerView.addSubview(shadowImageView)
        cornerView.addSubview(blurView)
        cornerView.addSubview(titleLabel)
        cornerView.addSubview(contentLabel)
        
        insideView.backgroundColor = UIColor.clear
        insideView.snp.makeConstraints { (make) in
            make.width.equalToSuperview().offset(-40)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(20)
        }
        
        cornerView.layer.cornerRadius = 8
        cornerView.backgroundColor = UIColor.white
        cornerView.layer.masksToBounds = true
        cornerView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        imageView.layer.cornerRadius = 8
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: model.image)
        imageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(-40)
            make.centerX.equalToSuperview()
//            if note.imageWidth > note.imageHeight {
//                make.width.lessThanOrEqualToSuperview().offset(-20)
//                make.height.equalTo(imageView.snp.width).multipliedBy(3.0 / 4.0)
//            } else {
            make.height.equalTo(insideView.snp.width).offset(-40)
            make.width.equalTo(imageView.snp.height).multipliedBy(1)
//            }
        }
        
        shadowImageView.layer.cornerRadius = 8
        shadowImageView.layer.masksToBounds = true
        shadowImageView.image = imageView.image
        shadowImageView.snp.makeConstraints { (make) in
            make.size.equalTo(imageView).offset(-30)
            make.centerX.equalTo(imageView)
            make.centerY.equalTo(imageView).offset(30)
        }
        
        blurView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.textColor = UIColor.darkGray
        titleLabel.font = UIFont.systemFont(ofSize: 17)
        titleLabel.text = model.title
        titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(shadowImageView.snp.bottom).offset(-3)
            make.width.equalToSuperview().offset(-40)
        }
        
        contentLabel.numberOfLines = 0
        contentLabel.textColor = UIColor.darkGray
        contentLabel.font = UIFont.systemFont(ofSize: 13)
        contentLabel.text = model.content
        contentLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(15)
            make.width.equalTo(titleLabel)
            make.bottom.equalToSuperview().offset(-20)
        }
    }
}
