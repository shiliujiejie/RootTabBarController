//
//  LeftMenuVC.swift
//  FAPanels
//
//  Created by Fahid Attique on 17/06/2017.
//  Copyright © 2017 Fahid Attique. All rights reserved.
//

import UIKit

class LeftMenuVC: UIViewController {

    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.backgroundColor = UIColor.clear
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib.init(nibName: "LeftMenuCell", bundle: nil), forCellReuseIdentifier: "LeftMenuCell")
        return tableView
    }()
    
    fileprivate let menuOptions = ["Home", "Music", "Contacts", "Videos", "Apple", "Messages", "Cloud", "Support"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.black
        view.addSubview(tableView)
        layoutTableView()
        
       
    }

    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    
  
}






extension LeftMenuVC: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeftMenuCell") as! LeftMenuCell
        cell.menuOption.text = menuOptions[indexPath.row]
        cell.menuImage.image = UIImage(named: "right_menu_" + String(indexPath.row + 1))

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: false)

        if let vc = panel?._centerPanelVC {
            
            
            panel!.configs.bounceOnCenterPanelChange = true
            
            panel!.center(vc, afterThat: { [weak self] in
                print("Executing block after changing center panelVC From Left Menu")
                //            _ = self.panel!.left(nil)
                let vcnext = MineController()
                vcnext.view.backgroundColor = UIColor.green
                ((vc as! RootTabBarViewController).viewControllers![3] as! RootNavigationController).pushViewController(vcnext, animated: true)
               // vc.navigationController?.pushViewController(vcnext, animated: true)
            })
        }
       

        /*
             // Simple way of changing center PanelVC
             _ = panel!.center(centerNavVC)
         */

        
        
        /*
             New Feature Added, You can change the center panelVC and after completion of the animations you can execute a closure
         */
        
       
    }
}

private extension LeftMenuVC {
    func layoutTableView() {
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}
