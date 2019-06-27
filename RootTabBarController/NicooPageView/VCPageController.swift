//
//  VCPageController.swift
//  RootTabBarController
//
//  Created by mac on 2019/6/14.
//  Copyright © 2019年 mac. All rights reserved.
//

import UIKit

class VCPageController: UIViewController {
    
    private lazy var layoutFlow: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: view.bounds.width, height: view.bounds.height)
        return layout
    }()
    private lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: self.view.bounds, collectionViewLayout: layoutFlow)
        collection.delegate = self
        collection.dataSource = self
        collection.allowsSelection = false
        collection.isPagingEnabled = true
        collection.backgroundColor = UIColor.clear
        collection.showsVerticalScrollIndicator = false
        collection.register(VCCollectionCell.classForCoder(), forCellWithReuseIdentifier: VCCollectionCell.cellId)
        return collection
    }()
    
    var controllers = [UIViewController]()
    
    var currentIndex: Int = 0

    var scrollToIndex:((_ index: Int) -> Void)?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if #available(iOS 11.0, *) {
            collectionView.contentInsetAdjustmentBehavior = .never
        } else {
            self.automaticallyAdjustsScrollViewInsets = false
        }
        view.backgroundColor = UIColor.white
        view.addSubview(collectionView)
        layoutPageSubviews()
    }
    
    func clickItemToScroll(_ index: Int) {
        currentIndex = index
        collectionView.scrollToItem(at: IndexPath(row: currentIndex, section: 0), at: .left, animated: true)
    }
    
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension VCPageController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return controllers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cellForRow(with: indexPath)
        return cell
    }
    
    /// 配置cell
    func cellForRow(with indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VCCollectionCell.cellId, for: indexPath) as! VCCollectionCell
        if cell.contentView.subviews.count <= 0 {
             cell.setVCView(controllers[indexPath.item].view)
        }
        return cell
    }
}

// MARK: - UIScrollViewDelegate
extension VCPageController: UIScrollViewDelegate {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        DispatchQueue.main.async {
            let translatedPoint = scrollView.panGestureRecognizer.translation(in: scrollView)
            scrollView.panGestureRecognizer.isEnabled = false

            if translatedPoint.x < -60 && self.currentIndex < (self.controllers.count - 1) {
                self.currentIndex += 1
            }
            if translatedPoint.x > 60 && self.currentIndex > 0 {
                self.currentIndex -= 1
            }
             let indexPath = IndexPath(row: self.currentIndex, section: 0)
            UIView.animate(withDuration: 0.13, delay: 0.0, options: .curveEaseOut, animations: {
                self.collectionView.scrollToItem(at: indexPath, at: .left, animated: true)
                self.scrollToIndex?(self.currentIndex)
            }, completion: { finished in
                scrollView.panGestureRecognizer.isEnabled = true
            })
        }
    }
}


// MARK: - Layout
private extension VCPageController {
    
    func layoutPageSubviews() {
        layoutCollectionScroll()
    }
    
    func layoutCollectionScroll() {
        collectionView.snp.makeConstraints { (make) in
            if #available(iOS 11.0, *) {
                make.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
            } else {
                make.edges.equalToSuperview()
            }
        }
    }
}
