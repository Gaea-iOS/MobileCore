//
//  File.swift
//  
//
//  Created by Jerrywang on 2023/5/11.
//

import Foundation

public extension Date {
    func isSameDay(as date: Date, in calendar: Calendar = .current) -> Bool {
        calendar.isDate(date, inSameDayAs: self)
    }
}
