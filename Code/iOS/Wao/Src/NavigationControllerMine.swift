//
//  NavigationControllerMine.swift
//  Wao
//
//  Created by zhaochenjun on 16/1/11.
//  Copyright © 2016年 kazmastudio. All rights reserved.
//

import UIKit

class NavigationControllerMine: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var storyboardMine: UIStoryboard
        storyboardMine = UIStoryboard.init(name: "SBMine", bundle: nil)
        
        var viewControllerMine: TableViewControllerMine
        viewControllerMine = storyboardMine.instantiateViewControllerWithIdentifier("tableViewControllerMine") as! TableViewControllerMine
        
        self.setViewControllers([viewControllerMine], animated: false)

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
