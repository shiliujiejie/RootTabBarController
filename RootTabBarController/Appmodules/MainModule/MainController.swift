//
//  MainController.swift
//  RootTabBarController
//
//  Created by mac on 2019/6/14.
//  Copyright © 2019年 mac. All rights reserved.
//

import UIKit

class MainController: UIViewController {
    
    private lazy var vcs: [UIViewController] = {
        let vc1 = ContainController()
        vc1.view.backgroundColor = UIColor.orange
        let vc2 = ContainController()
        vc2.view.backgroundColor = UIColor.gray
        let vc3 = ContainController()
        vc3.view.backgroundColor = UIColor.green
        let vc4 = ContainController()
        vc4.view.backgroundColor = UIColor.purple
        let vc5 = ContainController()
        vc5.view.backgroundColor = UIColor.yellow
        let vc6 = ContainController()
        vc6.view.backgroundColor = UIColor.white
        let vc7 = ContainController()
        vc7.view.backgroundColor = UIColor.groupTableViewBackground
        let vc8 = ContainController()
        vc8.view.backgroundColor = UIColor.red
        let viewControllers = [vc1,vc2,vc3,vc4,vc5,vc6,vc7,vc8]
        return viewControllers
    }()
   
    private lazy var pageView: PageItemView = {
        let view = PageItemView.init(frame: CGRect(x: 50, y: 0, width: screenWidth - 50, height: 40),config: config)
        view.backgroundColor = UIColor.clear
        view.titles = ["新闻","NBA","名从主人","能量球","不雅视频","生活小Tips","丛林贸易","朋友圈"]
        return view
    }()
    
    /// 自定义pageView 设置   /*  --- 更多配置 请查看 PageItemConfig 属性 ---- */
    private lazy var config: PageItemConfig = {
        let pageConfig = PageItemConfig()
        //pageConfig.itemBgColorSelected = UIColor.yellow
       // pageConfig.pageViewBgColor = UIColor(white: 0, alpha: 0.1)
        pageConfig.titleColorNormal = UIColor.darkGray
        pageConfig.titleColorSelected = UIColor.red
        pageConfig.titleFontNormal = UIFont.boldSystemFont(ofSize: 16)
        pageConfig.titleFontSelected = UIFont.boldSystemFont(ofSize: 18)
        pageConfig.lineColor = UIColor.red 
        pageConfig.lineSize = CGSize(width: 30, height: 3)
        return pageConfig
    }()
   
    private lazy var pageVc: VCPageController = {
        let pageVC = VCPageController()
        pageVC.controllers = vcs
        
        return pageVC
    }()
    
    var ispresent: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let controllers = self.tabBarController?.viewControllers {
            controllers[3].tabBarItem.badgeValue = "3"
            if #available(iOS 10.0, *) {
                controllers[3].tabBarItem.badgeColor = UIColor.gray
            }
        }

        view.backgroundColor = UIColor(r: 245, g: 190, b: 130)
        navigationController?.navigationBar.addSubview(pageView)
        layoutPageView()
        
        self.addChild(pageVc)
        view.addSubview(pageVc.view)
        layoutSubviews()
        pageVc.scrollToIndex = { [weak self] (index) in
            guard let strongSelf = self else { return }
            strongSelf.pageView.scrollTopIndex(index)
        }
        pageView.itemClickHandler = { [weak self] (index) in
            guard let strongSelf = self else { return }
            strongSelf.pageVc.clickItemToScroll(index)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

}

extension MainController {
    func layoutSubviews() {
        pageVc.view.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(0)
            make.top.equalTo(0)
        }
    }
    func layoutPageView() {
        pageView.snp.makeConstraints { (make) in
            make.leading.equalTo(ispresent ? 50 : 0)
            make.trailing.equalToSuperview()
            make.top.equalTo(0)
            make.height.equalTo(40)
        }
    }
}
