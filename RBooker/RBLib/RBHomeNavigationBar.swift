//
//  RBHomeNavigationBar.swift
//  RBooker
//
//  Created by 夏敏 on 14/04/2017.
//  Copyright © 2017 夏敏. All rights reserved.
//

import UIKit

public var kRBHomeNavigationBarNotificationIdentifier = "kRBHomeNavigationBarNotificationIdentifier"


class RBHomeNavigationBar: UINavigationBar {

    lazy var centerView:UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var centerItems:[UIButton] = {
        let items = [UIButton(),UIButton(),UIButton(),UIButton(),UIButton()]
        for item in items .enumerated() {
            item.element.setTitleColor(UIColor.gray, for: .normal)
            item.element.addTarget(self, action: #selector(click(button:)), for: .touchUpInside)
            item.element.tag = item.offset
            if item.offset == 1 {
                item.element.setTitle("出版", for: .normal)
            }else if item.offset == 3 {
                item.element.setTitle("书架", for: .normal)
            }else if item.offset == 2{
                item.element.setTitle("网文", for: .normal)
            }else if item.offset == 0 {
                item.element.setTitle("用户", for: .normal)
            }else if item.offset == items.count - 1 {
                item.element.setTitle("搜索", for: .normal)
            }
        }
        return items
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(centerView)
        
        for item in centerItems {
            centerView.addSubview(item)
        }
    }
    
    override func layoutSubviews() {
        centerView.snp.makeConstraints { (make) in
            make.center.equalTo(self)
            make.size.equalTo(CGSize.init(width: self.RBScreenWith(), height: self.RBNavigationBarHeight()))
        }
        
        for item in centerItems .enumerated() {
            if item.offset == 1 {
                item.element.snp.makeConstraints({ (make) in
                    make.centerY.equalTo(centerView)
                    make.leading.equalTo(centerView.snp.leading).offset(100)
                })
            }else if item.offset == 3 {
                item.element.snp.makeConstraints({ (make) in
                    make.centerY.equalTo(centerView)
                    make.trailing.equalTo(centerView).offset(-100)
                })
            }else if item.offset == 2{
                item.element.snp.makeConstraints({ (make) in
                    make.center.equalTo(centerView)
                })
            }else if item.offset == 0{
                item.element.snp.makeConstraints({ (make) in
                    make.centerY.equalTo(centerView)
                    make.leading.equalTo(centerView.snp.leading).offset(15)
                })
            }else if item.offset == centerItems.count - 1 {
                item.element.snp.makeConstraints({ (make) in
                    make.centerY.equalTo(centerView)
                    make.trailing.equalTo(centerView).offset(-15)
                })
            }
        }
        
        super.layoutSubviews()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func click(button:UIButton) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: kRBHomeNavigationBarNotificationIdentifier), object: button, userInfo: nil)
    }
    
}
