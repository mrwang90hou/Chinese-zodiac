//: Playground - noun: a place where people can play

import UIKit

let str = "Hello, playground"
let chineseZodiac:[String] = ["子鼠","丑牛","寅虎","卯兔","辰龙","巳蛇","午马","未羊","申猴","酉鸡","戌狗","亥猪"]


let date:[String] = ["2-1","2-2","2-3"]
let dateformatter = DateFormatter()
dateformatter.dateFormat = date[0]
let dd = dateformatter.date(from:date[0])

//for

//print(chineseZodiac[1])
//获取当前日期
let currentdate = Date()
dateformatter.dateStyle = .full
dateformatter.timeStyle = .long
let dateString = dateformatter.string(from: currentdate)
let customDate = dateformatter.string(from: currentdate)
//定义日期的格式
var string1 = " 2016 - 10 - 05"
//定义日期的格式
dateformatter.dateFormat = " YYYY - MM - dd"
//采用该格式
var newDate1 = dateformatter.date(from: string1)
print(newDate1 as Any)

var string11 = "11"
var string22 = "3"
var string33 = string11 + string22
string11.append("-\(string22)")
dateformatter.dateFormat = "MM-dd"
var newDate2 = dateformatter.date(from:string11)

print(newDate2 as Any)
//print(newDate1 > newDate2 ? newDate1 : newDate2)
//字符串赋值到日期上面
dateformatter.dateFormat = "MMM dd,yyyy"
var dateAsString = "Oct 01,2017"
var date1 = dateformatter.date(from: dateAsString)
print(date1 as! NSDate)
var dateNSVersion = date1 as! NSDate
dateAsString = "Oct 02,2015"
var date2 = dateformatter.date(from: dateAsString)
dateNSVersion.earlierDate(date2!)
dateNSVersion.laterDate(date2!)
print(date1 as Any)
print(date2 as Any)

if date1?.compare(date2!) == .orderedAscending
{
    print("<")
}
if date1?.compare(date2!) == .orderedSame
{
    print(" = ")
}

if date1?.compare(date2!) == .orderedDescending
{
    print("<")
}
if  (date1?.timeIntervalSinceReferenceDate)! -   (date2?.timeIntervalSinceReferenceDate)! >= 0{
    print("大于等于")
}
else{
    print("小于")
}
