//
//  Month.swift
//  MobileCore
//
//  Created by 王小涛 on 2025/12/20.
//

import Foundation

extension DateFormatter {
    public static let `default`: DateFormatter = .init()
}

@frozen public enum Month: Int, Equatable, Hashable, Comparable, Codable, CaseIterable, Identifiable {
    case january = 1
    case february
    case march
    case april
    case may
    case june
    case july
    case august
    case september
    case october
    case november
    case december

    public var id: Int {
        rawValue
    }
    
    public static func < (lhs: Self, rhs: Self) -> Bool {
        lhs.rawValue < rhs.rawValue
    }

    public func shortSymbol(
        dateFormatter: DateFormatter = .default
    ) -> String {
        dateFormatter.shortMonthSymbols[rawValue - 1]
    }

    public func veryShortSymbol(
        dateFormatter: DateFormatter = .default
    ) -> String {
        dateFormatter.veryShortMonthSymbols[rawValue - 1]
    }
    
    public func standaloneSymbol(
        dateFormatter: DateFormatter = .default
    ) -> String {
        dateFormatter.standaloneMonthSymbols[rawValue - 1]
    }
    
    public func shortStandaloneSymbol(
        dateFormatter: DateFormatter = .default
    ) -> String {
        dateFormatter.shortStandaloneMonthSymbols[rawValue - 1]
    }
    
    public func veryShortStandaloneSymbol(
        dateFormatter: DateFormatter = .default
    ) -> String {
        dateFormatter.veryShortStandaloneMonthSymbols[rawValue - 1]
    }
}

public extension Set where Element == Month {
    static let allMonths: Self = .init(Month.allCases)
}
