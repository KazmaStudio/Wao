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
        numberLabel.text = "1"
        number = 1
        

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
        let notific: NSNotification
        var dic = [NSString:NSString]()
        dic["changeNum"] = numberLabel.text
        notific = NSNotification(name: "changeNumber", object: nil, userInfo: dic)
        NSNotificationCenter.defaultCenter().postNotification(notific)
        
    }
    
    func addSubBtn(){
        var buttonImage: UIImage
        buttonImage = UIImage(named: "sub@3x")!
        buttonImage = buttonImage.imageWithRenderingMode(.AlwaysOriginal)
        subBtn.setImage(buttonImage, forState: .Normal)
        subBtn.addTarget(self, action: "subAct", forControlEvents: .TouchUpInside)
        
    }
    func subAct(){
        if number == 1{
            return
        }
        --number
        
        numberLabel.text = String(number)
        let notific: NSNotification
        var dic = [NSString:NSString]()
        dic["subNumber"] = numberLabel.text
        notific = NSNotification(name: "subNumber", object: nil, userInfo: dic)
        NSNotificationCenter.defaultCenter().postNotification(notific)
        
        
    }
    
}
