//
//  ViewController.swift
//  RootTabBarController
//
//  Created by mac on 2019/6/14.
//  Copyright © 2019年 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //configTabBar()
       // timeRepeat()
    }

    
    private func configTabBar() {
        
        let tabBarNormalImages = ["shelfTabar_N","shopTabar_N","welfare_N","acount_N"]
        let tabBarSelectedImages = ["shelfTabar_S","shopTabar_S","welfare_S","acount_S"]
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
        
        /// 是否 点击  动画
        rootConfig.isAnimation = true
        
        /// 点击 动画类型 scaleDown：小-大     rotation： 旋转
        rootConfig.animation = .scaleDown
        
        /// 中心按钮j 上浮高度
        rootConfig.centerInsetUp = 0
        
        rootConfig.tabBarBackgroundColor = UIColor(white: 0.98, alpha: 0.99)
    
        rootConfig.navBarBackgroundColor = UIColor(white: 0.98, alpha: 0.99)
        
        rootConfig.tabBarShadowColor = UIColor.groupTableViewBackground
        

        
        return rootConfig
    }
    
    

}
