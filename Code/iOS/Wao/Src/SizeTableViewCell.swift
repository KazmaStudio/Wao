//
//  SizeTableViewCell.swift
//  Wao
//
//  Created by 华瑞金科 on 16/1/28.
//  Copyright © 2016年 kazmastudio. All rights reserved.
//

import UIKit

class SizeTableViewCell: UITableViewCell {

    @IBOutlet weak var sizeButton: UIButton!
    
//    var but: UIButton!
    
    var butArray: NSMutableArray!
    var sizesum:CGFloat!
    var height:CGFloat!
    override func awakeFromNib() {
        super.awakeFromNib()
        butArray = ["d1","2d","3aaaaaaa","4ssaaaa","5ssss","6ddd"]
        addMoreButton()
        
    }

    func addMoreButton(){
        sizesum = 2
        height = 30
        for var i = 0; i < butArray.count; i++ {
            let but = UIButton()
           but.backgroundColor = UIColor.redColor()
        
//            but.frame = CGRectMake(0, 30, 75, 60)
            let ns:NSString
            ns = butArray[i] as! NSString
            but.setTitle(ns as String, forState: .Normal)
            but.titleLabel!.font = UIFont.systemFontOfSize(14)
            var size:CGFloat
            size = ns.getSizeWithConstraint(CGSize(width: 1000, height: 60), font: but.titleLabel!.font
            )
            if sizesum + size + 20 > UIScreen.mainScreen().bounds.width{
                height = height + 40
                sizesum = 0
            }
            but.frame = CGRectMake(sizesum, height, size , 20)
//                        contentView.addSubview(but)
             sizesum = sizesum +  20 + size
        }
        
    }
    func getheight() -> CGFloat{
        return height
        
    }
    
}
