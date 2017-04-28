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
    
    var leftTableView: UITableView?
    var rightScrollowView: UIScrollView?
    var rightTableView: UITableView?
    
    var rightTitleView: ContentView?
    
    
    let dataArray: [[String]] = [
        ["同花顺","300.00","-1.31%","-5.56","-0.18%","8859","0.07%","1.33"],
        ["贵州茅台","46.10","-1.07%","-0.50","-0.17%","4141","0.09%","1.01"],
        ["格力电器","44.92","-2.37%","-1.09","-0.18%","6146","0.14%","1.40"]]
    let titleDataArray:[String] = ["最新","涨幅","涨跌","涨速","总手","换手","量比"]

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }

    func initUI() {
        
        
        let lineTop = UIView(frame: CGRect(x: 0, y: topHeight, width: SCREEN_WIDTH, height: 0.5))
        lineTop.backgroundColor = UIColor.lightGray
        self.view.addSubview(lineTop)
        let lineBottom = UIView(frame: CGRect(x: 0, y: topHeight + topBarHeight - 0.5, width: SCREEN_WIDTH, height: 0.5))
        lineBottom.backgroundColor = UIColor.lightGray
        self.view.addSubview(lineBottom)
        
        leftTableView = UITableView(frame: CGRect(x: 0, y: topHeight + topBarHeight, width: SCREEN_WIDTH, height: SCREEN_HEIGHT - topHeight), style: UITableViewStyle.plain)
        leftTableView?.separatorStyle = UITableViewCellSeparatorStyle.none
        leftTableView?.delegate = self
        leftTableView?.dataSource = self
        leftTableView?.register(LeftCell.classForCoder(), forCellReuseIdentifier: "LeftCell")
        self.view.addSubview(leftTableView!)
        
        rightScrollowView = UIScrollView(frame: CGRect(x: leftWidth, y: topHeight, width: SCREEN_WIDTH - leftWidth, height: SCREEN_HEIGHT - topHeight))
        rightScrollowView?.delegate = self
        rightScrollowView?.backgroundColor = UIColor.clear
        self.view.addSubview(rightScrollowView!)
        
        rightTableView = UITableView(frame: CGRect(x: 0, y: topBarHeight, width: 1000, height: SCREEN_HEIGHT - topHeight - 45), style: UITableViewStyle.plain)
        rightTableView?.separatorStyle = UITableViewCellSeparatorStyle.none
        rightTableView?.delegate = self
        rightTableView?.dataSource = self
        rightTableView?.register(RightCell.classForCoder(), forCellReuseIdentifier: "RightCell")

        self.rightScrollowView?.addSubview(rightTableView!)
        
        rightTitleView = ContentView(frame: CGRect(x: 0, y: 0, width: 1000, height: topBarHeight))
        rightTitleView?.updateView(withArray: titleDataArray)
        self.rightScrollowView?.addSubview(rightTitleView!)
        
        self.rightScrollowView?.contentSize = CGSize(width: 1000, height: SCREEN_HEIGHT - topHeight)
        self.rightScrollowView?.showsVerticalScrollIndicator = false
        self.rightScrollowView?.showsHorizontalScrollIndicator = false
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        if tableView == leftTableView {
            cell = tableView.dequeueReusableCell(withIdentifier: "LeftCell") ?? UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "LeftCell")
            cell.textLabel?.text = dataArray[indexPath.row][0]
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: "RightCell") ?? UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "RightCell")
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
            rightTableView.selectRow(at: indexPath, animated: false, scrollPosition: UITableViewScrollPosition.bottom)
        } else if tableView == rightTableView {
            leftTableView.selectRow(at: indexPath, animated: false, scrollPosition: UITableViewScrollPosition.bottom)
        }
        leftTableView.deselectRow(at: indexPath, animated: true)
        rightTableView.deselectRow(at: indexPath, animated: true)
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

