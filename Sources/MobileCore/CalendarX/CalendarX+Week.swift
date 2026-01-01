// CalendarX+Week.swift
// Copyright (c) 2023 Nostudio
// Created by Jerry X T Wang on 2023/7/6.

import Foundation
import Collections

extension CalendarX {
    public struct Week: Sendable, Codable {
        public let year: Int
        public let month: Int
        public let weekOfMonth: Int

        public init(year: Int, month: Int, weekOfMonth: Int) {
            self.year = year
            self.month = month
            self.weekOfMonth = weekOfMonth
        }
        
        public func days(in calendar: Calendar) -> OrderedSet<CalendarX.Day> {
            calendar.daysInWeekOfMonth(weekOfMonth, month: month, year: year)
        }
    }
}

extension CalendarX.Week: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(year)
        hasher.combine(month)
        hasher.combine(weekOfMonth)
    }
}

extension CalendarX.Week: Equatable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.year == rhs.year
        && lhs.month == rhs.month
        && lhs.weekOfMonth == rhs.weekOfMonth
    }
}

extension CalendarX.Week: Comparable {
    public static func < (lhs: CalendarX.Week, rhs: CalendarX.Week) -> Bool {
        lhs.year < rhs.year
        || (lhs.year == rhs.year && lhs.month < rhs.month)
        || (lhs.year == rhs.year && lhs.month == rhs.month && lhs.weekOfMonth < rhs.weekOfMonth)
    }
}
