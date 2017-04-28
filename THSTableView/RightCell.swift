//
//  RightCell.swift
//  THSTableView
//
//  Created by yanghuang on 2017/4/27.
//  Copyright © 2017年 com.yang. All rights reserved.
//

import UIKit

class RightCell: UITableViewCell {
    var line: UIView?
    var labelView: ContentView?

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        labelView = ContentView(frame: CGRect(x: 0, y: 0, width: 1000, height: self.frame.size.height))
        self.addSubview(labelView!)
        line = UIView(frame: CGRect(x: 0, y: self.frame.size.height - 0.5, width: 1000, height: 0.5))
        line?.backgroundColor = UIColor.lightGray
        self.contentView.addSubview(line!)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func updateView(withModel model: [String]) {
        labelView?.updateView(withArray: model)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
