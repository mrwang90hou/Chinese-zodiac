//
//  Constellation.swift
//  十二生肖
//
//  Created by 王宁 on 2017/3/31.
//  Copyright © 2017年 mrwang90hou. All rights reserved.
//

import Foundation
class Constellation: NSObject {
    /**
     通过日期获取星座
     - parameter date: 日期
     - returns: 星座名称
     */
    class func calculateWithDate(date: Date) -> String {
        guard let calendar = NSCalendar(identifier: NSCalendar.Identifier.gregorian) else {
            return ""
        }
        let components = calendar.components([.month, .day], from: date)
        let month = components.month!
        let day = components.day!
        
        /*
         星座时间表
         标志
         星座
         拉丁名称
         出生日期（公历）
         别名
         ♈
         白羊座
         Aries
         3月21日~4月19日
         牡羊座
         ♉
         金牛座
         Taurus
         4月20日～5月20日
         金牛座
         ♊
         双子座
         Gemini
         5月21日～6月21日
         双子座
         ♋
         巨蟹座
         Cancer
         6月22日～7月22日
         巨蟹座
         ♌
         狮子座
         Leo
         7月23日～8月22日
         狮子座
         ♍
         处女座
         Virgo
         8月23日～9月22日
         室女座
         ♎
         天秤座
         Libra
         9月23日～10月23日
         天平座
         ♏
         天蝎座
         Scorpio
         10月24日～11月22日
         天蝎座
         ♐
         射手座
         Sagittarius
         11月23日～12月21日
         人马座
         ♑
         摩羯座
         Capricorn
         12月22日～1月19日
         山羊座
         ♒
         水瓶座
         Aquarius
         1月20日～2月18日
         宝瓶座
         ♓
         双鱼座
         Pisces
         2月19日～3月20日
         双鱼座

         白羊座：3月21日～4月20日
         金牛座：4月21日～5月21日
         双子座：5月22日～6月21日
         巨蟹座：6月22日～7月22日
         狮子座：7月23日～8月23日
         处女座：8月24日～9月23日
         天秤座：9月24日～10月23日
         天蝎座：10月24日～11月22日
         射手座：11月23日～12月21日
         魔羯座：12月22日～1月20日
         水瓶座：1月21日～2月19日
         双鱼座：2月20日～3月20日
         */
        // 月以100倍之月作为一个数字计算出来
        let mmdd = month * 100 + day;
        var result = ""
        
        if ((mmdd >= 321 && mmdd <= 331) ||
            (mmdd >= 401 && mmdd <= 419)) {
            result = "白羊座♈️"
        } else if ((mmdd >= 420 && mmdd <= 430) ||
            (mmdd >= 501 && mmdd <= 520)) {
            result = "金牛座♉️"
        } else if ((mmdd >= 521 && mmdd <= 531) ||
            (mmdd >= 601 && mmdd <= 621)) {
            result = "双子座♊️"
        } else if ((mmdd >= 622 && mmdd <= 630) ||
            (mmdd >= 701 && mmdd <= 722)) {
            result = "巨蟹座♋️"
        } else if ((mmdd >= 723 && mmdd <= 731) ||
            (mmdd >= 801 && mmdd <= 822)) {
            result = "狮子座♌️"
        } else if ((mmdd >= 823 && mmdd <= 831) ||
            (mmdd >= 901 && mmdd <= 922)) {
            result = "处女座♍️"
        } else if ((mmdd >= 923 && mmdd <= 930) ||
            (mmdd >= 1001 && mmdd <= 1023)) {
            result = "天秤座♎️"
        } else if ((mmdd >= 1024 && mmdd <= 1031) ||
            (mmdd >= 1101 && mmdd <= 1122)) {
            result = "天蝎座♏️"
        } else if ((mmdd >= 1123 && mmdd <= 1130) ||
            (mmdd >= 1201 && mmdd <= 1221)) {
            result = "射手座♐️"
        } else if ((mmdd >= 1222 && mmdd <= 1231) ||
            (mmdd >= 101 && mmdd <= 119)) {
            result = "摩羯座♑️"
        } else if ((mmdd >= 120 && mmdd <= 131) ||
            (mmdd >= 201 && mmdd <= 218)) {
            result = "水瓶座♒️"
        } else if ((mmdd >= 219 && mmdd <= 229) ||
            (mmdd >= 301 && mmdd <= 320)) {
            //考虑到2月闰年有29天的
            result = "双鱼座♓️"
        }else{
            print(mmdd)
            result = "日期错误"
        }
        return result
    }
}
