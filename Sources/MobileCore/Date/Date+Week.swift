//
//  File.swift
//  
//
//  Created by Jerrywang on 2023/5/10.
//

import Foundation

public extension Date {
    func startOfWeek(using calendar: Calendar = .current) -> Date {
        let sunday = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self))!
        return sunday
    }
    
    func endOfWeek(using calendar: Calendar = .current) -> Date {
        let sunday = startOfWeek(using: calendar)
        
        var components = DateComponents()
        components.day = 7
        components.second = -1
        
        let saturday = calendar.date(byAdding: components, to: sunday)!
        return saturday
    }
    
    func startOfDay(using calendar: Calendar = .current) -> Date {
        calendar.startOfDay(for: self)
    }
    
    func endOfDay(using calendar: Calendar = .current) -> Date {
        let startOfDay = startOfDay(using: calendar)
        
        var components = DateComponents()
        components.day = 1
        components.second = -1
        
        let endOfDay = calendar.date(byAdding: components, to: startOfDay)!
        return endOfDay
    }
}


public extension Date {
    func startOfPreviousWeek(using calendar: Calendar = .current) -> Date {
        let date = calendar.date(byAdding: .day, value: -7, to: self)!
        return date.startOfWeek(using: calendar)
    }

    func endOfPreviousWeek(using calendar: Calendar = .current) -> Date {
        let date = calendar.date(byAdding: .day, value: -7, to: self)!
        return date.endOfWeek(using: calendar)
    }
}

public extension Date {
    func startOfNextWeek(using calendar: Calendar = .current) -> Date {
        let date = calendar.date(byAdding: .day, value: 7, to: self)!
        return date.startOfWeek(using: calendar)
    }

    func endOfNextWeek(using calendar: Calendar = .current) -> Date {
        let date = calendar.date(byAdding: .day, value: 7, to: self)!
        return date.endOfWeek(using: calendar)
    }
}

public extension Date {
    func weekDates(using calendar: Calendar = .current) -> [Date] {
        let sunday = startOfWeek(using: calendar)
        let monday = calendar.date(byAdding: .day, value: 1, to: sunday)!
        let tuesday = calendar.date(byAdding: .day, value: 2, to: sunday)!
        let wednesday = calendar.date(byAdding: .day, value: 3, to: sunday)!
        let thursday = calendar.date(byAdding: .day, value: 4, to: sunday)!
        let friday = calendar.date(byAdding: .day, value: 5, to: sunday)!
        let saturday = calendar.date(byAdding: .day, value: 6, to: sunday)!
        return [sunday, monday, tuesday, wednesday, thursday, friday, saturday]
    }
    
    func previousWeekDates(using calendar: Calendar = .current) -> [Date] {
        let date = calendar.date(byAdding: .day, value: -7, to: self)!
        return date.weekDates(using: calendar)
    }
    
    func nextWeekDates(using calendar: Calendar = .current) -> [Date] {
        let date = calendar.date(byAdding: .day, value: 7, to: self)!
        return date.weekDates(using: calendar)
    }
}
