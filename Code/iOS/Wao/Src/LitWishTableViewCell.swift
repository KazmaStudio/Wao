//
//  LitWishTableViewCell.swift
//  Wao
//
//  Created by 华瑞金科 on 16/1/20.
//  Copyright © 2016年 kazmastudio. All rights reserved.
//

import UIKit

class LitWishTableViewCell: UITableViewCell {

    @IBOutlet weak var backGiftBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        backGiftBtn.borderColor = UIColor.redColor()
        
        
        
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    
    
}
