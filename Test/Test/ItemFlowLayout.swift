//
//  ItemFlowLayout.swift
//  Test
//
//  Created by Dzy on 23/02/2017.
//  Copyright © 2017 Dzy. All rights reserved.
//

import UIKit


class ItemFlowLayout: UICollectionViewFlowLayout {

    override func prepare() {
        super.prepare()

//        itemSize = CGSize.init(width: 100, height: 100)
        let inset = ((collectionView?.frame.size.width)! - self.itemSize.width) * 0.5
        self.sectionInset = UIEdgeInsetsMake(0, inset, 0, inset)
        
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {

        // 获得super已经计算好的布局属性
        let arr = super.layoutAttributesForElements(in: rect)
        
        // 计算collectionView最中心点的x值
        let centerX = (collectionView?.contentOffset.x)! + (collectionView?.frame.size.width)! * 0.5

        // 在原有布局属性的基础上，进行微调
        for attrs in arr! {
            // cell的中心点x 和 collectionView最中心点的x值 的间距
            let delta = abs(attrs.center.x - centerX)
            // 根据间距值 计算 cell的缩放比例
            let scale = 1 - delta / (collectionView?.frame.size.width)!
            // 设置缩放比例   
            attrs.transform = CGAffineTransform.init(scaleX: scale, y: scale)
      
        }
        
        return arr
        
    }
    
    /**
     * 这个方法的返回值，就决定了collectionView停止滚动时的偏移量
     
     */
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        // 计算出最终显示的矩形框
        var rect = CGRect.init()
        rect.origin.y = 0
        rect.origin.x = proposedContentOffset.x
        rect.size = (collectionView?.frame.size)!
        
        // 获得super已经计算好的布局属性
        let array = super.layoutAttributesForElements(in: rect)

        // 计算collectionView最中心点的x值
        let centerX = proposedContentOffset.x + (collectionView?.frame.size.width)! * 0.5
        
        // 存放最小的间距值
        var minDelta = MAXFLOAT
        for attrs in array! {
            
            if abs(minDelta) > Float(abs(attrs.center.x - centerX)) {
                
                minDelta = Float(attrs.center.x) - Float(centerX)

            }

        }
        
        // 修改原有的偏移量
        let point = CGPoint.init(x: CGFloat(Float(minDelta) + Float(proposedContentOffset.x)), y: proposedContentOffset.y)
        
        return point;
        
    }
    
//    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
//        
//    }
//  
    // 刷新rect 
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        
        return true
        
    }
    
    
    
}
