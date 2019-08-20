//
//  PageItemConfig.swift
//  RootTabBarController
//
//  Created by mac on 2019/8/20.
//  Copyright © 2019年 mac. All rights reserved.
//

import UIKit

class PageItemConfig: NSObject {

// MARK: - pageView Config
    
    /// ItemView背景色
    var pageViewBgColor: UIColor = UIColor.clear
    /// itemView 是否可滑动
    var scrollEnabled: Bool = true
    /// 是否平均分宽度  （一旦设置  itemWidth失效，title不再自适应宽度）
    var isAverageWith: Bool = false
    /// 左右缩进
    var leftRightMargin: CGFloat = 10.0
    /// itemView 圆角
    var itemViewCornerRadius: CGFloat = 0.0
    
    
// MARK: - Item Config
    
    /// 文字 非选中 色
    var titleColorNormal: UIColor = UIColor(r: 69, g: 69, b: 69)
    /// 文字 选中 色
    var titleColorSelected: UIColor = UIColor(r: 255, g: 42, b: 49)
    /// item背景色，非选中
    var itemBgColorNormal: UIColor = UIColor.clear
    /// item背景色，选中
    var itemBgColorSelected: UIColor = UIColor.clear
    
    /// 一旦设置后，将不再自动适配文字长度
    var itemWidth: CGFloat = 0.0
    /// item圆角
    var itemCornerRadius: CGFloat = 0.0
    /// item间距
    var itemMargin: CGFloat = 10.0
    /// 标题左右边距
    var titleMargin: CGFloat = 15.0
    /// 字体大小
    var titleFontNormal: UIFont = UIFont.systemFont(ofSize: 16)
    /// 选中字体大小
    var titleFontSelected: UIFont = UIFont.systemFont(ofSize: 16)
    
    
// MARK: - line Config
    
    /// 底部指示线条y颜色
    var lineColor: UIColor = UIColor(r: 255, g: 42, b: 49)
    /// 底部现 size
    var lineSize: CGSize = CGSize(width: 25, height: 3)
    
}
