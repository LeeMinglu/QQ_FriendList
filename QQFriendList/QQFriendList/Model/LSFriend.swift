//
//  LSFriend.swift
//  QQFriendList
//
//  Created by 李明禄 on 2016/12/18.
//  Copyright © 2016年 SocererGroup. All rights reserved.
//

import UIKit

class LSFriend: NSObject {
    
    var icon: String?
    var intro: String?
    var name: String?
    var vip: Bool! = true

    
    let properties = ["icon", "intro", "name", "vip"]
    override var description: String {
        let dict = dictionaryWithValues(forKeys: properties)
        return ("\(dict)")
    }
    // MARK: - 构造函数
    init(dict: [String: AnyObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func  setValue(_ value: Any?, forUndefinedKey key: String) { }
    
   
}
