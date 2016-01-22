//
//  NavigationViewControllerWish.swift
//  Wao
//
//  Created by 华瑞金科 on 16/1/20.
//  Copyright © 2016年 kazmastudio. All rights reserved.
//

import UIKit

class NavigationViewControllerWish: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        var storyBoardWish: UIStoryboard
        storyBoardWish = UIStoryboard.init(name: "SBWish", bundle: nil)
        
        var wishControllerMain: WishViewControllerMain
        wishControllerMain = storyBoardWish.instantiateViewControllerWithIdentifier("wishController") as! WishViewControllerMain
        
        self.setViewControllers([wishControllerMain], animated: false)
        
        
    }


    

}
