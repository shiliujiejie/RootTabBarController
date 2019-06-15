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
        btn.frame = CGRect(x: 0, y: UIApplication.shared.statusBarFrame.height + 2, width: 60, height:30)
        btn.setTitle("back", for: .normal)
        btn.addTarget(self, action: #selector(click), for: .touchDown)
        btn.backgroundColor = UIColor.red
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
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


}
