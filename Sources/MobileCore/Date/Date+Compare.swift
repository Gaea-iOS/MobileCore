//
//  File.swift
//  
//
//  Created by Jerrywang on 2023/5/11.
//

import Foundation

public extension Date {
    func isInSameDay(as date: Date, in calendar: Calendar = .current) -> Bool {
        calendar.isDate(date, inSameDayAs: self)
    }
    
    func isInSameMonth(as date: Date, in calendar: Calendar = .current) -> Bool {
        calendar.isDate(date, equalTo: self, toGranularity: .month)
    }
    
    func isInSameYear(as date: Date, in calendar: Calendar = .current) -> Bool {
        calendar.isDate(date, equalTo: self, toGranularity: .year)
    }
}
