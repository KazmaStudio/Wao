//
//  ViewControllerRegisterMobile.swift
//  Wao
//
//  Created by zhaochenjun on 16/1/9.
//  Copyright © 2016年 kazmastudio. All rights reserved.
//

import UIKit
import Kingfisher

class ViewControllerRegisterMobile: UIViewController {
    
    @IBOutlet weak var imageViewAvatar: UIImageView!

    @IBOutlet weak var textFieldNickname: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let weChatInfo = userDefaults.objectForKey(KEY_WECHATINFO)
        
        let avatarUrl = weChatInfo!.objectForKey(KEY_AVATAR) as! String
    
        self.imageViewAvatar.kf_setImageWithURL(NSURL(string: avatarUrl)!)
        
        let nickname = weChatInfo!.objectForKey(KEY_NICKNAME) as! String
        
        self.textFieldNickname.text = nickname
        
        //ysz222
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
