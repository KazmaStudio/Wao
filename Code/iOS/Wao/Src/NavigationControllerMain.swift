//
//  NavigationControllerMain.swift
//  Wao
//
//  Created by zhaochenjun on 16/1/6.
//  Copyright © 2016年 kazmastudio. All rights reserved.
//

import UIKit

class NavigationControllerMain: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var storyboardMain: UIStoryboard
        storyboardMain = UIStoryboard.init(name: "SBMain", bundle: nil)
        
        var viewControllerMain: ViewControllerMain
        viewControllerMain = storyboardMain.instantiateViewControllerWithIdentifier("viewControllerMain") as! ViewControllerMain
        
        self.setViewControllers([viewControllerMain], animated: false)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    

}
