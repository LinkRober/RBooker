//
//  RBHomeController.swift
//  RBooker
//
//  Created by 夏敏 on 11/04/2017.
//  Copyright © 2017 夏敏. All rights reserved.
//

import UIKit

class RBHomeController: RBViewController {

    var presentAnimation = RBDrawer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "home"
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .bookmarks, target: self, action:#selector(showLeftController))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Action
    func showLeftController(){
        let leftVC = RBLeftController()
        leftVC.transitioningDelegate = self
        leftVC.modalPresentationStyle = .fullScreen
        self.present(leftVC, animated: true, completion: nil)
    }
}

extension RBHomeController:UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        presentAnimation.originFrame = CGRect.init(x: 0, y: 0, width: -(UIScreen.main.bounds.size.width), height: UIScreen.main.bounds.size.height)
        return presentAnimation
    }
}
