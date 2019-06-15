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
        //configTabBar()
        return true
    }
    
    private func configTabBar() {
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        window?.makeKeyAndVisible()
        
        let tabBarNormalImages = ["Main_N","book_N","task_N","acount_N"]
        let tabBarSelectedImages = ["Main_S","book_S","task_S","acount_S"]
        let tabBarTitles = ["首页","消息","功能","我的"]
        
        var tabBars =  [RootTabBarModel]()
        
        for i in 0 ..< tabBarNormalImages.count {
            let rootModel = RootTabBarModel.init(title: tabBarTitles[i], imageNormal: tabBarNormalImages[i], imageSelected: tabBarSelectedImages[i], controller: ViewController())
            tabBars.append(rootModel)
        }
        let tabbarVC = RootTabBarViewController.init(config: getConfigModel(), tabBars: tabBars)
        window?.rootViewController = tabbarVC
    }
    
    private func getConfigModel() -> RootTabBarConfig {
        let rootConfig = RootTabBarConfig()
        rootConfig.tabBarStyle = .center
        rootConfig.isAnimation = true
        rootConfig.animation = .rotation
        
        return rootConfig
    }

}

