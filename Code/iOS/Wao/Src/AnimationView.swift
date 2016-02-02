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
    
    @IBOutlet weak var push: UIButton!
	
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBOutlet weak var headImage: UIImageView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func drawRect(rect: CGRect) {
        self.backgroundColor = UIColor.clearColor()
        
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
        cancelButton.addTarget(self, action: "handleTappressGesture", forControlEvents: .TouchUpInside)
        
        push.addTarget(self, action: "pushAct", forControlEvents: .TouchUpInside)
        
    }
    @IBAction func pushAction(sender: AnyObject) {

    }
    
    func tapA(){
        print(0000000)
    }
    func pushAct(){
        print(4444)
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

        let nib = UINib.init(nibName: "SizeTableViewCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "sizeCell")
        
        let cell = tableView.dequeueReusableCellWithIdentifier("sizeCell") as! SizeTableViewCell
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
    
}

