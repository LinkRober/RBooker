//
//  RBNavigationController.swift
//  RBooker
//
//  Created by 夏敏 on 11/04/2017.
//  Copyright © 2017 夏敏. All rights reserved.
//

import UIKit

enum RBHomeSelectType:Int {
    case RBHomeSelectUserType = 0
    case RBHomeSelectPublicType = 1
    case RBHomeSelectArticalType = 2
    case RBHomeSelectBooksheetType = 3
    case RBHomeSelectSearchType = 4
}

protocol RBNavigationControllerDelegate {
    func RBNavigationController(controller:RBNavigationController, type click:RBHomeSelectType);
}


class RBNavigationController: UINavigationController {
    
    var RBNavigationdelegate:RBNavigationControllerDelegate?
    
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override init(navigationBarClass: AnyClass?, toolbarClass: AnyClass?) {
        super.init(navigationBarClass: RBHomeNavigationBar.self, toolbarClass: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(click(notification:)), name: NSNotification.Name(rawValue: kRBHomeNavigationBarNotificationIdentifier), object: nil)
    }
    
    override init(rootViewController: UIViewController) {
       super.init(rootViewController: rootViewController)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func click(notification:Notification){
        if let bt = notification.object as? UIButton {
            if bt.tag == 0 {
                self.RBNavigationdelegate?.RBNavigationController(controller: self, type: .RBHomeSelectUserType)
            }else if bt.tag == 1 {
                self.RBNavigationdelegate?.RBNavigationController(controller: self, type: .RBHomeSelectPublicType)
            }else if bt.tag == 2 {
                self.RBNavigationdelegate?.RBNavigationController(controller: self, type: .RBHomeSelectArticalType)
            }else if bt.tag == 3 {
                self.RBNavigationdelegate?.RBNavigationController(controller: self, type: .RBHomeSelectBooksheetType)
            }else if bt.tag == 4 {
                self.RBNavigationdelegate?.RBNavigationController(controller: self, type: .RBHomeSelectSearchType)
            }
        }
    }
    
}
