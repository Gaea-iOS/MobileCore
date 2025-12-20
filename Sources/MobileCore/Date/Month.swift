//
//  Month.swift
//  MobileCore
//
//  Created by 王小涛 on 2025/12/20.
//

import Foundation

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
        dateFormatter: DateFormatter = .init()
    ) -> String {
        dateFormatter.shortMonthSymbols[rawValue - 1]
    }

    public func veryShortSymbol(
        dateFormatter: DateFormatter = .init()
    ) -> String {
        dateFormatter.veryShortMonthSymbols[rawValue - 1]
    }
    
    public func standaloneSymbol(
        dateFormatter: DateFormatter = .init()
    ) -> String {
        dateFormatter.standaloneMonthSymbols[rawValue - 1]
    }
    
    public func shortStandaloneSymbol(
        dateFormatter: DateFormatter = .init()
    ) -> String {
        dateFormatter.shortStandaloneMonthSymbols[rawValue - 1]
    }
    
    public func veryShortStandaloneSymbol(
        dateFormatter: DateFormatter = .init()
    ) -> String {
        dateFormatter.veryShortStandaloneMonthSymbols[rawValue - 1]
    }
}

public extension Set where Element == Month {
    static let allMonths: Self = .init(Month.allCases)
}
