//
//  ItemTitleCell.swift
//  RootTabBarController
//
//  Created by mac on 2019/6/15.
//  Copyright © 2019年 mac. All rights reserved.
//

import UIKit


class TitleItemCell: UICollectionViewCell {
    
    static let cellId = "TitleItemCell"
    
    lazy var itemBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitleColor(UIColor.darkText, for: .normal)
        btn.setTitleColor(UIColor.red, for: .selected)
        btn.setBackgroundImage(UIColor.creatImageWithColor(color: UIColor.white, size: CGSize(width: 60, height: 30)), for: .normal)
       // btn.setBackgroundImage(UIColor.creatImageWithColor(color: UIColor.orange, size: CGSize(width: 60, height: 30)), for: .selected)
        btn.addTarget(self, action: #selector(itemClick(_:)), for: .touchUpInside)
        btn.layer.cornerRadius = 15
        btn.layer.masksToBounds = true
        return btn
    }()
    let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.red
        view.layer.cornerRadius = 1.5
        view.layer.masksToBounds = true
        return view
    }()
    
    var itemClickHandler:(() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = UIColor.clear
        addSubview(lineView)
        addSubview(itemBtn)
        layoutPageSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func itemClick(_ sender: UIButton) {
        if !sender.isSelected {
            itemClickHandler?()
        }
        
    }
    
    
}

private extension TitleItemCell {
    func layoutPageSubviews() {
        layoutLineView()
        layoutItemBtn()
        
    }
    func layoutItemBtn() {
        itemBtn.snp.makeConstraints { (make) in
            make.leading.top.trailing.equalToSuperview()
            make.bottom.equalTo(lineView.snp.top).offset(-2)
        }
    }
    func layoutLineView() {
        
        lineView.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalTo(25)
            make.height.equalTo(3)
        }
    }
}
