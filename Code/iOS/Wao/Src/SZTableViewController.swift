//
//  SZTableViewController.swift
//  设置
//
//  Created by 袁思曾 on 16/2/14.
//  Copyright © 2016年 袁思曾. All rights reserved.
//

import UIKit

class SZTableViewController: UITableViewController {

    @IBOutlet var tableview: UITableView!
    var swich: UISwitch!
    
    @IBOutlet weak var mainSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableview.backgroundColor = UIColor.groupTableViewBackgroundColor()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 6
    }
    
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        var view:UIView
        view = UIView.init(frame: CGRectMake(0, 0, 414, 50))

        
        var button:UIButton
    
        
        button = UIButton.init(frame: CGRectMake(15, 15, self.view.frame.width-30, 40))
        button.setTitle("登出", forState: UIControlState.Normal)
        button.setTitleColor(UIColor.blackColor(), forState: .Normal)
        button.cornerRadius = 6
        button.backgroundColor = UIColor.whiteColor()
        view.addSubview(button)
        
        return view
    }



}
