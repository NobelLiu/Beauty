//
//  PingTransition.swift
//  Fotos
//
//  Created by Nobel on 2016/11/22.
//  Copyright © 2016年 Nobel. All rights reserved.
//

import UIKit

class PingTransition: NSObject, UIViewControllerAnimatedTransitioning, CAAnimationDelegate {

    var context: UIViewControllerContextTransitioning!
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.35
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        self.context = transitionContext
        let fromVC = context.viewController(forKey: .from)
        let toVC = context.viewController(forKey: .to)
        let containerView = context.containerView
        containerView.addSubview((toVC?.view)!)
        let frame = CGRect(x: (fromVC?.view.frame.size.width)! / 2, y: (fromVC?.view.frame.size.height)! / 2, width: 0, height: 0)
        let maskStart = UIBezierPath(ovalIn: frame)
        let radius = sqrt((frame.origin.x * frame.origin.x) + (frame.origin.y * frame.origin.y))
        let maskEnd = UIBezierPath(ovalIn: frame.insetBy(dx: -radius, dy: -radius))
        let maskLayer = CAShapeLayer()
        maskLayer.path = maskEnd.cgPath
        toVC?.view.layer.mask = maskLayer
        
        let animation = CABasicAnimation(keyPath: "path")
        animation.fromValue = maskStart.cgPath
        animation.toValue = maskEnd.cgPath
        animation.duration = self.transitionDuration(using: context)
        animation.delegate = self
        maskLayer.add(animation, forKey: "path")
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        context.completeTransition(!context.transitionWasCancelled)
        context.viewController(forKey: .from)?.view.layer.mask = nil
        context.viewController(forKey: .to)?.view.layer.mask = nil
    }
    
}
