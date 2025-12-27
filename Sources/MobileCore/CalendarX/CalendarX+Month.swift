// CalendarX+Month.swift
// Copyright (c) 2023 Nostudio
// Created by Jerry X T Wang on 2023/7/6.

import Foundation
import Collections

extension CalendarX {
    public struct Month: Hashable, Equatable, Sendable, Codable {
        public let year: Int
        public let month: Int
        
        public func weeks() -> OrderedSet<Week> {
            Month.weeksInMonth(month, year: year)
        }
        
        public func days() -> OrderedSet<Day> {
            Month.daysInMonth(month, year: year)
        }
        
        public static func == (lhs: Self, rhs: Self) -> Bool {
            lhs.year == rhs.year
            && lhs.month == rhs.month
        }
        
        public static var current: Self {
            let calendar: Calendar = CalendarX.gregorian
            let date: Date = .now
            let year = calendar.component(.year, from: date)
            let month = calendar.component(.month, from: date)
            return .init(year: year, month: month)
        }

        public init(year: Int, month: Int) {
            self.year = year
            self.month = month
        }
        
        public func next() -> Self {
            if month == 12 {
                return .init(year: year + 1, month: 1)
            } else {
                return .init(year: year, month: month + 1)
            }
        }
        
        public func previous() -> Self {
            if month == 1 {
                return .init(year: year - 1, month: 12)
            } else {
                return .init(year: year, month: month - 1)
            }
        }
    }
}

private extension CalendarX.Month {
    static func weeksInMonth(_ month: Int, year: Int) -> OrderedSet<CalendarX.Week> {
        let calendar = CalendarX.gregorian
        let numberOfWeeks = calendar.numberOfWeeksInMonth(month, year: year)!
        let weeks: [CalendarX.Week] = (1 ... numberOfWeeks).map {
            .init(year: year, month: month, weekOfMonth: $0)
        }
        return .init(weeks)
    }
    
    static func daysInMonth(_ month: Int, year: Int) -> OrderedSet<CalendarX.Day> {
        let calendar = CalendarX.gregorian
        let dates = calendar
            .datesInMonth(month, year: year)
        let days = dates.map(CalendarX.Day.init(date:))
        return .init(days)
    }
}

public extension CalendarX.Month {
    init(day: CalendarX.Day) {
        self = .init(year: day.year, month: day.month)
    }
}


//extension CalendarX.Month: Comparable {
//    public static func < (lhs: Self, rhs: Self) -> Bool {
//        lhs.year < rhs.year
//            || (lhs.year == rhs.year && lhs.month < rhs.month)
//    }
//}
