//
//  Common.swift
//  NewbieZone
//
//  Created by zhaochenjun on 15/12/30.
//  Copyright © 2015年 kazmastudio. All rights reserved.
//

import UIKit
import RealmSwift

let realm = try! Realm()

let weChatAppid = "wx74587b9207ae1ef6"
let weChatSecret = "acd901b1dc3bcba6ed1e4bbe50b91d73"

let URL_WECHAT_ACCESSTOKEN = "https://api.weixin.qq.com/sns/oauth2/access_token"
let URL_WECHAT_USERINFO = "https://api.weixin.qq.com/sns/userinfo"

let userDefaults = NSUserDefaults.standardUserDefaults()

// we chat key
let KEY_WECHATINFO = "weChatInfo"
let KEY_OPENID = "openid"
let KEY_NICKNAME = "nickname"
let KEY_AVATAR = "headimgurl"

// segue id
let SEGUE_LOGIN_2_MAIN = "Login2Main"


