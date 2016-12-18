//
//  LSGroup.swift
//  QQFriendList
//
//  Created by 李明禄 on 2016/12/18.
//  Copyright © 2016年 SocererGroup. All rights reserved.
//

import UIKit

class LSGroup: NSObject {
    var friends: Array<AnyObject>?
    var name: String?
    var online: NSNumber?
 
    
    let properties = ["friends", "name", "online"]
    override var description: String {
        let dict = dictionaryWithValues(forKeys: properties)
        return ("\(dict)")
    }
    // MARK: - 构造函数
    init(dict: [String: AnyObject]) {
        super.init()
        setValuesForKeys(dict)
        var friends = [LSFriend]()
        for friendDict in self.friends! {
            let friend = LSFriend.init(dict: friendDict as! [String : AnyObject])
            friends.append(friend)
        }
    }
    
    override func  setValue(_ value: Any?, forUndefinedKey key: String) { }
    
    class func dictModel() -> [LSGroup] {
        
        let path = Bundle.main.path(forResource: "friends.plist", ofType: nil)
        let list = NSArray.init(contentsOfFile: path!)!
        
        var models = [LSGroup]()
        for dict in list {
            models.append(LSGroup(dict: dict as! [String : AnyObject]))
        }
        return models
    }


}
