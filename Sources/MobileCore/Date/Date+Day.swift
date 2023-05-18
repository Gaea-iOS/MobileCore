//
//  File.swift
//  
//
//  Created by Jerrywang on 2023/5/10.
//

import Foundation

public extension Date {
    func startOfDay(in calendar: Calendar = .current) -> Date {
        calendar.startOfDay(for: self)
    }
    
    func endOfDay(in calendar: Calendar = .current) -> Date {
        let startOfDay = startOfDay(in: calendar)
        
        var components = DateComponents()
        components.day = 1
        components.second = -1
        
        let endOfDay = calendar.date(byAdding: components, to: startOfDay)!
        return endOfDay
    }
}
