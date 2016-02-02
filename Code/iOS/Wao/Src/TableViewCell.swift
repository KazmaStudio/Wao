//
//  TableViewCell.swift
//  zhuanti
//
//  Created by 袁思曾 on 16/2/1.
//  Copyright © 2016年 袁思曾. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    

    @IBOutlet weak var View: UIView!
    
    @IBOutlet weak var ImageView: UIImageView!
    
    
    @IBOutlet weak var GiftName: UILabel!
    
    @IBOutlet weak var GiftPrice: UILabel!
    
    @IBOutlet weak var GiftDescribe: UITextView!
    
    @IBOutlet weak var BuyAtOnce: UIButton!
    
    
    @IBAction func BuyAtOnce(sender: AnyObject) {
        
        
        
        
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }

    @IBOutlet weak var cHeight: NSLayoutConstraint!
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
