// Weekday.swift
// Copyright (c) 2023 Nostudio
// Created by Jerry X T Wang on 2023/3/1.

import Foundation

@frozen public enum Weekday: Int, Equatable, Hashable, Comparable, Codable, CaseIterable, Swift.Identifiable {
    case sunday = 1
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday

    public var id: Int {
        rawValue
    }
    
    public var isWeekend: Bool {
        Set<Weekday>.weekend.contains(self)
    }

    public static func < (lhs: Self, rhs: Self) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
    
    public func symbol(
        dateFormatter: DateFormatter = .default
    ) -> String {
        dateFormatter.weekdaySymbols[rawValue - 1]
    }

    public func shortSymbol(
        dateFormatter: DateFormatter = .default
    ) -> String {
        dateFormatter.shortWeekdaySymbols[rawValue - 1]
    }

    public func veryShortSymbol(
        dateFormatter: DateFormatter = .default
    ) -> String {
        dateFormatter.veryShortWeekdaySymbols[rawValue - 1]
    }
    
    public func standaloneSymbol(
        dateFormatter: DateFormatter = .default
    ) -> String {
        dateFormatter.standaloneWeekdaySymbols[rawValue - 1]
    }
    
    public func shortStandaloneSymbol(
        dateFormatter: DateFormatter = .default
    ) -> String {
        dateFormatter.shortStandaloneWeekdaySymbols[rawValue - 1]
    }
    
    public func veryShortStandaloneSymbol(
        dateFormatter: DateFormatter = .default
    ) -> String {
        dateFormatter.veryShortStandaloneWeekdaySymbols[rawValue - 1]
    }
}

public extension Set where Element == Weekday {
    static let workdays: Self = [.monday, .tuesday, .wednesday, .thursday, .friday]
    static let weekend: Self = [.saturday, .sunday]
    static let everyDay: Self = .init(Weekday.allCases)
}
