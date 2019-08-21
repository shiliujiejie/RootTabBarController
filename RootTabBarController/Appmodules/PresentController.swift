//
//  PresentController.swift
//  RootTabBarController
//
//  Created by mac on 2019/6/14.
//  Copyright © 2019年 mac. All rights reserved.
//

import UIKit

class PresentController: UIViewController {

    private lazy var button: UIButton = {
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: 12, y: UIApplication.shared.statusBarFrame.height + 2, width:30, height:30)
        btn.setImage(UIImage(named: "navBackWhite"), for: .normal)
        btn.addTarget(self, action: #selector(click), for: .touchDown)
        btn.backgroundColor = UIColor.red
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTabBar()
        view.addSubview(button)
        view.backgroundColor = UIColor.orange
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    @objc func click() {
        self.dismiss(animated: true, completion: nil)
    }

    
    private func configTabBar() {
        
        let tabBarNormalImages = ["icons8-Apple Filled","icons8-Home-55","icons8-Message Filled","icons8-Music"]
        let tabBarSelectedImages = ["icons8-Apple Filled","icons8-Home-55","icons8-Message Filled","icons8-Music"]
        let tabBarTitles = ["apple","house","message","music"]
        
        let rootModel1 = RootTabBarModel.init(title: tabBarTitles[0], imageNormal: tabBarNormalImages[0], imageSelected: tabBarSelectedImages[0], controller: UIViewController())
        
        let rootModel2 = RootTabBarModel.init(title: tabBarTitles[1], imageNormal: tabBarNormalImages[1], imageSelected: tabBarSelectedImages[1], controller: MsgController())
        
        let rootModel3 = RootTabBarModel.init(title: tabBarTitles[2], imageNormal: tabBarNormalImages[2], imageSelected: tabBarSelectedImages[2], controller: UIViewController())
        
        let rootModel4 = RootTabBarModel.init(title: tabBarTitles[3], imageNormal: tabBarNormalImages[3], imageSelected: tabBarSelectedImages[3], controller: MsgController())
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
        rootConfig.tabBarStyle = .normal
        
        /// 是否 点击  动画
        rootConfig.isAnimation = true
        
        /// 点击 动画类型 scaleDown：小-大     rotation： 旋转
        rootConfig.animation = .scaleDown
        rootConfig.titleColorNormal = UIColor.white
        rootConfig.titleColorSelected = UIColor.green
        /// 中心按钮j 上浮高度
        rootConfig.centerInsetUp = 0
        
        rootConfig.tabBarBackgroundColor = UIColor(white: 0.0, alpha: 0.99)
        
        rootConfig.navBarBackgroundColor = UIColor(white: 0.0, alpha: 0.99)
        
        rootConfig.tabBarShadowColor = UIColor.groupTableViewBackground
        
        
        return rootConfig
    }
    
    

}
