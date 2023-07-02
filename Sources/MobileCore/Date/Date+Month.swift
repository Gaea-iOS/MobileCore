//
//  File.swift
//
//
//  Created by Jerrywang on 2023/5/10.
//

import Foundation

public extension Date {
    func startOfMonth(in calendar: Calendar = .current) -> Date {
        let calendar = NSCalendar.current
        let components = calendar.dateComponents([.year, .month], from: self)
        let startOfMonth = calendar.date(from: components)!
        return startOfMonth
    }
 
    func endOfMonth(in calendar: Calendar = .current, returnEndTime: Bool = false) -> Date {
        var components = DateComponents()
        components.month = 1
        if returnEndTime {
            components.second = -1
        } else {
            components.day = -1
        }
         
        let startOfMonth = startOfMonth(in: calendar)
        let endOfMonth =  calendar.date(byAdding: components, to: startOfMonth)!
        return endOfMonth
    }
}

public extension Date {
    func monthDates(in calendar: Calendar = .current) -> [Date] {
        let startOfMonth = startOfMonth(in: calendar)
        let endOfMonth = endOfMonth(in: calendar)
        
        let days = startOfMonth.day(in: calendar)...endOfMonth.day(in: calendar)
        return days.map {
            calendar.date(byAdding: .day, value: $0 - 1, to: startOfMonth)!
        }
    }
}

public extension Date {
    func monthDatesWithPadding(in calendar: Calendar = .current) -> [Date] {
        let startOfMonth = startOfMonth(in: calendar)
        let endOfMonth = endOfMonth(in: calendar)
        
        let startWeekday = startOfMonth.weekday(in: calendar)
        let prefixDates = (1..<startWeekday)
            .map {
                calendar.date(byAdding: .day, value: -(startWeekday - $0), to: startOfMonth)!
            }
        
        let endWeekday = endOfMonth.weekday(in: calendar)
        var postfixDates: [Date] = []
        if endWeekday < 7 {
            postfixDates = ((endWeekday + 1)...7)
                .map {
                    calendar.date(byAdding: .day, value: $0 - endWeekday, to: endOfMonth)!
                }
        }

        let dates = prefixDates + monthDates(in: calendar) + postfixDates
        precondition(dates.count % 7 == 0)
        return dates
    }
}
