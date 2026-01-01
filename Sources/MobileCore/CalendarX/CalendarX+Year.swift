// CalendarX+Year.swift
// Copyright (c) 2023 Nostudio
// Created by Jerry X T Wang on 2023/7/6.

import Foundation
import Collections

extension CalendarX {
    public struct Year: Sendable, Codable {
        public let year: Int
        
        public static func current(in calendar: Calendar) -> Self {
            let components = calendar.dateComponents([.year], from: .now)
            let year = components.year!
            return .init(year: year)
        }

        public init(year: Int) {
            self.year = year
        }
        
        public func months() -> OrderedSet<CalendarX.Month> {
            let months: [CalendarX.Month] = (1 ... 12).map {
                .init(year: year, month: $0)
            }
            return .init(months)
        }
    }
}

extension CalendarX.Year: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(year)
    }
}

extension CalendarX.Year: Equatable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.year == rhs.year
    }
}

extension CalendarX.Year: Comparable {
    public static func < (lhs: CalendarX.Year, rhs: CalendarX.Year) -> Bool {
        lhs.year < rhs.year
    }
}
