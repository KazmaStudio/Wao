//
//  PaymentViewController.swift
//  Wao
//
//  Created by 华瑞金科 on 16/2/2.
//  Copyright © 2016年 kazmastudio. All rights reserved.
//

import UIKit

class PaymentViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    var array: NSMutableArray = [""]
    var editBtn: UIButton!
    var yesorno: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       yesorno = false
        addfooterView()
        addrightBtn()
    }

    func addrightBtn() {
        editBtn = UIButton(type: .System)
        editBtn.frame = CGRectMake(0, 0, 30, 30)
        NSUserDefaults.standardUserDefaults().setObject("edit", forKey: "EditOrFinish")
        editBtn.setTitle("编辑", forState: .Normal)
        editBtn.addTarget(self, action: "editAction:", forControlEvents: .TouchUpInside)
        let item = UIBarButtonItem(customView: editBtn)
        self.navigationItem.rightBarButtonItem = item
        
        
    }
    func editAction(button: UIButton) {
//        yesorno = true
        let view = NSBundle.mainBundle().loadNibNamed("Animation", owner: nil, options: nil).first as! AnimationView
        view.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight)
        view.layoutIfNeeded()
        view.paymentBtn.hidden = true
        let btn = UIButton()
        btn.frame = CGRectMake(0, 0, view.lastView.frame.width, view.lastView.frame.height)
        btn.setTitle("确定", forState: .Normal)
       let user = NSUserDefaults.standardUserDefaults().objectForKey("EditOrFinish")
        btn.addTarget(self, action: "editFinishAct", forControlEvents: .TouchUpInside)
        btn.backgroundColor = UIColor.redColor()
        self.view.addSubview(view)
        view.lastView.addSubview(btn)
        if (user?.isEqualToString("edit") == true)
        {
            button.setTitle("完成", forState: .Normal)
            button.addTarget(self, action: "hideViewAct", forControlEvents: .TouchUpInside)
            NSUserDefaults.standardUserDefaults().setObject("finish", forKey: "EditOrFinish")
        }else{
            button.setTitle("编辑", forState: .Normal)
            NSUserDefaults.standardUserDefaults().setObject("edit", forKey: "EditOrFinish")
//             var myView = UIView()
            for myView in self.view.subviews{
                if myView.isKindOfClass(AnimationView){
                    myView.hidden = true
                }
            }
            
        }
    }
    
    func hideViewAct(){
//        NSNotificationCenter.defaultCenter().postNotificationName("animation", object: nil)
    }
    
    func editFinishAct(){
        
    }
    
    func addfooterView() {
        let footerView = UIView()
        footerView.frame = CGRectMake(0, self.view.frame.height - 43, self.view.frame.width, 43)
        footerView.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(footerView)
        
        let sureBtn = UIButton()
        sureBtn.frame = CGRectMake(self.view.frame.width - 115, 0, 115, 43)
        
        sureBtn.backgroundColor = UIColor(red: 69/255, green: 179/255, blue: 82/255, alpha: 1)
        sureBtn.setTitle("确认支付", forState: .Normal)
        sureBtn.addTarget(self, action: "successedAct", forControlEvents: .TouchUpInside)
        footerView.addSubview(sureBtn)
        
        
        let totalLab = UILabel()
        totalLab.frame = CGRectMake(13, 0, 45, 43)
        totalLab.text = "合计:"
        footerView.addSubview(totalLab)
        
        let moneyLab = UILabel()
        moneyLab.frame = CGRectMake(63, 0, 70, 43)
        moneyLab.text = "¥ 256.00"
        footerView.addSubview(moneyLab)
        
        let numberLab = UILabel()
        numberLab.frame = CGRectMake(143, 0, 30, 43)
        numberLab.text = "2 份"
        numberLab.font = UIFont.boldSystemFontOfSize(12)
        numberLab.textColor = UIColor.grayColor()
        footerView.addSubview(numberLab)
    }
    
    func successedAct(){
        
        let infoVC = UIStoryboard(name: "SBZTMain", bundle: nil).instantiateViewControllerWithIdentifier("info") as! InfoViewController
        navigationController?.pushViewController(infoVC, animated: true)
    }

}

extension PaymentViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("paymentcell") as! PaymentCell
        return cell
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        
        
        
        var deleteRowAction = UITableViewRowAction()
        deleteRowAction = UITableViewRowAction(style: UITableViewRowActionStyle.Destructive, title: "删除", handler: { (UITableViewRowAction, NSIndexPath) -> Void in
            self.array.removeObjectAtIndex(indexPath.row)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation:
                UITableViewRowAnimation.Automatic)
            
        })
        
        deleteRowAction.backgroundColor = UIColor(red: 119/255, green: 132/255, blue: 145/255, alpha: 1)
        
        return [deleteRowAction]
        
    }
    
    
    
}


