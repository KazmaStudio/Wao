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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        butArray = [1,2,3,4,5,6]
        addMoreButton()
    }

    func addMoreButton(){
        for var i = 0; i < butArray.count; i++ {
            let but = UIButton()
           but.backgroundColor = UIColor.redColor()
        
            but.frame = CGRectMake(0, 30, 75, 30)
            
//           self.contentView.addSubview(but)
        }
    }
    
}
