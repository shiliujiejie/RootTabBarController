//
//  PageItemView.swift
//  RootTabBarController
//
//  Created by mac on 2019/6/15.
//  Copyright © 2019年 mac. All rights reserved.
//

import UIKit

/// 横向滑动collection 不缩放
class ItemFlowLayout: UICollectionViewFlowLayout {
    
    //MARK:--- 布局之前的准备工作 初始化  这个方法只会调用一次
    override func prepare() {
        scrollDirection = UICollectionView.ScrollDirection.horizontal
        minimumInteritemSpacing = 0
        
        super.prepare()
    }
    //（该方法默认返回false） 返回true  frame发生改变就重新布局  内部会重新调用prepare 和layoutAttributesForElementsInRect
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
}


class PageItemView: UIView {

    private lazy var collectionView: UICollectionView = {
        let itemFlowLayout = ItemFlowLayout()
        itemFlowLayout.minimumLineSpacing = configModel.itemMargin // 水平最小间距
        itemFlowLayout.sectionInset = UIEdgeInsets(top: 0, left: configModel.leftRightMargin, bottom: 0, right: configModel.leftRightMargin)
        let collection = UICollectionView(frame: self.bounds, collectionViewLayout: itemFlowLayout)
        collection.delegate = self
        collection.dataSource = self
        collection.allowsSelection = false
        collection.isScrollEnabled = configModel.scrollEnabled
        collection.backgroundColor = configModel.pageViewBgColor
        collection.layer.cornerRadius = configModel.itemViewCornerRadius
        collection.showsVerticalScrollIndicator = false
        collection.showsHorizontalScrollIndicator = false
        collection.register(TitleItemCell.classForCoder(), forCellWithReuseIdentifier: TitleItemCell.cellId)
        return collection
    }()
    var itemClickHandler:((_ index: Int) -> Void)?
    
    var titles = [String]()
    var currentIndex = 0
    var configModel: PageItemConfig!
    
    init(frame:CGRect, config: PageItemConfig) {
        super.init(frame: frame)
        configModel = config
        self.addSubview(collectionView)
        layoutPageSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func getwith(font: UIFont, height: CGFloat, string: String) -> CGSize {
        let size = CGSize.init(width: CGFloat(MAXFLOAT), height: height)
        let dic = [NSAttributedString.Key.font: font] // swift 4.2
        let strSize = string.boundingRect(with: size, options: [.usesLineFragmentOrigin], attributes: dic, context:nil).size
        return strSize
    }
    
    func scrollTopIndex(_ index: Int) {
        if index < titles.count {
            currentIndex = index
            collectionView.reloadData()
            collectionView.scrollToItem(at: IndexPath.init(item: index, section: 0), at: .centeredHorizontally, animated: true)
        }
    }
    
    func clickItem(_ index: Int) {
        currentIndex = index
        collectionView.reloadData()
        collectionView.scrollToItem(at: IndexPath.init(item: index, section: 0), at: .centeredHorizontally, animated: true)
        itemClickHandler?(currentIndex)
    }
    
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension PageItemView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleItemCell.cellId, for: indexPath) as! TitleItemCell
        cell.setConfig(configModel)
        cell.itemBtn.setTitle(titles[indexPath.item], for: .normal)
        cell.itemBtn.isSelected = indexPath.item == currentIndex
        cell.itemBtn.titleLabel?.font = cell.itemBtn.isSelected ? configModel.titleFontSelected : configModel.titleFontNormal
        if indexPath.item == currentIndex {
            cell.lineView.isHidden = false
        } else {
            cell.lineView.isHidden = true
        }
        cell.itemClickHandler = { [weak self] in
            self?.clickItem(indexPath.item)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if configModel.isAverageWith {
            let avgWith = self.frame.width - configModel.leftRightMargin*2 - configModel.itemMargin*CGFloat(titles.count - 1)
            return CGSize(width: avgWith/CGFloat(titles.count), height: self.frame.height)
        }
        if configModel.itemWidth > 0.0 {
            return CGSize(width: configModel.itemWidth, height: self.frame.height)
        }
        let size = self.getwith(font: configModel.titleFontNormal, height: 25, string: titles[indexPath.item])
        return CGSize(width: size.width + configModel.titleMargin*2, height: self.frame.height)
    }
    
}

private extension PageItemView {
    func layoutPageSubviews() {
        layoutCollection()
    }
    
    func layoutCollection() {
        collectionView.snp.makeConstraints { (make) in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
    }
}
