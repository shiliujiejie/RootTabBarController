//
//  AppDelegate.swift
//  RootTabBarController
//
//  Created by mac on 2019/6/14.
//  Copyright © 2019年 mac. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        configTabBar()
        return true
    }
    
    private func configTabBar() {
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        window?.makeKeyAndVisible()
        
        let tabBarNormalImages = ["Main_N","book_N","task_N","acount_N"]
        let tabBarSelectedImages = ["Main_S","book_S","task_S","acount_S"]
        let tabBarTitles = ["首页","消息","发现","我的"]
        
        
        let rootModel1 = RootTabBarModel.init(title: tabBarTitles[0], imageNormal: tabBarNormalImages[0], imageSelected: tabBarSelectedImages[0], controller: MainController())
        
        let rootModel2 = RootTabBarModel.init(title: tabBarTitles[1], imageNormal: tabBarNormalImages[1], imageSelected: tabBarSelectedImages[1], controller: MsgController())
        
        let rootModel3 = RootTabBarModel.init(title: tabBarTitles[2], imageNormal: tabBarNormalImages[2], imageSelected: tabBarSelectedImages[2], controller: FindController())
        
        let rootModel4 = RootTabBarModel.init(title: tabBarTitles[3], imageNormal: tabBarNormalImages[3], imageSelected: tabBarSelectedImages[3], controller: MineController())
        let tabBars =  [rootModel1, rootModel2, rootModel3, rootModel4]
        let tabbarVC = RootTabBarViewController.init(config: getConfigModel(), tabBars: tabBars)
       // window?.rootViewController = tabbarVC
        
        
        
        
        let rootController = FAPanelController()
        let leftvc = LeftMenuVC()
        let rightvc = RightVC()
         _ = rootController.center(tabbarVC).left(leftvc)
        rootController.configs.rightPanelWidth = 140
        //rootController.configs.bounceOnRightPanelOpen = false
        rootController.configs.panFromEdge = true
        rootController.rightPanelPosition = .front
        window?.rootViewController = rootController
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

