//
//  LSFriendCell.swift
//  QQFriendList
//
//  Created by 李明禄 on 2016/12/18.
//  Copyright © 2016年 SocererGroup. All rights reserved.
//

import UIKit

class LSFriendCell: UITableViewCell {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var name: UIButton!
    @IBOutlet weak var intro: UIButton!
    
    var friendGruop: LSGroup{
        didSet{
            self.imageView
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
