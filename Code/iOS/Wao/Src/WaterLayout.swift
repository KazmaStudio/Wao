//
//  WaterLayout.swift
//  一次过
//
//  Created by 袁思曾 on 16/1/7.
//  Copyright © 2016年 袁思曾. All rights reserved.
//

import UIKit
protocol WaterfallProtocol : class{
    func collectionView_heightForItemAtIndexPath(view:UICollectionView,layout:WaterLayout,path:NSIndexPath)->Float
    func waterfall_itemWidth(itemWidth:Float)
}

class WaterLayout: UICollectionViewLayout {
    var numberOfColums = 2
    var interItemSpacing = 10
    var allItemAttributeArray = NSMutableArray()
    var everyColumsHeightDic = NSMutableDictionary()
    
    
    weak var delegate:WaterfallProtocol?
    override func prepareLayout() {
        super.prepareLayout()
        let cvWidth = Float((collectionView?.bounds.size.width)!)
        let itemWidth = (cvWidth-Float(interItemSpacing)*(Float(numberOfColums)+1))/Float(numberOfColums)
        //重置
        allItemAttributeArray.removeAllObjects()
        (collectionView?.delegate as! WaterfallProtocol).waterfall_itemWidth(itemWidth)
        
        for i in 0..<numberOfColums {
            everyColumsHeightDic.setObject(NSNumber(float: 0.0), forKey:i.description)
        }
        let itemCount = collectionView!.numberOfItemsInSection(0)
        for i in 0..<itemCount{
            let indexPath = NSIndexPath(forItem: i, inSection: 0)
            //得到高度最短的列
            let minHeightColum = getMinHeightColum()
            let x = Float(interItemSpacing) + (Float(interItemSpacing)+itemWidth) * Float(minHeightColum)
            var y = everyColumsHeightDic[minHeightColum.description]!.floatValue
            
            let heightDelegate = collectionView?.delegate as! WaterfallProtocol
            let itemHeight = heightDelegate.collectionView_heightForItemAtIndexPath(collectionView!,layout:self,path:indexPath)
            
            let attribute = UICollectionViewLayoutAttributes(forCellWithIndexPath: indexPath)
            attribute.frame = CGRectMake(CGFloat(x), CGFloat(y), CGFloat(itemWidth), CGFloat(itemHeight))
            allItemAttributeArray.addObject(attribute)
            y = y + Float(interItemSpacing)
            y = y + Float(itemHeight)
            
            everyColumsHeightDic.setObject(NSNumber(float: y), forKey: minHeightColum.description)
        }
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]{
        var array = Array<UICollectionViewLayoutAttributes>()
        
        allItemAttributeArray.enumerateObjectsUsingBlock { (attribute, idx, stop) -> Void in
            if CGRectIntersectsRect(rect, attribute.frame){
                array.append(attribute as! UICollectionViewLayoutAttributes)
            }
        }
        return array
    }
    override func collectionViewContentSize() -> CGSize{
        return CGSizeMake(collectionView!.frame.size.width, CGFloat(everyColumsHeightDic[getMaxHeightColum().description]!.floatValue))
    }
}

    
    extension WaterLayout {
        //获取最短列
        func getMinHeightColum()->Int{
            let count = everyColumsHeightDic.count
            var minIndex = 0
            var minHeight = everyColumsHeightDic["0"]!.floatValue
            for i in 1..<count{
                if  everyColumsHeightDic[NSNumber(integer: i).description]!.floatValue<minHeight{
                    minHeight = everyColumsHeightDic[NSNumber(integer: i).description]!.floatValue
                    minIndex = i
                }
            }
            return minIndex
        }
        //获取最长列
        func getMaxHeightColum()->Int{
            let count = everyColumsHeightDic.count
            var maxIndex = 0
            var maxHeight = everyColumsHeightDic["0"]!.floatValue
            for i in 1..<count{
                if everyColumsHeightDic[NSNumber(integer: i).description]!.floatValue>maxHeight{
                    maxHeight = everyColumsHeightDic[NSNumber(integer: i).description]!.floatValue
                    maxIndex = i
                }
            }
            return maxIndex
        }

}
