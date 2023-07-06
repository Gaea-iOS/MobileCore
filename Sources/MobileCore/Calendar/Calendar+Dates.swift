//
//  File.swift
//  
//
//  Created by 王小涛 on 2023/7/6.
//

import Foundation

public extension Calendar {
    func datesInPastNMonths(nMonths: Int, fromDate date: Date) -> [Date] {
        var dates = [Date]()
        var dateComponents = DateComponents()
        dateComponents.month = -nMonths

        guard let startDate = self.date(byAdding: dateComponents, to: date) else {
            return dates
        }

        var currentDate = startDate
        while currentDate <= date {
            dates.append(currentDate)
            currentDate = self.date(byAdding: .day, value: 1, to: currentDate)!
        }

        return dates
    }
}
