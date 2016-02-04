//
//  ManagerModel.swift
//  Wao
//
//  Created by 华瑞金科 on 16/2/3.
//  Copyright © 2016年 kazmastudio. All rights reserved.
//

import UIKit

//var YesOrNoEdit:Bool!
private let shareInstance = ManagerModel()
class ManagerModel: NSObject {
//    +(HYCurrentVCmanager *)shareInstance {
//    static dispatch_once_t onceToken;
//    static HYCurrentVCmanager *_currentVCmanager =nil;
//    dispatch_once(&onceToken, ^{
//    _currentVCmanager = [[HYCurrentVCmanager alloc] init];
//    });
//
//    return _currentVCmanager;
//    }
    static let shareInstance = ManagerModel()
    class var sharedDispathInstance: ManagerModel {
        
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: ManagerModel? = nil
        }
        dispatch_once(&Static.onceToken){
            Static.instance = ManagerModel()
        }
        return Static.instance!
    }
    private override init() {

    }
    

}
