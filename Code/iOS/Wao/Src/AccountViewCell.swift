//
//  AccountViewCell.swift
//  Wao
//
//  Created by 华瑞金科 on 16/2/15.
//  Copyright © 2016年 kazmastudio. All rights reserved.
//

import UIKit

class AccountViewCell: UITableViewCell {

    
    @IBOutlet weak var headImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var detailLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
