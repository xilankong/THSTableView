//
//  LeftCell.swift
//  THSTableView
//
//  Created by yanghuang on 2017/4/27.
//  Copyright © 2017年 com.yang. All rights reserved.
//

import UIKit

class LeftCell: UITableViewCell {

    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let line = UIView(frame: CGRect(x: 0, y: self.frame.size.height - 0.5, width: self.frame.size.width, height: 0.5))
        line.backgroundColor = UIColor.lightGray
        self.contentView.addSubview(line)
        self.textLabel?.font = UIFont.systemFont(ofSize: 14.0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
