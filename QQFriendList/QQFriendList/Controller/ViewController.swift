//
//  ViewController.swift
//  QQFriendList
//
//  Created by 李明禄 on 2016/12/18.
//  Copyright © 2016年 SocererGroup. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, LSHeaderViewDelegate {
    
    let cellIdentifier = "friend"
    let headIdentifier = "headView"
    
    
    var tableView: UITableView!
    let screenBounds = UIScreen.main.bounds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let tableView = UITableView.init(frame: CGRect.init(origin: screenBounds.origin, size: screenBounds.size), style: UITableViewStyle.grouped)
        
        tableView.register(UINib.init(nibName: "LSFriendCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
        
//        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: cellIdentifier)
    
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        
        self.tableView = tableView
        self.view.addSubview(tableView)
//        状态栏  20
//        导航条 44
//        tabbar 49
        
        let insets = UIEdgeInsetsMake(20, 0, 49, 0)
        self.tableView.contentInset = insets
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.backgroundColor = UIColor.green
        
        self.tableView.sectionFooterHeight = 0
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - tableviewDelegate Methord
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return self.fridendModels.count
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let group = self.fridendModels![section]
        print(group.name!)
        
//        return group.friends!.count

//        return (group.isShow??group.friends!.count:0)
        if group.isShow! {
            return group.friends!.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! LSFriendCell
       
        let group = self.fridendModels[indexPath.section]
        print("\(group.name)")
        NSLog("sssssssssssssssss")
        
        let friend = (group.friends![indexPath.row]) as! LSFriend

        cell.icon.image = UIImage(named: friend.icon!)
        cell.name.setTitle(friend.name!, for: .normal)
        cell.intro.setTitle(friend.intro, for: .normal)

        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headView = LSHeaderView.init(reuseIdentifier: headIdentifier)
        let group = self.fridendModels[section]
        
        headView.delegate = self
        
        headView.tag = section
        print("-------section" + "\(section)" )
        
        headView.friendGroup = group
        return headView
    }
    
    func clickedGroupTitle(headerView: LSHeaderView) {
        let section = NSIndexSet.init(index: headerView.tag) as IndexSet
        self.tableView.reloadSections(section, with: .automatic)
    }
   
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }



    // MARK: - 懒加载模型
    lazy var fridendModels: [LSGroup]! = {
        var friendsModelArray = [LSGroup]()
        friendsModelArray = LSGroup.dictModel()
        return friendsModelArray
        
    }()
    

}

