//
//  LunarDateFormatter.swift
//  MobileCore
//
//  Created by 王小涛 on 2025/12/24.
//

import Foundation

enum LunarDateFormatter {
    private static let chineseMonths = ["正月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "冬月", "腊月"]
    
    private static let chineseDays = [
        "初一", "初二", "初三", "初四", "初五", "初六", "初七", "初八", "初九", "初十",
        "十一", "十二", "十三", "十四", "十五", "十六", "十七", "十八", "十九", "二十",
        "廿一", "廿二", "廿三", "廿四", "廿五", "廿六", "廿七", "廿八", "廿九", "三十"
    ]
    
    private static let calendar = Calendar(identifier: .chinese)
    
    enum Format {
        case full
        case year
        case month
        case day
    }
    
    static func format(day: CalendarX.Day, format: Format = .full) -> String {
        switch format {
        case .full:
            formatFull(date: day.date())
        case .year:
            formatYear(date: day.date())
        case .month:
            formatMonth(date: day.date())
        case .day:
            formatDay(date: day.date())
        }
    }

    private static func formatFull(date: Date) -> String {
        let yearString = formatYear(date: date)
        let monthString = formatMonth(date: date)
        let dayString = formatDay(date: date)
        
        return "\(yearString)\(monthString)\(dayString)"
    }
    
    private static func formatYear(date: Date) -> String {
        let yearFormatter = DateFormatter()
        yearFormatter.calendar = calendar
        yearFormatter.locale = Locale(identifier: "zh_CN")
        yearFormatter.dateStyle = .full // 关键：全格式包含干支
        let fullString = yearFormatter.string(from: date) // 类似 "2025年乙巳年冬月廿二"

        // 从全字符串中提取干支部分（正则匹配两个汉字加“年”）
        let yearString: String = {
            let pattern = "[\\u4e00-\\u9fa5]{2}年"
            let regex = try? NSRegularExpression(pattern: pattern)
            
            if let match = regex?.firstMatch(in: fullString, range: NSRange(fullString.startIndex..., in: fullString)),
               let range = Range(match.range, in: fullString)
            {
                return String(fullString[range])
            } else {
                return "" // 回退处理
            }
        }()
        
        return yearString
    }
    
    private static func formatMonth(date: Date) -> String {
        let month = calendar.component(.month, from: date)
        let isLeapMonth = calendar.component(.isLeapMonth, from: date) != 0
        
        var monthString = chineseMonths[month - 1]
        if isLeapMonth {
            monthString = "闰" + monthString
        }
        return monthString
    }
    
    private static func formatDay(date: Date) -> String {
        let day = calendar.component(.day, from: date)
        let dayString = chineseDays[day - 1]
        return dayString
    }
}
