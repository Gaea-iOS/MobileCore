//
//  File.swift
//  
//
//  Created by 王小涛 on 2023/5/30.
//

import Foundation

public extension Date {
    private func isEqual(to date: Date, toGranularity component: Calendar.Component, in calendar: Calendar = .current) -> Bool {
        calendar.isDate(self, equalTo: date, toGranularity: component)
    }

    func isInSameYear(as date: Date, in calendar: Calendar = .current) -> Bool {
        isEqual(to: date, toGranularity: .year, in: calendar)
    }
    
    func isInSameMonth(as date: Date, in calendar: Calendar = .current) -> Bool {
        isEqual(to: date, toGranularity: .month, in: calendar)
    }
    
    func isInSameWeek(as date: Date, in calendar: Calendar = .current) -> Bool {
        isEqual(to: date, toGranularity: .weekOfYear, in: calendar)
    }

    func isInSameDay(as date: Date, in calendar: Calendar = .current) -> Bool {
        calendar.isDate(self, inSameDayAs: date)
    }

    func isInThisYear(in calendar: Calendar = .current) ->  Bool {
        isInSameYear(as: Date())
    }
    
    func isInThisMonth(in calendar: Calendar = .current) ->  Bool {
        isInSameMonth(as: Date())
    }
    
    func isInThisWeek(in calendar: Calendar = .current) ->  Bool {
        isInSameWeek(as: Date())
    }

    func isInYesterday(in calendar: Calendar = .current) ->  Bool {
        calendar.isDateInYesterday(self)
    }
    
    func isInToday(in calendar: Calendar = .current) -> Bool {
        calendar.isDateInToday(self)
    }
    
    func isInTomorrow(in calendar: Calendar = .current) -> Bool {
        calendar.isDateInTomorrow(self)
    }

    var isInTheFuture: Bool {
        self > Date()
    }
    
    var isInThePast:   Bool {
        self < Date()
    }
}
