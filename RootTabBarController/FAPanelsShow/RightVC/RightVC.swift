//
//  RightVC.swift
//  RootTabBarController
//
//  Created by mac on 2019/6/17.
//  Copyright © 2019年 mac. All rights reserved.
//

import UIKit

class RightVC: UIViewController {
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.backgroundColor = UIColor.purple
        tableView.allowsSelection = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib.init(nibName: "RightMenuCell", bundle: nil), forCellReuseIdentifier: "RightMenuCell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        layoutTableView()
    }
    
    func layoutTableView() {
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }

}

extension RightVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RightMenuCell") as! RightMenuCell
        cell.menuOption.image = UIImage(named: "right_menu_" + String(indexPath.row + 1))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: false)
        let contain = ContainController()
       
        let centerNavVC = UINavigationController(rootViewController: contain)
        
        panel!.configs.bounceOnCenterPanelChange = true
        
        /*
         // Simple way of changing center PanelVC
         _ = panel!.center(centerNavVC)
         */
        
        
        
        /*
         New Feature Added, You can change the center panelVC and after completion of the animations you can execute a closure
         */
        
        panel!.center(centerNavVC, afterThat: {
            print("Executing block after changing center panelVC From Right Menu")
        })
    }
}
