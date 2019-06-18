//
//  ViewController.swift
//  RootTabBarController
//
//  Created by mac on 2019/6/14.
//  Copyright © 2019年 mac. All rights reserved.
//

import UIKit
import Repeat

class ViewController: UIViewController {
    
    
    var timer: Repeater?
    var timer1: Repeater?
    var timer2: Repeater?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //configTabBar()
       // timeRepeat()
    }

    
    private func configTabBar() {
        
        let tabBarNormalImages = ["Main_N","book_N","task_N","acount_N"]
        let tabBarSelectedImages = ["Main_S","book_S","task_S","acount_S"]
        let tabBarTitles = ["首页","消息","发现","我的"]
        
        let rootModel1 = RootTabBarModel.init(title: tabBarTitles[0], imageNormal: tabBarNormalImages[0], imageSelected: tabBarSelectedImages[0], controller: MainController())
       
        let rootModel2 = RootTabBarModel.init(title: tabBarTitles[1], imageNormal: tabBarNormalImages[1], imageSelected: tabBarSelectedImages[1], controller: MsgController())
       
        let rootModel3 = RootTabBarModel.init(title: tabBarTitles[2], imageNormal: tabBarNormalImages[2], imageSelected: tabBarSelectedImages[2], controller: FindController())
   
        let rootModel4 = RootTabBarModel.init(title: tabBarTitles[3], imageNormal: tabBarNormalImages[3], imageSelected: tabBarSelectedImages[3], controller: MineController())
        let tabBars =  [rootModel1, rootModel2, rootModel3, rootModel4]
        let tabbarVC = RootTabBarViewController.init(config: getConfigModel(), tabBars: tabBars)
        self.addChild(tabbarVC)
        self.view.addSubview(tabbarVC.view)
    }
    
    /// 定制 tabbar 和 navgationBar 样式
    ///
    /// - Returns: RootTabBarConfig 对象
    private func getConfigModel() -> RootTabBarConfig {
        let rootConfig = RootTabBarConfig()
        rootConfig.tabBarStyle = .center
        rootConfig.isAnimation = true
        rootConfig.animation = .rotation
        rootConfig.tabBarBackgroundColor = UIColor(r: 249, g: 160, b: 110, a: 1)
        rootConfig.navBarBackgroundColor = UIColor(r: 249, g: 160, b: 110, a: 1)
        rootConfig.tabBarShadowColor = UIColor.lightGray
        rootConfig.centerViewController = PresentController()
        
        return rootConfig
    }
    
    

}



extension ViewController {
    
    
    func timeRepeat() {
        self.timer = Repeater.once(after: .seconds(2.5), { (timer) in
            print("Repeater.once(after: .seconds(2.5)")
        })
         self.timer1 = Repeater.every(.seconds(10.0)) { (timer) in
            print("Repeater.every(.seconds(10.0))")
        }
        self.timer2 = Repeater.init(interval: .seconds(5), mode: .infinite, tolerance: .seconds(60), queue: DispatchQueue.main, observer: { (timer) in
            print("Repeater.init(interval: .seconds(5), mode: .infinite, tolerance: .seconds(60)")
        })
        self.timer2?.start()
       
    }
    
}
