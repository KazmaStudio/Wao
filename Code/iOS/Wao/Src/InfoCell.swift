//
//  InfoCell.swift
//  Wao
//
//  Created by 华瑞金科 on 16/2/3.
//  Copyright © 2016年 kazmastudio. All rights reserved.
//

import UIKit

class InfoCell: UITableViewCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var getCodeBtn: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    var provinceLab: UILabel!
    var cityLab: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        provinceLab = UILabel(frame: CGRectMake(110, 0, 180, 45))
        provinceLab.font = UIFont.boldSystemFontOfSize(15)
        contentView.addSubview(provinceLab)
                

    }

    

}
