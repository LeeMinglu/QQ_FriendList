//
//  ViewController.swift
//  QQFriendList
//
//  Created by 李明禄 on 2016/12/18.
//  Copyright © 2016年 SocererGroup. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let cellIdentifier = "friend"
    
    
    var tableView: UITableView!
    let screenBounds = UIScreen.main.bounds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let tableView = UITableView.init(frame: CGRect.init(origin: screenBounds.origin, size: screenBounds.size), style: UITableViewStyle.grouped)
        
//        tableView.register(UINib.init(nibName: "LSFriendCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
        
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: cellIdentifier)
    

        
        self.tableView = tableView
        self.view.addSubview(tableView)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
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
        let group = self.fridendModels[section]
        return group.friends!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        let group = self.fridendModels[indexPath.section]
        NSLog("sssssssssssssssss")
        
        let friend = (group.friends![indexPath.row]) as! LSFriend
        
        cell.imageView!.image = UIImage(named: friend.icon!)
        cell.textLabel!.text = friend.name!
//        cell.detailTextLabel!.text! = friend.intro!
        
        return cell
    }


    // MARK: - 懒加载模型
    lazy var fridendModels: [LSGroup]! = {
        var friendsModelArray = [LSGroup]()
        friendsModelArray = LSGroup.dictModel()
        return friendsModelArray
        
    }()
    

}

