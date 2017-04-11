//
//  RBDrawer.swift
//  RBooker
//
//  Created by 夏敏 on 11/04/2017.
//  Copyright © 2017 夏敏. All rights reserved.
//

import UIKit

class RBDrawer: NSObject,UIViewControllerAnimatedTransitioning {
    
    var originFrame:CGRect = CGRect.zero
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let _ = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from),let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) else {
            return
        }
        
        let containerView = transitionContext.containerView
        let initialFrame = originFrame
        let finialFrame = CGRect.init(x: 300 - UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        
        let snapshot = toVC.view.snapshotView(afterScreenUpdates: true)
        snapshot?.frame = initialFrame
        
        containerView.addSubview(toVC.view)
        containerView.addSubview(snapshot!)
        toVC.view.isHidden =  true
        
        let duartion = transitionDuration(using: transitionContext)
        UIView.animate(withDuration: duartion, animations: { 
            snapshot?.layer.frame = finialFrame
            toVC.view.frame = finialFrame
        }) { (finished) in
            toVC.view.isHidden = false
            snapshot?.removeFromSuperview()
//            transitionContext.completeTransition(true)
//            transitionContext.completeTransition(transitionContext.transitionWasCancelled)
        }
        
        
    }
}
