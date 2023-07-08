//
//  File.swift
//
//
//  Created by Jerrywang on 2023/5/10.
//

import Foundation

public extension Date {    
    func yesterday(in calendar: Calendar = .current) -> Self {
        calendar.date(byAdding: .day, value: -1, to: self)!
    }

    func tomorrow(in calendar: Calendar = .current) -> Self {
        calendar.date(byAdding: .day, value: 1, to: self)!
    }

    func dayBeforeYesterday(in calendar: Calendar = .current) -> Self {
        calendar.date(byAdding: .day, value: -2, to: self)!
    }

    func dayAfterTomorrow(in calendar: Calendar = .current) -> Self {
        calendar.date(byAdding: .day, value: 2, to: self)!
    }
}
