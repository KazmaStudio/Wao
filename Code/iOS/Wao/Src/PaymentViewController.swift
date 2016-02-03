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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        addfooterView()
        addrightBtn()
    }

    func addrightBtn() {
        let item = UIBarButtonItem(title: "编辑", style: .Plain, target: self, action: "rightBtnAction")
        self.navigationItem.rightBarButtonItem = item
        
        
    }
    func rightBtnAction() {
        let view = NSBundle.mainBundle().loadNibNamed("Animation", owner: nil, options: nil).first as! AnimationView
        view.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight)
        view.layoutIfNeeded()
        view.paymentBtn.hidden = true
        let btn = UIButton()
        btn.frame = CGRectMake(0, 0, view.lastView.frame.width, view.lastView.frame.height)
        btn.setTitle("确定", forState: .Normal)
        btn.addTarget(self, action: "editFinishAct", forControlEvents: .TouchUpInside)
        btn.backgroundColor = UIColor.redColor()
        view.lastView.addSubview(btn)
        self.view.addSubview(view)
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
        
        sureBtn.backgroundColor = UIColor.greenColor()
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
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("paymentcell") as! PaymentCell
        return cell
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }
    
}


