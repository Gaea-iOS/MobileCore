// CalendarX+Month.swift
// Copyright (c) 2023 Nostudio
// Created by Jerry X T Wang on 2023/7/6.

import Foundation
import Collections

extension CalendarX {
    public struct Month: Sendable, Codable {
        public let year: Int
        public let month: Int
        
        public static func current(in calendar: Calendar) -> Self {
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
        
        public func weeks(in calendar: Calendar) -> OrderedSet<CalendarX.Week> {
            return calendar.weeksInMonth(month, year: year)
        }
        
        public func days(in calendar: Calendar) -> OrderedSet<CalendarX.Day> {
            return calendar.daysInMonth(month, year: year)
        }
    }
}

extension CalendarX.Month: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(year)
        hasher.combine(month)
    }
}

extension CalendarX.Month: Equatable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.year == rhs.year
        && lhs.month == rhs.month
    }
}

extension CalendarX.Month: Comparable {
    public static func < (lhs: CalendarX.Month, rhs: CalendarX.Month) -> Bool {
        lhs.year < rhs.year
        || (lhs.year == rhs.year && lhs.month < rhs.month)
    }
}
