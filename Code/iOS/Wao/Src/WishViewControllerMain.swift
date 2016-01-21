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
    weak var  tellFriendButton: UIButton!
    weak var  shareFriendCircleButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.view.backgroundColor = UIColor.whiteColor()
        segment = UISegmentedControl(items: appsArray)
        segment.frame = CGRectMake(20, 81, 320, 40)
        segment.tintColor = UIColor.blackColor()
        segment.setTitle("未点亮心愿", forSegmentAtIndex: 0)
        segment.selectedSegmentIndex = 0
        
        segment.addTarget(self, action: "segmentAction:", forControlEvents: UIControlEvents.ValueChanged)
        
        
        
        self.view.addSubview(segment)
        segment.userInteractionEnabled = true
        addFooterButton()
        tellFriendAction()
        shareFriendCircleAction()
    }
    
    
    override func viewWillAppear(animated: Bool) {

        footButton.hidden = true
    }
    
    override func viewDidAppear(animated: Bool) {

        if array.count > 0 {
            tableView.hideNoDataView()
        } else {
            tableView.addNodataView("还没有心愿墙", image: UIImage(named: "index_h@2x")!, offsetY: 0)
        }
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
        tellFriendButton.backgroundColor = UIColor.blackColor()
        tellFriendButton.frame = CGRectMake(15, 570, 170, 40)
        tellFriendButton.setTitle("把心愿告诉好友", forState: .Normal)
        
        self.tellFriendButton = tellFriendButton
        
        view.addSubview(self.tellFriendButton)
        
        
    }
    func shareFriendCircleAction(){
        var shareFriendCircleBut: UIButton!
        shareFriendCircleBut = UIButton(type: .Custom)
        shareFriendCircleBut.backgroundColor = UIColor.blackColor()
        shareFriendCircleBut.frame = CGRectMake(200, 570, 170, 40)
        shareFriendCircleBut.setTitle("把心愿分享到朋友圈", forState: .Normal)
        self.shareFriendCircleButton = shareFriendCircleBut
        view.addSubview(self.shareFriendCircleButton)
        
    }
    
    func addFooterButton(){
        footButton = UIButton(type: .Custom)
        footButton.backgroundColor = UIColor.blackColor()
        footButton.frame = CGRectMake(20, 570, 340, 40)
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
        return array.count
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
            return 110
        } else {
            return 252
        }
    }
    
}

