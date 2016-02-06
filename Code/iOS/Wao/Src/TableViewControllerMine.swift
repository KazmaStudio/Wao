//
//  TableViewControllerMine.swift
//  Wao
//
//  Created by zhaochenjun on 16/1/11.
//  Copyright © 2016年 kazmastudio. All rights reserved.
//

import UIKit

class TableViewControllerMine: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        
    }
    
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 10
        
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 0.01
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0 || indexPath.section == 2{

            var storyboardLogin: UIStoryboard
            storyboardLogin = UIStoryboard.init(name: "SBLogin", bundle: nil)

            var viewControllerLogin: ViewControllerLogin
            viewControllerLogin = storyboardLogin.instantiateViewControllerWithIdentifier("viewControllerLogin") as! ViewControllerLogin

            viewControllerLogin.hidesBottomBarWhenPushed = true

            self.navigationController?.pushViewController(viewControllerLogin, animated: true)

        } else if indexPath.section == 1 && indexPath.row  == 0{
        let libraryVC = UIStoryboard(name: "SBMine", bundle: nil).instantiateViewControllerWithIdentifier("library") as! LibraryViewController
            libraryVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(libraryVC, animated: true)
        } else if indexPath.section == 1 && indexPath.row == 1{
            let giftBoxVC = UIStoryboard(name: "SBMine", bundle: nil).instantiateViewControllerWithIdentifier("giftbox") as! GiftBoxViewController
            giftBoxVC.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(giftBoxVC, animated: true)
            
        }else if indexPath.section == 1 && indexPath.row == 2{
            let bagVC = UIStoryboard(name: "SBMine", bundle: nil).instantiateViewControllerWithIdentifier("bag") as! BagViewController
            bagVC.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(bagVC, animated: true)
        } else {
            let collectVC = UIStoryboard(name: "SBMine", bundle: nil).instantiateViewControllerWithIdentifier("collect") as! CollectViewController
            collectVC.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(collectVC, animated: true)
        }
        
    }
    
    override func tableView(tableView: UITableView, shouldHighlightRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        
        let cell = tableView .cellForRowAtIndexPath(indexPath)
        
        cell?.selectionStyle = UITableViewCellSelectionStyle.None
        
        cell?.textLabel?.alpha = 0.5
        
        return true
    }
    
    override func tableView(tableView: UITableView, didUnhighlightRowAtIndexPath indexPath: NSIndexPath) {
        
        let cell = tableView .cellForRowAtIndexPath(indexPath)
        
        UIView.animateWithDuration(0.3, animations: {
            
            cell?.textLabel?.alpha = 1
            
            }, completion: {finished in})
        
    }
    
}
