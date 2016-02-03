//
//  AnimationView.swift
//  Wao
//
//  Created by 华瑞金科 on 16/1/26.
//  Copyright © 2016年 kazmastudio. All rights reserved.
//

import UIKit

class AnimationView: UIView {

    @IBOutlet weak var darkView: UIView!
    
    @IBOutlet weak var footerAni: UIView!
    
    @IBOutlet weak var typeTableView: UITableView!
    
    @IBOutlet weak var lastView: UIView!
    @IBOutlet weak var paymentBtn: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var headImage: UIImageView!
    
    
    var sizeHeight: CGFloat!
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func drawRect(rect: CGRect) {
        
        typeTableView.estimatedRowHeight = 100
        typeTableView.rowHeight = UITableViewAutomaticDimension
        
        self.backgroundColor = UIColor.clearColor()
        typeTableView.separatorStyle = UITableViewCellSeparatorStyle.None
        darkView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        darkView.frame = CGRectMake(0, 64, self.frame.width, self.frame.height)
        let tappressGesutre = UITapGestureRecognizer(target: self, action: "handleTappressGesture")
        tappressGesutre.numberOfTouchesRequired = 1
        darkView.addGestureRecognizer(tappressGesutre)
        
       	footerAni.frame = CGRectMake(0, self.frame.height, self.frame.width, 1)
        footerAni.userInteractionEnabled = true
        let tapSon = UITapGestureRecognizer(target: self, action: "tapAction")
        footerAni.addGestureRecognizer(tapSon)
        
        let taps = UITapGestureRecognizer(target: self, action: "tapA")
        lastView.addGestureRecognizer(taps)
        UIView.animateWithDuration(0.5, animations: animation)
        footerAni.addSubview(typeTableView)
        var buttonImage: UIImage
        buttonImage = UIImage(named: "close@3x")!
        buttonImage = buttonImage.imageWithRenderingMode(.AlwaysOriginal)
        cancelButton.setImage(buttonImage, forState: .Normal)
        cancelButton.addTarget(self, action: "handleTappressGesture", forControlEvents: .TouchUpInside)
        
        paymentBtn.addTarget(self, action: "paymentAct", forControlEvents: .TouchUpInside)
        
    }
    @IBAction func pushAction(sender: AnyObject) {

    }
    
    func tapA(){
        print(0000000)
    }
    func paymentAct(){
       NSNotificationCenter.defaultCenter().postNotificationName("pushViewController", object: nil)
    }
    func tapAction(){
        print(1111)
    }
    func handleTappressGesture(){
        UIView.animateWithDuration(0.5, animations: hideAnimation, completion: {finished in
            self.hidden = true
            
        })
    }
    
    func hideAnimation(){
        footerAni.frame = CGRectMake(0, self.frame.height, self.frame.width, 1)
    }
    
    func animation(){
        footerAni.frame = CGRectMake(0, self.frame.height - 275, self.frame.width, 210)
    }

}

extension AnimationView:UITableViewDataSource,UITableViewDelegate{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        
        
        if indexPath.row == 0{
        let nib = UINib.init(nibName: "SizeTableViewCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "sizeCell")
        let cell = tableView.dequeueReusableCellWithIdentifier("sizeCell") as! SizeTableViewCell
//        cell.but.preferredFocusedView?.widthAnchor
            
            
            
            return cell
        } else {
            let nib = UINib.init(nibName: "NumberTableCell", bundle: nil)
            tableView.registerNib(nib, forCellReuseIdentifier: "numberCell")
            let cell = tableView.dequeueReusableCellWithIdentifier("numberCell") as! NumberTableCell
            
            return cell
        }
        
        
        
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        let cell = tableView.dequeueReusableCellWithIdentifier("sizeCell") as! SizeTableViewCell
//        return 100
        
        if  indexPath.row == 0{
            return typeTableView.rowHeight 
        } else {
            return 40
        }
        
    }
    
    
}

