//
//  MainController.swift
//  RootTabBarController
//
//  Created by mac on 2019/6/14.
//  Copyright © 2019年 mac. All rights reserved.
//

import UIKit

private let is_iphoneX = (UIScreen.main.bounds.height >= 812.0)

class MainController: UIViewController {
   
    
    private lazy var pageView: PageItemView = {
        let view = PageItemView(frame:CGRect(x: 0, y: 0, width: 100, height: 30))
        view.backgroundColor = UIColor(r: 234, g: 234, b: 23)
        view.titles = ["新闻","NBA","名从主人","能量球","不雅视频","生活小Tips","丛林贸易","朋友圈"]
        return view
    }()
    
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
    
    private lazy var pageVc: VCPageController = {
        let pageVC = VCPageController()
        pageVC.controllers = vcs
        return pageVC
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
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
    
    
}

extension MainController {
    func layoutSubviews() {
        let statuBarHeight = UIApplication.shared.statusBarFrame.height
        let tabBarHeight: CGFloat = 49.0
        let bottomM = is_iphoneX ? (tabBarHeight + safeAreaBottomHeight) : tabBarHeight
        pageVc.view.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(-bottomM)
            make.top.equalTo(0)
        }
    }
    func layoutPageView() {
        pageView.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(0)
            make.height.equalTo(44)
        }
    }
}
