//
//  LSHeaderView.swift
//  QQFriendList
//
//  Created by 李明禄 on 2016/12/20.
//  Copyright © 2016年 SocererGroup. All rights reserved.
//

import UIKit

protocol LSHeaderViewDelegate: NSObjectProtocol {
    func clickedGroupTitle(headerView: LSHeaderView)
}

class LSHeaderView: UITableViewHeaderFooterView {
    var groupTitle =  UIButton()
    var groupOnlineCount = UILabel()
    
    weak var delegate: LSHeaderViewDelegate?
    
    
    
    var friendGroup: LSGroup! {
        didSet {
            self.groupTitle.setTitle(friendGroup.name!, for: UIControlState.normal)
            
            //添加好友数量
            self.groupOnlineCount.text = "\(friendGroup.online!)" + "/" + "\(friendGroup.friends!.count)"
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
        self.groupTitle.imageEdgeInsets = UIEdgeInsets(top: 15, left: 0, bottom: 15, right: 3)
        
        self.groupTitle.addTarget(self, action: #selector(clickGroupTitle), for: .touchUpInside)
        
        
        contentView.addSubview(self.groupOnlineCount)

        self.contentView.backgroundColor = UIColor.red

        
    }
    
    func clickGroupTitle() {
        print("点击了组按钮！！！")
        self.friendGroup.isShow = !(self.friendGroup.isShow)
        delegate?.clickedGroupTitle(headerView: self)
        
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
        
        self.groupTitle.frame = self.bounds
        
        let onlineW:  CGFloat = 60
        let onlineH = self.bounds.height
        let onlineX = self.bounds.width - 10 - onlineW
        let onlineY: CGFloat = 0

        
        let onlineFrame = CGRect(x: onlineX, y: onlineY, width: onlineW, height: onlineH)
        self.groupOnlineCount.frame = onlineFrame
        
        
    }

}
