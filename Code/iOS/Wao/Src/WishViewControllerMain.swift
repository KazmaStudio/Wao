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
    var appsArray:NSMutableArray = ["未点亮心愿", "已点亮心愿"]
    var array:NSMutableArray!
    var allArray:NSMutableArray = []
    
    
    var notLitView: UIView!
    var footButton: UIButton!
    var hideHeadView: UIView!
    var footerView: UIView!
    var selectedBtn: UIButton!
    var seleAllBtn: UIButton!
    var deleteBtn: UIButton!
    
    weak var  tellFriendButton: UIButton!
    weak var  shareFriendCircleButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "心愿"
        tableView.editing = false
        self.view.backgroundColor = UIColor.whiteColor()
        segment = UISegmentedControl(items: appsArray as [AnyObject])
        segment.frame = CGRectMake(10, 10, self.view.frame.width - 20, 30)
        segment.tintColor = UIColor(red: 255/255, green: 84/255, blue: 59/255, alpha: 1)
        segment.setTitle("未点亮心愿", forSegmentAtIndex: 0)
        segment.selectedSegmentIndex = 0
        
        segment.addTarget(self, action: "segmentAction:", forControlEvents: UIControlEvents.ValueChanged)
        
        hideHeadView = UIView()
        hideHeadView.frame = CGRectMake(0, 64, view.frame.width, 50)
        hideHeadView.backgroundColor = UIColor.clearColor()
		
		let blurEffectLight = UIBlurEffect(style: UIBlurEffectStyle.Light)
		let bgBlurViewLight = UIVisualEffectView(effect: blurEffectLight)
		bgBlurViewLight.frame = CGRectMake(0, 0, hideHeadView.frame.width, hideHeadView.frame.height)
		hideHeadView.addSubview(bgBlurViewLight)
        view.addSubview(hideHeadView)
        
        
        hideHeadView.addSubview(segment)
        segment.userInteractionEnabled = true
        
       
        // 全选
        seleAllBtn = UIButton(type: .System)
        seleAllBtn.frame = CGRectMake(0, 0, 60, 30)
        seleAllBtn.setTitle("全选", forState: .Normal)
        seleAllBtn.addTarget(self, action: "selectAllBtnClick:", forControlEvents: .TouchUpInside)
        
        let seleAll = UIBarButtonItem.init(customView: seleAllBtn)
        navigationItem.leftBarButtonItem = seleAll
        seleAllBtn.hidden = true

        selectedBtn = UIButton(type: .System)
        selectedBtn.frame = CGRectMake(0, 0, 60, 30)
            selectedBtn.setTitle("选择", forState: .Normal)
            selectedBtn.addTarget(self, action: "selectedBtn:", forControlEvents: .TouchUpInside)
        let rightButton = UIBarButtonItem.init(customView: selectedBtn)
        self.navigationItem.rightBarButtonItem = rightButton
        
        footerView = UIView()
        footerView.frame = CGRectMake(0, view.frame.height - 109, view.frame.width, 60)
        footerView.backgroundColor = UIColor.groupTableViewBackgroundColor()
        view.addSubview(footerView)
        
        addFooterButton()
        tellFriendAction()
        shareFriendCircleAction()
		
		self.tableView.contentInset = UIEdgeInsetsMake(hideHeadView.frame.size.height, 0, 0, 0)
    }
    
    func selectedBtn(button: UIButton){
        tableView.allowsMultipleSelectionDuringEditing = true
        
        tableView.editing = !tableView.editing
        
        if tableView.editing{
            seleAllBtn.hidden = false
            tellFriendButton.hidden = true
            shareFriendCircleButton.hidden = true
            // 删除按钮
            deleteBtn = UIButton(type: .Custom)
            deleteBtn.backgroundColor = UIColor(red: 255/255, green: 84/255, blue: 59/255, alpha: 1)
            deleteBtn.setTitle("删除", forState: .Normal)
            deleteBtn.frame = CGRectMake(0, 0, self.view.frame.size.width, 60)
            deleteBtn.addTarget(self, action: "deleteClick:", forControlEvents: .TouchUpInside)
            footerView.addSubview(deleteBtn)
            button.setTitle("完成", forState: .Normal)
        } else {
            seleAllBtn.hidden = true
             deleteBtn.hidden = true
            tellFriendButton.hidden = false
            shareFriendCircleButton.hidden = false
            button.setTitle("选择", forState: .Normal)
        }
        
    }
    
    func selectAllBtnClick(button: UIButton){
        for var i = 0; i < appsArray.count; i++ {
            let indexPath = NSIndexPath(forItem: i, inSection: 0)
            
            tableView.selectRowAtIndexPath(indexPath, animated: true, scrollPosition: .Top)
            allArray.addObjectsFromArray(self.appsArray as [AnyObject])
            
        }
    }
    
    func deleteClick(button: UIButton){
        if tableView.editing{
            appsArray .removeObjectsInArray(allArray as [AnyObject])
            tableView.reloadData()
        } else {
        return
        }
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
            tellFriendButton.hidden = false
            
        } else {
            tableView.reloadData()
            footButton.hidden = false
            shareFriendCircleButton.hidden = true
            tellFriendButton.hidden = true
            seleAllBtn.hidden = true
        }
        
        selectedBtn = UIButton(type: .System)
        selectedBtn.frame = CGRectMake(0, 0, 60, 30)
        if segment.selectedSegmentIndex == 0{
           
            selectedBtn.setTitle("选择", forState: .Normal)
            selectedBtn.addTarget(self, action: "selectedBtn:", forControlEvents: .TouchUpInside)
        } else {
            tableView.reloadData()
            selectedBtn.setTitle("分享", forState: .Normal)
            selectedBtn.addTarget(self, action: nil, forControlEvents: .TouchUpInside)
            
        }
        let rightButton = UIBarButtonItem.init(customView: selectedBtn)
        self.navigationItem.rightBarButtonItem = rightButton
        
        
    }
    
    func tellFriendAction() {
        
        var tellFriendButton: UIButton!
        tellFriendButton = UIButton(type: .Custom)
        tellFriendButton.backgroundColor = UIColor(red: 255/255, green: 84/255, blue: 59/255, alpha: 1)
        tellFriendButton.frame = CGRectMake(10, 10, self.footerView.frame.width * 0.5 - 15, 40)
        tellFriendButton.setTitle("把心愿告诉好友", forState: .Normal)
        tellFriendButton.cornerRadius = 6
        self.tellFriendButton = tellFriendButton
        
        footerView.addSubview(self.tellFriendButton)
        
        
    }
    func shareFriendCircleAction(){
        var shareFriendCircleBut: UIButton!
        shareFriendCircleBut = UIButton(type: .Custom)
        shareFriendCircleBut.backgroundColor = UIColor(red: 255/255, green: 84/255, blue: 59/255, alpha: 1)
        shareFriendCircleBut.frame = CGRectMake(self.tellFriendButton.frame.width + 20, 10, self.footerView.frame.width * 0.5 - 15, 40)
        shareFriendCircleBut.setTitle("把分享到朋友圈", forState: .Normal)
        shareFriendCircleBut.cornerRadius = 6
        self.shareFriendCircleButton = shareFriendCircleBut
        footerView.addSubview(self.shareFriendCircleButton)
        
    }
    
    func addFooterButton(){
        footButton = UIButton(type: .Custom)
        footButton.backgroundColor = UIColor(red: 255/255, green: 84/255, blue: 59/255, alpha: 1)
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
            appsArray.removeObjectAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Top)
        }
        
        
        
        tableView.reloadData()
        
    }
    
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.Delete
    }
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        
        
        
        var deleteRowAction = UITableViewRowAction()
        deleteRowAction = UITableViewRowAction(style: UITableViewRowActionStyle.Destructive, title: "删除", handler: { (UITableViewRowAction, NSIndexPath) -> Void in
            self.appsArray.removeObjectAtIndex(indexPath.row)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation:
            UITableViewRowAnimation.Automatic)
        
        })

        deleteRowAction.backgroundColor = UIColor(red: 119/255, green: 132/255, blue: 145/255, alpha: 1)
        
        return [deleteRowAction]
        
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if segment.selectedSegmentIndex == 0{
            return 90
        } else {
            return  150
        }
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        allArray.addObject(appsArray.objectAtIndex(indexPath.row))
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
    }
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        allArray.addObject(appsArray.objectAtIndex(indexPath.row))
    }
    
    
}

