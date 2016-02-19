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

    var butArray: NSMutableArray!
    var sizesum:CGFloat!
    var height:CGFloat!
    var heightlast:CGFloat!
    var indexpath: NSIndexPath!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        butArray = ["d1","2d","3aaaaaaa","4ssaaaa","5ssss","6ddd"]
        addMoreButton()
        
    }

    func addMoreButton(){
        sizesum = 60
        height = 15
        for var i = 0; i < butArray.count; i++ {
            let but = UIButton()
           but.backgroundColor = UIColor(red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
            let ns:NSString
            ns = butArray[i] as! NSString
            but.setTitle(ns as String, forState: .Normal)
            but.titleLabel!.font = UIFont.systemFontOfSize(14)
            but.setTitleColor(UIColor.blackColor(), forState: .Normal)
            but.cornerRadius = 6
            var size:CGFloat
            size = ns.getSizeWithConstraint(CGSize(width: 1000, height: 60), font: but.titleLabel!.font
            )
            if sizesum + size + 20 > UIScreen.mainScreen().bounds.width{
                height = height + 40
                sizesum = 60
            }
            but.frame = CGRectMake(sizesum, height, size , 30)
            but.addTarget(self, action: "buttonAction:", forControlEvents: .TouchUpInside)
            sizesum = sizesum +  20 + size
            contentView.addSubview(but)
        }
        heightlast = height + 40
    }

    
    func getheight() -> CGFloat{
        return heightlast
        
    }
    
    func setIndex(indexpath: NSIndexPath){
        self.indexpath = indexpath
    }
    
    func buttonAction(button: UIButton){
		
        for myButton in contentView.subviews{
            myButton.backgroundColor = UIColor.groupTableViewBackgroundColor()
        }
		
        button.backgroundColor = UIColor.redColor()
        let str:NSString!
        str = NSString(format: "%ld", self.indexpath.row)
        let notific: NSNotification
        var dic  = [NSString : NSString]()
        dic["selectText"] = button.titleLabel?.text
        dic["selectNum"] = str

        notific = NSNotification(name: "buttonChange", object: nil, userInfo: dic)
        NSNotificationCenter.defaultCenter().postNotification(notific)
    }
    
}
