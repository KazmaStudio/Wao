//
//  NumberTableCell.swift
//  Wao
//
//  Created by 华瑞金科 on 16/2/2.
//  Copyright © 2016年 kazmastudio. All rights reserved.
//

import UIKit

class NumberTableCell: UITableViewCell {

    @IBOutlet weak var subBtn: UIButton!
    
    @IBOutlet weak var addBtn: UIButton!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addAddBtn()
        addSubBtn()
    }


    func addAddBtn(){
        var buttonImage: UIImage
        buttonImage = UIImage(named: "add@3x")!
        buttonImage = buttonImage.imageWithRenderingMode(.AlwaysOriginal)
        addBtn.setImage(buttonImage, forState: .Normal)
    }
    
    func addSubBtn(){
        var buttonImage: UIImage
        buttonImage = UIImage(named: "sub@3x")!
        buttonImage = buttonImage.imageWithRenderingMode(.AlwaysOriginal)
        subBtn.setImage(buttonImage, forState: .Normal)
        
    }
    
}
