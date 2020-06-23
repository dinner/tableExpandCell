//
//  TableViewCell.swift
//  table
//
//  Created by James on 2020/6/22.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import Masonry

class TableViewCell: UITableViewCell {
    
    var clickBlock:(Bool)->() = {(Bool) -> () in}
    var _b_drop:Bool = false
    var _lb_name:UILabel?
    var lb_name:UILabel{
        get {
            guard _lb_name != nil else {
                _lb_name = UILabel.init()
                _lb_name?.text = "你好"
                return _lb_name!
            }
            return _lb_name!
        }
    }
    var _bt_drop:UIButton?
    
    var bt_drop:UIButton{
        get {
            guard _bt_drop != nil else {
                _bt_drop = UIButton.init()
                _bt_drop?.setImage(UIImage.init(named: "dropdown"), for: .normal)
                _bt_drop?.setImage(UIImage.init(named: "dropup"), for: .selected)
                _bt_drop?.addTarget(self, action: #selector(btDropCli), for: .touchUpInside)
                return _bt_drop!
            }
            return _bt_drop!
        }
        set {
            _bt_drop = newValue
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.orange
        self.selectionStyle = .none
        
        self.addSubview(self.bt_drop)
        self.addSubview(self.lb_name)
        self.bt_drop.mas_makeConstraints { (make) in
            make?.bottom.equalTo()(-10)
            make?.size.equalTo()(CGSize(width: 20, height: 20))
            make?.right.equalTo()(-10)
        }
        self.lb_name.mas_makeConstraints { (make) in
            make?.bottom.equalTo()(self.bt_drop.mas_top)?.offset()(-10)
            make?.center.equalTo()(self)
            make?.top.equalTo()(self)?.offset()(10)
            make?.left.equalTo()(10)
        }
    }
    
    @objc func btDropCli(){
        self.bt_drop.isSelected = !self.bt_drop.isSelected
        self.clickBlock(self.bt_drop.isSelected)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        if _b_drop {
            self.bt_drop.mas_updateConstraints { (make) in
                make?.bottom.equalTo()(-50)
            }
        }
        else{
            self.bt_drop.mas_updateConstraints { (make) in
                make?.bottom.equalTo()(-10)
            }
        }
    }

}
