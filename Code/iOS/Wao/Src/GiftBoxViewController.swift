//
//  GiftBoxViewController.swift
//  Wao
//
//  Created by 华瑞金科 on 16/2/4.
//  Copyright © 2016年 kazmastudio. All rights reserved.
//

import UIKit

class GiftBoxViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var headView: UIView!
    var receiveBtn: UIButton! // 收到按钮
    var giveOutBtn: UIButton! // 送出按钮
    var receiveRow: Int!
    var giveOutRow: Int!
    var row: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        headView = UIView()
        headView.frame = CGRectMake(0, 0, view.frame.width, 41)
        headView.backgroundColor = UIColor.whiteColor()
        view.addSubview(headView)
        
        receiveBtn = UIButton()
        receiveBtn.frame = CGRectMake(0, 0, view.frame.width * 0.5, 41)
        receiveBtn.backgroundColor = UIColor.whiteColor()
        receiveBtn.setTitle("已收到", forState: .Normal)
        receiveBtn.setTitleColor(UIColor.blackColor(), forState: .Normal)
        receiveBtn.addTarget(self, action: "receiveAction:", forControlEvents: .TouchUpInside)
        headView.addSubview(receiveBtn)
        
        giveOutBtn = UIButton()
        giveOutBtn.frame = CGRectMake(view.frame.width * 0.5, 0, view.frame.width * 0.5, 41)
        giveOutBtn.backgroundColor = UIColor.whiteColor()
        giveOutBtn.setTitle("已送出", forState: .Normal)
        giveOutBtn.setTitleColor(UIColor.blackColor(), forState: .Normal)
        giveOutBtn.addTarget(self, action: "giveOutAction:", forControlEvents: .TouchUpInside)
        headView.addSubview(giveOutBtn)
        
    }
    func receiveAction(button: UIButton){
        receiveRow = 8
        row = receiveRow
        tableView.reloadData()
        
    }

    func giveOutAction(button: UIButton){
        giveOutRow = 4
        row = giveOutRow
        tableView.reloadData()
    }


}

extension GiftBoxViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return row ?? 8
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("giftCell") as! GiftBoxViewCell
        return cell
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }
    
}