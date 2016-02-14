//
//  ModelWeChatInfo.swift
//  Wao
//
//  Created by zhaochenjun on 16/1/8.
//  Copyright © 2016年 kazmastudio. All rights reserved.
//

import Foundation

class ModelWeChatInfo: NSObject {
    
    var nickname: String
    var openid: String
    var province: String
    var sex: Int
    var headimgurl: String
    
    init(nickname: String, openid: String, province: String, sex: Int ,headimgurl: String){
        self.nickname = nickname
        self.openid = openid
        self.province = province
        self.sex = sex
        self.headimgurl = headimgurl
        super.init()
        
    }
    
}
