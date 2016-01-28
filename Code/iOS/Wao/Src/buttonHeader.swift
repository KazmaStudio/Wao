//
//  buttonHeader.swift
//  悬停header view
//
//  Created by 袁思曾 on 16/1/21.
//  Copyright © 2016年 袁思曾. All rights reserved.
//

import UIKit

class buttonHeader: UITableViewHeaderFooterView{
    
    
    
    
	@IBOutlet var viewBG: UIView!
	
    @IBAction func addGiftList(sender: AnyObject) {
    }
    
    @IBAction func addCollectionList(sender: AnyObject) {
    }
       
    @IBAction func addWishList(sender: AnyObject) {
    }
    
    @IBAction func buyAtOnce(sender: AnyObject) {
        
        NSNotificationCenter.defaultCenter().postNotificationName("price", object: nil)
    }

}





