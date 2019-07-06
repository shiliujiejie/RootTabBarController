//
//  MsgController.swift
//  RootTabBarController
//
//  Created by mac on 2019/6/14.
//  Copyright © 2019年 mac. All rights reserved.
//

import UIKit

class MsgController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

      
        view.backgroundColor = UIColor(r: 98, g: 179, b: 250)
        
        
       // self.tabBarController?.selectedIndex = 3
        self.tabBarItem.badgeValue = "5"
        if #available(iOS 10.0, *) {
            self.tabBarItem.badgeColor = UIColor.red
        }
       
       
    
    }
    


}
