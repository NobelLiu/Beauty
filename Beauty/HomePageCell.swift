//
//  HomePageCell.swift
//  Beauty
//
//  Created by Nobel on 2016/11/13.
//  Copyright © 2016年 Nobel. All rights reserved.
//

import UIKit

class HomePageCell: UICollectionViewCell {

    @IBOutlet weak var insideView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var shadowImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var imageViewWidth: NSLayoutConstraint!
    @IBOutlet weak var imageViewHeight: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        insideView.layer.cornerRadius = 5
        shadowImageView.layer.cornerRadius = 5
        shadowImageView.image = applyBlurEffect(image: imageView.image!)
    }
    
    func applyBlurEffect(image: UIImage) -> UIImage {
        let imageToBlur = CIImage(image: image)
        let blurfilter = CIFilter(name: "CIGaussianBlur")
        blurfilter?.setValue(imageToBlur, forKey: "inputImage")
        let resultImage = blurfilter?.value(forKey: "outputImage") as! CIImage
        let blurredImage = UIImage(ciImage: resultImage)
        return blurredImage
    }

}
