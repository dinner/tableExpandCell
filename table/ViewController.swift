//
//  ViewController.swift
//  table
//
//  Created by James on 2020/6/22.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var dropAr:[Int] = [Int]()
    @IBOutlet weak var table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableInit()
    }
    
    func tableInit(){
        self.table.register(NSClassFromString("TableViewCell"), forCellReuseIdentifier: "cell")
        self.table.tableFooterView = UIView.init()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? TableViewCell
        if cell == nil{
            cell = TableViewCell.init(style: .default, reuseIdentifier: "cell") as TableViewCell
        }
        cell?.clickBlock = {[weak self] (b:Bool) -> () in
            if b{
                self?.dropAr.append(indexPath.row)
            }
            else{
                self?.dropAr.removeAll { (i) -> Bool in
                    i == indexPath.row
                }
            }
            self?.table.reloadRows(at: [indexPath], with: .automatic)
        }
        if self.dropAr.contains(indexPath.row){
            cell?.bt_drop.isSelected = true
            cell?.setIsDrop(b: true)
        }
        else{
            cell?.bt_drop.isSelected = false
            cell?.setIsDrop(b: false)
        }
        return cell!
    }
}

