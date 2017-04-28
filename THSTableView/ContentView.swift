//
//  ContentView.swift
//  THSTableView
//
//  Created by yanghuang on 2017/4/28.
//  Copyright © 2017年 com.yang. All rights reserved.
//

import UIKit

class ContentView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateView(withArray array: [String]) {
        for (index, str) in array.enumerated() {
            let width = frame.size.width / CGFloat(array.count) //在这并未完成layout，无法获取最新宽度
            let label = UILabel(frame: CGRect(x:CGFloat(index) * width, y: 0, width: width, height: frame.size.height))
            label.textAlignment = NSTextAlignment.center
            label.text = str
            label.font = UIFont.systemFont(ofSize: 14.0)
            self.addSubview(label)
        }
    }
}
