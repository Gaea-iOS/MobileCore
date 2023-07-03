//
//  File.swift
//  
//
//  Created by 王小涛 on 2023/7/4.
//

import Foundation

public extension Calendar {
    func numberOfDaysInMonth(year: Int, month: Int) -> Int? {
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = 1

        guard let date = date(from: dateComponents),
              let range = range(of: .day, in: .month, for: date) else {
            return nil
        }

        return range.count
    }
}

