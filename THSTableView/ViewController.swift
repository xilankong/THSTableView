//
//  ViewController.swift
//  THSTableView
//
//  Created by yanghuang on 2017/4/27.
//  Copyright © 2017年 com.yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    
    let SCREEN_WIDTH: CGFloat = UIScreen.main.bounds.size.width
    let SCREEN_HEIGHT: CGFloat = UIScreen.main.bounds.size.height
    let leftWidth: CGFloat = 120.0
    let topHeight: CGFloat = 64.0
    let topBarHeight: CGFloat = 30.0
    let rightCellWidth: CGFloat = 700.0
    
    let leftCellId = "leftCell"
    let rightCellId = "rightCell"
    
    var leftTableView: UITableView?
    var rightScrollowView: UIScrollView?
    var rightTableView: UITableView?
    var rightTitleView: LabelView?
    
    let dataArray: [[String]] = [
        ["同花顺","300.00","-1.31%","-5.56","-0.18%","8859","0.07%","1.33"],
        ["贵州茅台","46.10","-1.07%","-0.50","-0.17%","4141","0.09%","1.01"],
        ["贵州茅台","46.10","-1.07%","-0.50","-0.17%","4141","0.09%","1.01"],
        ["贵州茅台","46.10","-1.07%","-0.50","-0.17%","4141","0.09%","1.01"],
        ["贵州茅台","46.10","-1.07%","-0.50","-0.17%","4141","0.09%","1.01"],
        ["贵州茅台","46.10","-1.07%","-0.50","-0.17%","4141","0.09%","1.01"],
        ["贵州茅台","46.10","-1.07%","-0.50","-0.17%","4141","0.09%","1.01"],
        ["贵州茅台","46.10","-1.07%","-0.50","-0.17%","4141","0.09%","1.01"],
        ["贵州茅台","46.10","-1.07%","-0.50","-0.17%","4141","0.09%","1.01"],
        ["贵州茅台","46.10","-1.07%","-0.50","-0.17%","4141","0.09%","1.01"],
        ["贵州茅台","46.10","-1.07%","-0.50","-0.17%","4141","0.09%","1.01"],
        ["贵州茅台","46.10","-1.07%","-0.50","-0.17%","4141","0.09%","1.01"],
        ["贵州茅台","46.10","-1.07%","-0.50","-0.17%","4141","0.09%","1.01"],
        ["贵州茅台","46.10","-1.07%","-0.50","-0.17%","4141","0.09%","1.01"],
        ["贵州茅台","46.10","-1.07%","-0.50","-0.17%","4141","0.09%","1.01"],
        ["贵州茅台","46.10","-1.07%","-0.50","-0.17%","4141","0.09%","1.01"],
        ["贵州茅台","46.10","-1.07%","-0.50","-0.17%","4141","0.09%","1.01"],
        ["同花顺","300.00","-1.31%","-5.56","-0.18%","8859","0.07%","1.33"],
        ["贵州茅台","46.10","-1.07%","-0.50","-0.17%","4141","0.09%","1.01"],
        ["贵州茅台","46.10","-1.07%","-0.50","-0.17%","4141","0.09%","1.01"],
        ["贵州茅台","46.10","-1.07%","-0.50","-0.17%","4141","0.09%","1.01"],
        ["贵州茅台","46.10","-1.07%","-0.50","-0.17%","4141","0.09%","1.01"],
        ["贵州茅台","46.10","-1.07%","-0.50","-0.17%","4141","0.09%","1.01"],
        ["贵州茅台","46.10","-1.07%","-0.50","-0.17%","4141","0.09%","1.01"],
        ["贵州茅台","46.10","-1.07%","-0.50","-0.17%","4141","0.09%","1.01"],
        ["贵州茅台","46.10","-1.07%","-0.50","-0.17%","4141","0.09%","1.01"],
        ["贵州茅台","46.10","-1.07%","-0.50","-0.17%","4141","0.09%","1.01"],
        ["贵州茅台","46.10","-1.07%","-0.50","-0.17%","4141","0.09%","1.01"],
        ["贵州茅台","46.10","-1.07%","-0.50","-0.17%","4141","0.09%","1.01"],
        ["贵州茅台","46.10","-1.07%","-0.50","-0.17%","4141","0.09%","1.01"],
        ["贵州茅台","46.10","-1.07%","-0.50","-0.17%","4141","0.09%","1.01"],
        ["贵州茅台","46.10","-1.07%","-0.50","-0.17%","4141","0.09%","1.01"],
        ["贵州茅台","46.10","-1.07%","-0.50","-0.17%","4141","0.09%","1.01"],
        ["贵州茅台","46.10","-1.07%","-0.50","-0.17%","4141","0.09%","1.01"],
        ["格力电器","44.92","-2.37%","-1.09","-0.18%","6146","0.14%","1.40"]]
    let titleDataArray:[String] = ["最新","涨幅","涨跌","涨速","总手","换手","量比"]

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }

    //MARK: - 初始化
    func initUI() {
        
        let lineTop = UIView(frame: CGRect(x: 0, y: topHeight, width: SCREEN_WIDTH, height: 0.5))
        lineTop.backgroundColor = UIColor.lightGray
        self.view.addSubview(lineTop)
        let lineBottom = UIView(frame: CGRect(x: 0, y: topHeight + topBarHeight - 0.5, width: SCREEN_WIDTH, height: 0.5))
        lineBottom.backgroundColor = UIColor.lightGray
        self.view.addSubview(lineBottom)
        
        leftTableView = UITableView(frame: CGRect(x: 0, y: topHeight + topBarHeight, width: SCREEN_WIDTH, height: SCREEN_HEIGHT - topHeight - topBarHeight), style: UITableViewStyle.plain)
        leftTableView?.separatorStyle = UITableViewCellSeparatorStyle.none
        leftTableView?.delegate = self
        leftTableView?.dataSource = self
        leftTableView?.register(LeftCell.classForCoder(), forCellReuseIdentifier: leftCellId)
        self.view.addSubview(leftTableView!)
        
        rightScrollowView = UIScrollView(frame: CGRect(x: leftWidth, y: topHeight, width: SCREEN_WIDTH - leftWidth, height: SCREEN_HEIGHT - topHeight))
        rightScrollowView?.delegate = self
        rightScrollowView?.backgroundColor = UIColor.clear
        self.view.addSubview(rightScrollowView!)
        
        rightTableView = UITableView(frame: CGRect(x: 0, y: topBarHeight, width: rightCellWidth, height: SCREEN_HEIGHT - topHeight - topBarHeight), style: UITableViewStyle.plain)
        rightTableView?.separatorStyle = UITableViewCellSeparatorStyle.none
        rightTableView?.delegate = self
        rightTableView?.dataSource = self
        rightTableView?.register(RightCell.classForCoder(), forCellReuseIdentifier: rightCellId)

        self.rightScrollowView?.addSubview(rightTableView!)
        
        rightTitleView = LabelView(frame: CGRect(x: 0, y: 0, width: rightCellWidth, height: topBarHeight))
        rightTitleView?.updateView(withModel: titleDataArray)
        self.rightScrollowView?.addSubview(rightTitleView!)
        
        self.rightScrollowView?.contentSize = CGSize(width: rightCellWidth, height: SCREEN_HEIGHT - topHeight)
        self.rightScrollowView?.showsVerticalScrollIndicator = false
        self.rightScrollowView?.showsHorizontalScrollIndicator = false
        
    }
    
    //MARK: - 表代理
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        if tableView == leftTableView {
            cell = tableView.dequeueReusableCell(withIdentifier: leftCellId) ?? UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: leftCellId)
            cell.textLabel?.text = dataArray[indexPath.row][0]
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: rightCellId) ?? UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: rightCellId)
            var array = dataArray[indexPath.row]
            array.remove(at: 0)
            (cell as! RightCell).updateView(withModel: array)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let rightTableView = rightTableView,
            let leftTableView = leftTableView else {
                return
        }
        if tableView == leftTableView {
            rightTableView.selectRow(at: indexPath, animated: false, scrollPosition: UITableViewScrollPosition.none)
        } else if tableView == rightTableView {
            leftTableView.selectRow(at: indexPath, animated: false, scrollPosition: UITableViewScrollPosition.none)
        }
        
        let cellOne = leftTableView.cellForRow(at: indexPath)
        cellOne?.contentView.backgroundColor = UIColor.init(red: 0.90, green: 0.90, blue: 0.90, alpha: 1.0)
        let cellTwo = rightTableView.cellForRow(at: indexPath)
        cellTwo?.contentView.backgroundColor = UIColor.init(red: 0.90, green: 0.90, blue: 0.90, alpha: 1.0)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            cellOne?.contentView.backgroundColor = UIColor.clear
            cellTwo?.contentView.backgroundColor = UIColor.clear
        }
    }
    

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let rightTableView = rightTableView,
            let leftTableView = leftTableView else {
            return
        }
        if scrollView == leftTableView {
            rightTableView.contentOffset = leftTableView.contentOffset
        } else if scrollView == rightTableView {
            leftTableView.contentOffset = rightTableView.contentOffset
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

