////
////  File.swift
////  
////
////  Created by Jerrywang on 2023/5/10.
////
//
//import Foundation
//
//public extension Date {
//    func dateComponents(_ components: Set<Calendar.Component>, in calendar: Calendar = .current) -> DateComponents {
//        calendar.dateComponents(components, from: self)
//    }
//}
//
//public extension Date {
//    func year(in calendar: Calendar = .current) -> Int {
//        dateComponents([.year]).year!
//    }
//    
//    func month(in calendar: Calendar = .current) -> Int {
//        dateComponents([.month]).month!
//    }
//    
//    func day(in calendar: Calendar = .current) -> Int {
//        dateComponents([.day]).day!
//    }
//    
//    func weekday(in calendar: Calendar = .current) -> Int {
//        dateComponents([.weekday]).weekday!
//    }
//}
//
//public extension Date {
//    func startOfDay(in calendar: Calendar = .current) -> Date {
//        calendar.startOfDay(for: self)
//    }
//    
//    func endOfDay(in calendar: Calendar = .current) -> Date {
//        let startOfDay = startOfDay(in: calendar)
//        
//        var components = DateComponents()
//        components.day = 1
//        components.second = -1
//        
//        let endOfDay = calendar.date(byAdding: components, to: startOfDay)!
//        return endOfDay
//    }
//}
