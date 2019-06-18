//
//  VCCollectionCell.swift
//  RootTabBarController
//
//  Created by mac on 2019/6/14.
//  Copyright © 2019年 mac. All rights reserved.
//

import UIKit

class VCCollectionCell: UICollectionViewCell {
    
    static let cellId = "VCCollectionCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = UIColor(r: CGFloat(Float(arc4random()%255)/255.0), g: 123, b: 58)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setVCView(_ view: UIView) {
        if contentView.subviews.count > 0 {
            for view in contentView.subviews {
                view.removeFromSuperview()
            }
        }
        contentView.addSubview(view)
        layoutVcView(view)
    }
    func setColor(_ color: UIColor) {
        contentView.backgroundColor = color
    }
    
    
}

private extension VCCollectionCell {
    func layoutVcView(_ view: UIView) {
        view.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}



