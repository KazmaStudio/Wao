//
//  LibraryViewController.swift
//  Wao
//
//  Created by 华瑞金科 on 16/2/4.
//  Copyright © 2016年 kazmastudio. All rights reserved.
//

import UIKit

class LibraryViewController: UIViewController {

    var array: NSMutableArray!
    var height: CGFloat!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        array = NSMutableArray()
        for (var i = 0; i < 5; i++) {
        let string: NSString = "N"
        array.addObject(string)
        }
        height = 126
    }


}
extension LibraryViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("librarycell") as! LibraryViewCell
        if array[indexPath.row].isEqualToString("Y"){
            cell.numberLab.hidden = false
            cell.timeLab.hidden = false
            cell.fromLab.hidden = false
        } else {
            cell.numberLab.hidden = true
            cell.timeLab.hidden = true
            cell.fromLab.hidden = true
        }
        
        
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if array[indexPath.row].isEqualToString("Y"){
            array[indexPath.row] = "N"
        } else {
            array[indexPath.row] = "Y"
        }
        tableView.reloadData()
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if  array[indexPath.row].isEqualToString("Y") {
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