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
    func year(_ calendar: Calendar) -> Int {
        dateComponents([.year]).year!
    }
    
    func month(_ calendar: Calendar) -> Int {
        dateComponents([.month]).month!
    }
    
    func day(_ calendar: Calendar) -> Int {
        dateComponents([.day]).day!
    }
    
    func weekday(_ calendar: Calendar) -> Int {
        dateComponents([.weekday]).weekday!
    }
}
