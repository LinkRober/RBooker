//
//  RBLoginController.swift
//  RBooker
//
//  Created by 夏敏 on 24/12/2016.
//  Copyright © 2016 夏敏. All rights reserved.
//

import UIKit

class RBLoginController: RBViewController {

   lazy var userNameTextField:UITextField = {
        let textfield = UITextField.init()
        textfield.placeholder = "请输入用户名"
        return textfield
    }()
    
    lazy var  passwordTextField:UITextField = {
        let textfield = UITextField.init()
        textfield.placeholder = "请输入密码"
        return textfield
    }()
    
    override func loadView() {
        super.loadView()
        self.view.addSubview(self.userNameTextField)
        self.view.addSubview(passwordTextField)
        userNameTextField.snp.makeConstraints { (make) in
            make.center.equalTo(self.view)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
