//
//  File.swift
//  
//
//  Created by Jerrywang on 2023/5/10.
//

import Foundation

public extension Date {
    static let today: Self = .init()
    
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

public extension Date {
    init?(year: Int, month: Int, day: Int, in calendar: Calendar = .current) {
        guard let date = DateComponents(
            calendar: calendar,
            year: year,
            month: month,
            day: day
        ).date else {
            return nil
        }
        self = date
    }
}
