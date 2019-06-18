//
//  MineController.swift
//  RootTabBarController
//
//  Created by mac on 2019/6/14.
//  Copyright © 2019年 mac. All rights reserved.
//

import UIKit

class MineController: UIViewController {

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.backgroundColor = UIColor.clear
        
        tableView.dataSource = self
        tableView.delegate = self
        if #available(iOS 10.0, *) {
            tableView.refreshControl = UIRefreshControl()
            tableView.refreshControl?.addTarget(self, action: #selector(refreshHandler), for: .valueChanged)
        }
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "我的"
        print("ChildOneVC --------")
        view.backgroundColor = UIColor.white
        navigationController?.setNavigationBarHidden(true, animated: true)
        view.addSubview(self.tableView)
        layoutTableView()
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        } else {
            self.automaticallyAdjustsScrollViewInsets = false
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.layoutIfNeeded()
    }
    
    // MARK: Actions
    @objc func refreshHandler() {
        let deadlineTime = DispatchTime.now() + .seconds(1)
        DispatchQueue.main.asyncAfter(deadline: deadlineTime, execute: { [weak self] in
            if #available(iOS 10.0, *) {
                self?.tableView.refreshControl?.endRefreshing()
            }
            self?.tableView.reloadData()
        })
    }
    
}

extension MineController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 18
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "cellID"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
        }
        cell?.textLabel?.text = "cellId \(indexPath.row)"
        cell?.backgroundColor = UIColor.clear
        cell?.contentView.backgroundColor = UIColor.groupTableViewBackground
        return cell!
    }
}


extension MineController {
    func layoutTableView() {
        let bottonMargin = safeAreaBottomHeight //+ 44
        tableView.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            if #available(iOS 11.0, *) {
                make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            } else {
                make.bottom.equalTo(0)
            }
        }
    }
}
