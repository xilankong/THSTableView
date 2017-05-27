//
//  RightCell.swift
//  THSTableView
//
//  Created by yanghuang on 2017/4/27.
//  Copyright © 2017年 com.yang. All rights reserved.
//

import UIKit
import SnapKit

class RightCell: UITableViewCell {
    
    var labelView: LabelView?
    
    //MARK: - 初始化rightCell
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        let view =  UIView()
        view.backgroundColor = UIColor.clear
        selectedBackgroundView = view
        
        contentView.addLine()
        
        labelView = LabelView()
        contentView.addSubview(labelView!)
        labelView?.snp.makeConstraints({ [weak self] (make) in
            guard let weakself = self else{
                return
            }
            make.edges.equalTo(weakself.contentView)
        })
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func updateView(withModel model: [String]) {
        labelView?.updateView(withModel: model)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        //        super.setSelected(selected, animated: animated)
    }
}


class LabelView: UIView {
    
    var labelArray:[UILabel] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateView(withModel model: [String]) {
        
        if model.count == 0 || labelArray.count != model.count{
            for view in self.subviews {
                view.removeFromSuperview()
            }
            for str in model {
                let label = UILabel()
                label.textAlignment = NSTextAlignment.center
                label.text = str
                self.addSubview(label)
                labelArray.append(label)
            }
            if labelArray.count == 1 {
                let label = labelArray[0]
                label.snp.makeConstraints({ [weak self] (make) in
                    guard let weakself = self else{
                        return
                    }
                    make.edges.equalTo(weakself)
                })
            } else if labelArray.count > 1 {
                
                let labelTwo = labelArray[1]
                var labelCurrent = labelArray[0]
                
                for (index,label) in labelArray.enumerated() {
                    label.snp.makeConstraints({ [weak self] (make) in
                        guard let weakself = self else{
                            return
                        }
                        make.top.bottom.equalTo(weakself)
                        if index == 0 {
                            make.leading.equalTo(weakself)
                            make.width.equalTo(labelTwo.snp.width)
                        }else{
                            make.leading.equalTo(labelCurrent.snp.trailing)
                            make.width.equalTo(labelCurrent.snp.width)
                        }
                        if index == weakself.labelArray.count - 1 {
                            make.trailing.equalTo(weakself)
                        }
                    })
                    labelCurrent = label
                }
            }
        } else {
            for (index,str) in model.enumerated() {
                labelArray[index].text = str
            }
        }
    }
    
}


extension UIView {
    
    func addLine() {
        let line = UIImageView(image: #imageLiteral(resourceName: "passWord_default_line"))
        self.addSubview(line)
        line.snp.makeConstraints { [weak self] (make) in
            guard let weakself = self else{
                return
            }
            make.leading.trailing.equalTo(weakself)
            make.bottom.equalTo(weakself)
            make.height.equalTo(0.5)
        }
    }
}
