//
//  RBWelcomeController.swift
//  RBooker
//
//  Created by 夏敏 on 24/12/2016.
//  Copyright © 2016 夏敏. All rights reserved.
//

import UIKit

class RBWelcomeController: RBViewController {

    lazy var stepButton:UIButton = {
        let button = UIButton.init(type: .custom)
        button.setTitle("next", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action: #selector(next(sender:)), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(stepButton)
        stepButton.snp.makeConstraints { (make) in
            make.center.equalTo(self.view)
        }
    }

    func next(sender:UIButton){
        
    }
    
}
