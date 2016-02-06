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
    
    @IBOutlet weak var numberLabel: UILabel!
    
    var number = Int()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addAddBtn()
        addSubBtn()
        numberLabel.text = "0"
        number = 0
    }


    func addAddBtn(){
        var buttonImage: UIImage
        buttonImage = UIImage(named: "add@3x")!
        buttonImage = buttonImage.imageWithRenderingMode(.AlwaysOriginal)
        addBtn.setImage(buttonImage, forState: .Normal)
        addBtn.addTarget(self, action: "addAct", forControlEvents: .TouchUpInside)
    }
    
    func addAct(){
         ++number
        numberLabel.text = String(number)
    }
    
    func addSubBtn(){
        var buttonImage: UIImage
        buttonImage = UIImage(named: "sub@3x")!
        buttonImage = buttonImage.imageWithRenderingMode(.AlwaysOriginal)
        subBtn.setImage(buttonImage, forState: .Normal)
        subBtn.addTarget(self, action: "subAct", forControlEvents: .TouchUpInside)
        
    }
    func subAct(){
        if number == 0{
            return
        }
        --number
        numberLabel.text = String(number)
    }
    
}
