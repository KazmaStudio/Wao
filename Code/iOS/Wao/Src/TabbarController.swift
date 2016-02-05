//
//  TabbarController.swift
//  Wao
//
//  Created by ZHAOCHENJUN on 16/2/5.
//  Copyright © 2016年 kazmastudio. All rights reserved.
//

import UIKit

class TabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
		
		for (var i = 0; i < self.tabBar.items?.count; i++){
			
			let imageName:String
			
			switch(i){
			case 0:
				imageName = "shouye_c"
				break
			case 1:
				imageName = "xinyuan_c"
				break
			case 2:
				imageName = "wode_c"
				break
			default:
				imageName = "shouye_c"
			}
			
			let unselectedImage = UIImage.init(named: imageName)
			self.tabBar.items![i].image = unselectedImage?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
		}

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
