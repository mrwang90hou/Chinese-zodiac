//
//  ViewController.swift
//  十二生肖
//
//  Created by 王宁 on 2017/3/28.
//  Copyright © 2017年 mrwang90hou. All rights reserved.
//

import UIKit
class ViewController: UIViewController,UIPickerViewDelegate{
    //定义控件名称，获取控件信息
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var yearsOfBirth: UITextField!
    @IBOutlet weak var showChineseZodiac: UILabel!
    @IBOutlet weak var monthsOfBirth: UITextField!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var showConstellation: UILabel!
    @IBOutlet weak var datesOfBirth: UITextField!
    @IBOutlet weak var singPickerView: UIPickerView!
     var date = NSDate()
    //定义常量  取模    余数
    let offset = 3
    let chineseZodiac:[String] = ["子鼠","丑牛","寅虎","卯兔","辰龙","巳蛇","午马","未羊","申猴","酉鸡","戌狗","亥猪"]
    let foreignConstellation:[String] = ["白羊座","金牛座","双子座","巨蟹座","狮子座","处女座","天秤座","天蝎座","射手座","摩羯座","水瓶座","双鱼座"]
    //抽签(链接🔗数据库)
    let signs:[String] = ["上上","中上","下上","中上","中中","中下","上下","中下","下下"]
    //运势:
    //let lucks =

    //
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //resignFirstResponder （放弃第一响应者）的方法
        yearsOfBirth.resignFirstResponder()
        monthsOfBirth.resignFirstResponder()
        datesOfBirth.resignFirstResponder()
    }
    //指用户当前正在使用与之交互的控件,即First Responder 键盘
    //resignFirstResponder即“触发键盘隐藏”,或“触发键盘关闭”.
    /*为”显示生肖“的“Button”添加触摸事件action
      (1)TouchUpInside
      (2)TouchDown
      (3)TouchUpOutside
    */
///////////实现 显示生肖   的操作
    //点击事件1

    @IBAction func touchUpInside(_ sender: Any) {
        //放弃第一响应者(回收键盘)
        yearsOfBirth.resignFirstResponder()
        //动态绑定的机制
        if let year = Int(yearsOfBirth.text!) {
            let imageNumber = (year - offset) % 12
            image.image = UIImage(named: String(imageNumber))
            showChineseZodiac.text = chineseZodiac[imageNumber-1]
            image.highlightedImage = UIImage(named:String(imageNumber))
        }
        else
        {
            image.image = UIImage(named: String(1))
            showChineseZodiac.text = "显示生肖"
        }
        //图像的现实    高亮
        //        image.image = UIImage(named:String(3))
        //        image.highlightedImage = UIImage(named:String(3))
        //动态绑定的机制
    }
/*
    @IBAction func touchUpOutside(_ sender: Any) {
        yearsOfBirth.resignFirstResponder()
        if Int(yearsOfBirth.text!) != nil {
            // let imageNumber = (year - offset) % 12
            image.image = UIImage(named: String(4))
            image.highlightedImage = UIImage(named:String(4))
        }

    }
 */
    //点击事件2按住不松手
    @IBAction func touchDown(_ sender: Any) {
        yearsOfBirth.resignFirstResponder()
        if Int(yearsOfBirth.text!) != nil  {
            //let imageNumber = (year - offset) % 12
            image.image = UIImage(named: String(1))
            showChineseZodiac.text = chineseZodiac[1-1]
        }
        else
        {
            image.image = UIImage(named: "1-1")
            showChineseZodiac.text = "显示生肖"
        }
    }
///////////实现 显示星座   的操作
    
    @IBAction func touchUpInside02(_ sender: Any) {
        monthsOfBirth.resignFirstResponder()
        datesOfBirth.resignFirstResponder()
        
        if 1==1 && 2==2{
            print(1)
        }
        /*
        if let month = Int(monthsOfBirth.text!) && let day = Int(datesOfBirth.text!)
        {
            //选配类型  报错❌
        }
         */
        //选配类型
        if monthsOfBirth.text != nil && datesOfBirth.text != nil
        {
                //获取现在的日期
            let currentNowDate = Date()
            let dateformatter = DateFormatter()
/*
            //定义日期的格式
            let string1 = " 2016 - 10 - 05"
            //定义日期的格式
            dateformatter.dateFormat = " YYYY - MM - dd"
            //采用该格式
            var newDate1 = dateformatter.date(from: string1)
            print(newDate1 as Any)
            */
            let month = monthsOfBirth.text
            let day = datesOfBirth.text
            print(month as Any)
            print(day as Any)
            let date = month! + day!
            dateformatter.dateFormat = "MMdd"
            //string 更改为NSDate格式
            let NSdate = dateformatter.date(from:date)
            print(NSdate! as Date)
            print(NSdate as! NSDate)
            //得到正确的对应时间
            let dateNSVersion = NSdate as! NSDate
            //dateNSVersion.earlierDate(NSdate!)
            let laterDate = dateNSVersion.laterDate(NSdate!)
            //求得星座
            let stringConstellation = Constellation.calculateWithDate(date: laterDate)
            showConstellation.text = stringConstellation
            //print(date as! NSDate)
            //  var NSdate = date as! NSDate
            //let imageNumber02 = month * 10
            image2.image = UIImage(named: stringConstellation)
            //showConstellation.text = chineseZodiac[1]
        }
        else
        {
            image2.image = UIImage(named: "2")
            showConstellation.text = "showConstellation"
        }
    }
    /*
    @IBAction func touchDown02(_ sender: Any) {
        image2.image = UIImage(named: "白羊座")
        showConstellation.text = "白羊座"
    }
*/
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
/*
        //定义全局变量
        //时间选择器
        let btn = UIButton.init(frame: CGRect(x: 55, y: 480, width: 200, height: 40));
        btn.setTitle("时间选择器", for: UIControlState());
        btn.backgroundColor = UIColor.cyan;
        btn.layer.cornerRadius = 5;
        self.view.addSubview(btn);
        btn.addTarget(self, action: #selector(btnTimeClick), for:.touchUpInside);
 */
    }
    /*
    //按钮点击事件
    func btnTimeClick(_ buttonN:UIButton) {
        
        let datePVC = DatePickerViewController();
        self.navigationController?.pushViewController(datePVC, animated: true);
    }
 */
    //
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //UIPickerView
    //MARK:---UIPickerViewDelegate方法
    //设置pickerView每一行的标题
    /*
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component==0
        {
            return signs[row] as? String;
        }
        else
        {
            let rowNum = pickerView.selectedRow(inComponent: 0);
            //然后根据获取的行号获取第1分区所对应的数据
            let arrarY = signs[rowNum] as? NSArray;
            let nameStr = NSString.init(string: (arrarY![row] as? NSString)!);
            return nameStr as String;
        }
    }
    */
}
