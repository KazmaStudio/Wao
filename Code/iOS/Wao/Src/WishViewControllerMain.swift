//
//  WishViewControllerMain.swift
//  Wao
//
//  Created by 华瑞金科 on 16/1/20.
//  Copyright © 2016年 kazmastudio. All rights reserved.
//

import UIKit


class WishViewControllerMain: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    
    var nodataView: UITableView!
    
    var segment: UISegmentedControl!
    var appsArray:[String] = ["未点亮心愿", "已点亮心愿"]
    var array = []
    var notLitView: UIView!
    var footButton: UIButton!
    var hideHeadView: UIView!
    var footerView: UIView!
    
    weak var  tellFriendButton: UIButton!
    weak var  shareFriendCircleButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.title = "心愿"
        let rightButton = UIBarButtonItem(title: "全选", style: .Plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItem = rightButton
        
        hideHeadView = UIView()
        hideHeadView.frame = CGRectMake(0, 64, view.frame.width, 50)
        hideHeadView.backgroundColor = UIColor.whiteColor()
        view.addSubview(hideHeadView)
        
        footerView = UIView()
        footerView.frame = CGRectMake(0, view.frame.height - 109, view.frame.width, 60)
        footerView.backgroundColor = UIColor.whiteColor()
        view.addSubview(footerView)
        
        self.view.backgroundColor = UIColor.whiteColor()
        segment = UISegmentedControl(items: appsArray)
        segment.frame = CGRectMake(10, 10, self.view.frame.width - 20, 30)
        segment.tintColor = UIColor.redColor()
        segment.setTitle("未点亮心愿", forSegmentAtIndex: 0)
        segment.selectedSegmentIndex = 0
        
        segment.addTarget(self, action: "segmentAction:", forControlEvents: UIControlEvents.ValueChanged)
        
        
        
        hideHeadView.addSubview(segment)
        segment.userInteractionEnabled = true
        addFooterButton()
        tellFriendAction()
        shareFriendCircleAction()
    }
    
    
    override func viewWillAppear(animated: Bool) {

        footButton.hidden = true
    }
    
    override func viewDidAppear(animated: Bool) {

//        if array.count > 0 {
//            tableView.hideNoDataView()
//        } else {
//            tableView.addNodataView("还没有心愿墙", imageName: "", offsetY: 0)
//        }
    }
    
    
    func segmentAction(segment:UISegmentedControl){
        if segment.selectedSegmentIndex == 0{
            tableView.reloadData()
            tellFriendButton.hidden = false
            shareFriendCircleButton.hidden = false
            footButton.hidden = true
        } else {
            tableView.reloadData()
            footButton.hidden = false
            shareFriendCircleButton.hidden = true
            tellFriendButton.hidden = true
            
        }
    }
    
    func tellFriendAction() {
        
        var tellFriendButton: UIButton!
        tellFriendButton = UIButton(type: .Custom)
        tellFriendButton.backgroundColor = UIColor.redColor()
        tellFriendButton.frame = CGRectMake(10, 10, self.footerView.frame.width * 0.5 - 15, 40)
        tellFriendButton.setTitle("把心愿告诉好友", forState: .Normal)
        tellFriendButton.cornerRadius = 6
        self.tellFriendButton = tellFriendButton
        
        footerView.addSubview(self.tellFriendButton)
        
        
    }
    func shareFriendCircleAction(){
        var shareFriendCircleBut: UIButton!
        shareFriendCircleBut = UIButton(type: .Custom)
        shareFriendCircleBut.backgroundColor = UIColor.redColor()
        shareFriendCircleBut.frame = CGRectMake(self.tellFriendButton.frame.width + 20, 10, self.footerView.frame.width * 0.5 - 15, 40)
        shareFriendCircleBut.setTitle("把分享到朋友圈", forState: .Normal)
        shareFriendCircleBut.cornerRadius = 6
        self.shareFriendCircleButton = shareFriendCircleBut
        footerView.addSubview(self.shareFriendCircleButton)
        
    }
    
    func addFooterButton(){
        footButton = UIButton(type: .Custom)
        footButton.backgroundColor = UIColor.redColor()
        footButton.frame = CGRectMake(20, self.view.frame.height - 99, self.view.frame.width - 40, 40)
        footButton.cornerRadius = 6
        footButton.setTitle("分享到朋友圈", forState: UIControlState.Normal)
        footButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        footButton.addTarget(self, action: "footButtonAct", forControlEvents: .TouchUpInside)
        view.addSubview(footButton)
    }

    
    func footButtonAct(){
        print(111)
    }


}

extension WishViewControllerMain:UITableViewDataSource,UITableViewDelegate{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appsArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        if segment.selectedSegmentIndex == 0{
            let cell = tableView.dequeueReusableCellWithIdentifier("notLitCell") as! NotLitWishTableViewCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("litWishCell") as! LitWishTableViewCell
            
            return cell
        }
        
        
        
    }
    

    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete{
            appsArray.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Top)
        }
        tableView.reloadData()
        
    }
    
    func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String? {
        
        return "删除"
    }
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.Delete
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if segment.selectedSegmentIndex == 0{
            return 90
        } else {
            return  150
        }
    }
    
}

