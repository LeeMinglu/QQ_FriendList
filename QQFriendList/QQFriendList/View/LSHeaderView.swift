//
//  LSHeaderView.swift
//  QQFriendList
//
//  Created by 李明禄 on 2016/12/20.
//  Copyright © 2016年 SocererGroup. All rights reserved.
//

import UIKit

class LSHeaderView: UITableViewHeaderFooterView {
    var groupTitle =  UIButton()
    var groupOnlineCount = UILabel()
    
    var friendGroup: LSGroup! {
        didSet {
            self.groupTitle.setTitle(friendGroup.name, for: UIControlState.normal)
        }
    }
    
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        
        contentView.addSubview(self.groupTitle)
        self.groupTitle.setImage(UIImage.init(named: "buddy_header_arrow"), for: UIControlState.normal)
        
        self.groupTitle.setTitleColor(UIColor.blue, for: UIControlState.normal)
        
        self.groupTitle.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
        self.groupTitle.contentVerticalAlignment = UIControlContentVerticalAlignment.fill
        
        self.groupTitle.contentEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
        contentView.addSubview(self.groupOnlineCount)
        
        self.contentView.backgroundColor = UIColor.red

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func layoutSubviews() {
        super.layoutSubviews()
        let groupTitleFrame = CGRect(x: 5, y: 0, width: 100, height: 10)
        self.groupTitle.frame = self.bounds
    }

}
