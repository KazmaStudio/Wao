//
//  LibraryViewCell.swift
//  Wao
//
//  Created by 华瑞金科 on 16/2/4.
//  Copyright © 2016年 kazmastudio. All rights reserved.
//

import UIKit

class LibraryViewCell: UITableViewCell {

    
    
    
    
    
    @IBOutlet weak var numberLab: UILabel!
    @IBOutlet weak var timeLab: UILabel!
    @IBOutlet weak var fromLab: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
