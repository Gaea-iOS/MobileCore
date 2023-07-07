////
////  File.swift
////  
////
////  Created by Jerrywang on 2023/5/18.
////
//
//import Foundation
//
//public extension Date {
//    func startOfWeek(in calendar: Calendar = .current) -> Date {
//        let sunday = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self))!
//        return sunday
//    }
//    
//    func endOfWeek(in calendar: Calendar = .current, returnEndTime: Bool = false) -> Date {
//        let sunday = startOfWeek(in: calendar)
//        
//        var components = DateComponents()
//        if returnEndTime {
//            components.day = 7
//            components.second = -1
//        } else {
//            components.day = 6
//        }
//        
//        let saturday = calendar.date(byAdding: components, to: sunday)!
//        return saturday
//    }
//}
//
//public extension Date {
//    func weekDates(in calendar: Calendar = .current) -> [Date] {
//        let sunday = startOfWeek(in: calendar)
//        
//        return (0...6).map {
//            calendar.date(byAdding: .day, value: $0, to: sunday)!
//        }
//    }
//    
//    func previousWeekDates(in calendar: Calendar = .current) -> [Date] {
//        let date = calendar.date(byAdding: .day, value: -7, to: self)!
//        return date.weekDates(in: calendar)
//    }
//    
//    func nextWeekDates(in calendar: Calendar = .current) -> [Date] {
//        let date = calendar.date(byAdding: .day, value: 7, to: self)!
//        return date.weekDates(in: calendar)
//    }
//}
