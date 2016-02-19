//
//  LibraryViewController.swift
//  Wao
//
//  Created by 华瑞金科 on 16/2/4.
//  Copyright © 2016年 kazmastudio. All rights reserved.
//

import UIKit

class LibraryViewController: UIViewController {

    var isOpen: Bool!
    var selectedIndex: NSInteger!
    var currentSelection: Int!
    var path: NSIndexPath!
    var height: CGFloat!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        path = NSIndexPath()
        isOpen = true
        currentSelection = -1
        height = 126
    }


}
extension LibraryViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("librarycell") as! LibraryViewCell
        if indexPath == path && !isOpen{
            cell.smailImage.image = UIImage(named: "arr_up")
            cell.numberLab.hidden = false
            cell.timeLab.hidden = false
            cell.fromLab.hidden = false
        } else {
            cell.smailImage.image = UIImage(named: "arr_down")
            cell.numberLab.hidden = true
            cell.timeLab.hidden = true
            cell.fromLab.hidden = true
        }
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        path = indexPath
        
        if isOpen == true{
            isOpen = false
                self.height = 126
            tableView.reloadData()
            
        }else{
            isOpen = true
                self.height = 63
            tableView.reloadData()
        }
        
        
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if  indexPath == path {
            return height
            
        }else{
            return 63
        }
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 15
    }
    
}