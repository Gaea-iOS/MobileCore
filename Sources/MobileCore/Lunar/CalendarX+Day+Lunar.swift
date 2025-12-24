//
//  CalendarX+Day+Lunar.swift
//  MobileCore
//
//  Created by 王小涛 on 2025/12/24.
//

extension CalendarX.Day {
    public var chineseDay: String {
        LunarDateFormatter.format(day: self, format: .day)
    }
    
    public var chineseMonth: String {
        LunarDateFormatter.format(day: self, format: .month)
    }
}
