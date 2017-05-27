//
//  LeftCell.swift
//  THSTableView
//
//  Created by yanghuang on 2017/4/27.
//  Copyright © 2017年 com.yang. All rights reserved.
//

import UIKit

class LeftCell: UITableViewCell {

    //MARK: - 初始化leftCell
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let view =  UIView()
        view.backgroundColor = UIColor.clear
        selectedBackgroundView = view
        
        contentView.addLine()
        self.textLabel?.font = UIFont.systemFont(ofSize: 14.0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
    }

}
