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
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isOpen = true
        currentSelection = -1
    }


}
extension LibraryViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("librarycell") as! LibraryViewCell
        
        if indexPath.row == 0{
            cell.numberLab.text = "123123123123"
            cell.timeLab.text = "141241241241"
            cell.fromLab.text = "14124124"
        }
        
        if indexPath == currentSelection && !isOpen{
            cell.numberLab.hidden = false
            cell.timeLab.hidden = false
            cell.fromLab.hidden = false
        } else {
            
            cell.numberLab.hidden = true
            cell.timeLab.hidden = true
            cell.fromLab.hidden = true
        }
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if currentSelection == indexPath.row{
            currentSelection = -1
        } else {
            currentSelection = indexPath.row
        }
        
        tableView.beginUpdates()
        tableView.endUpdates()
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if  indexPath.row == currentSelection {
            return 126
            
        }else{
            return 63
        }
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 15
    }
    
}