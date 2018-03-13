//
//  DatePickerViewController.swift.swift
//  十二生肖
//
//  Created by 王宁 on 2017/3/29.
//  Copyright © 2017年 mrwang90hou. All rights reserved.
//

import Foundation
import UIKit

class DatePickerViewController: UIViewController {
    
    var dateLabel = UILabel();
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.white;
        self.title = "时间选择器"
        
        //UIDatePicker时间选择器，继承于UIControl
        let datePick = UIDatePicker.init(frame: CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: 300));
        //设置显示时间样式，中or英，默认英文显示样式
        datePick.locale = Locale.init(identifier: "zh_CN");//中文
        datePick.backgroundColor = UIColor.lightGray;
        //设置显示类型
        datePick.datePickerMode = UIDatePickerMode.dateAndTime;//日期和时间
        //设置默认的日期
        datePick.date = Date.init();
        //设置可以选择的最小日期
        datePick.minimumDate = Date.init(timeIntervalSinceNow: -(60*60*24*7));
        //设置可以选择的最大日期
        datePick.maximumDate = Date.init(timeIntervalSinceNow: 60*60*24*7);
        //添加方法获取显示的日期值
        datePick.addTarget(self, action: #selector(changeValueDate), for: .valueChanged);
        self.view.addSubview(datePick);
        
        
        dateLabel = UILabel.init(frame: CGRect(x: 40, y: 390, width: self.view.frame.size.width-80, height: 50));
        dateLabel.textColor = UIColor.blue;
        dateLabel.textAlignment = NSTextAlignment.center;
        self.view.addSubview(dateLabel);
        
    }
    
    func changeValueDate(_ datePickerV:UIDatePicker) {
        //获取当前选中的时间
        let dateE = datePickerV.date;
        
        //转换时间格式
        let formatterR = DateFormatter.init();
        formatterR.dateFormat = "yyyy-MM-dd hh:mm:ss";
        
        let dateStr = formatterR.string(from: dateE);
        
        dateLabel.text = dateStr;
    }
    
}
