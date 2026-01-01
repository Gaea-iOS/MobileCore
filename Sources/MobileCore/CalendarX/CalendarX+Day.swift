// CalendarX+Day.swift
// Copyright (c) 2023 Nostudio
// Created by Jerry X T Wang on 2023/7/6.

import Foundation

extension CalendarX {
    public struct Day: Sendable, Codable {
        public let year: Int
        public let month: Int
        public let day: Int
        
        public static func today(in calendar: Calendar) -> Self {
            .init(date: .now, in: calendar)
        }
        
        public init(year: Int, month: Int, day: Int) {
            self.year = year
            self.month = month
            self.day = day
        }

        public init(date: Date, in calendar: Calendar) {
            year = calendar.component(.year, from: date)
            month = calendar.component(.month, from: date)
            day = calendar.component(.day, from: date)
        }

        public func date(in calendar: Calendar) -> Date {
            return calendar.date(Ofyear: year, month: month, day: day)!
        }
        
        public func weekday(in calendar: Calendar) -> Int {
            let date = date(in: calendar)
            let components = calendar.dateComponents([.weekday], from: date)
            let weekday = components.weekday!
            return weekday
        }
    }
}

extension CalendarX.Day: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(year)
        hasher.combine(month)
        hasher.combine(day)
    }
}

extension CalendarX.Day: Equatable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.year == rhs.year
        && lhs.month == rhs.month
        && lhs.day == rhs.day
    }
}

extension CalendarX.Day: Comparable {
    public static func < (lhs: Self, rhs: Self) -> Bool {
        lhs.year < rhs.year
        || (lhs.year == rhs.year && lhs.month < rhs.month)
        || (lhs.year == rhs.year && lhs.month == rhs.month && lhs.day < rhs.day)
    }
}
