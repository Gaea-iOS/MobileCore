//
//  File.swift
//  
//
//  Created by Jerrywang on 2023/5/10.
//

import Foundation

public extension Date {
    func dateComponents(_ components: Set<Calendar.Component>, in calendar: Calendar = .current) -> DateComponents {
        calendar.dateComponents(components, from: self)
    }
}

public extension Date {
    func year(in calendar: Calendar = .current) -> Int {
        dateComponents([.year]).year!
    }
    
    func month(in calendar: Calendar = .current) -> Int {
        dateComponents([.month]).month!
    }
    
    func day(in calendar: Calendar = .current) -> Int {
        dateComponents([.day]).day!
    }
    
    func weekday(in calendar: Calendar = .current) -> Int {
        dateComponents([.weekday]).weekday!
    }
}
