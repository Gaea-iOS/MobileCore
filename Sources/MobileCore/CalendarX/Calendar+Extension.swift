// Calendar+Extension.swift
// Copyright (c) 2023 Nostudio
// Created by Jerry X T Wang on 2023/7/6.

import Foundation
import Collections

extension Calendar {
    public func datesInSameMonth(with date: Date) -> OrderedSet<Date> {
        let year = component(.year, from: date)
        let month = component(.month, from: date)
        
        return datesInMonth(month, year: year)
    }
    
    func datesInMonth(_ month: Int, year: Int) -> OrderedSet<Date> {
        var components = DateComponents()
        components.year = year
        components.month = month
        components.day = 1

        guard let startDate = date(from: components),
              let endDate = date(byAdding: DateComponents(month: 1, day: -1), to: startDate)
        else {
            return []
        }

        var dates: OrderedSet<Date> = []
        var date = startDate
        while date <= endDate {
            dates.append(date)
            date = self.date(byAdding: .day, value: 1, to: date)!
        }

        return dates
    }
    
    func datesInWeekOfMonth(_ weekOfMonth: Int, month: Int, year: Int) -> OrderedSet<Date> {
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.weekOfMonth = weekOfMonth
        dateComponents.weekday = firstWeekday
        
        guard let firstDayOfWeek = date(from: dateComponents) else {
            return []
        }
        
        let lastDayOfWeek = date(byAdding: .day, value: 6, to: firstDayOfWeek)!
        
        var dates: OrderedSet<Date> = []
        var currentDate = firstDayOfWeek
        while currentDate <= lastDayOfWeek {
            dates.append(currentDate)
            currentDate = date(byAdding: .day, value: 1, to: currentDate)!
        }
        
        return dates
    }
}

extension Calendar {
    func numberOfWeeksInMonth(_ month: Int, year: Int) -> Int? {
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = 1

        guard let date = date(from: dateComponents) else { return nil }
        let rangeOfWeeks = range(of: .weekOfMonth, in: .month, for: date)
        return rangeOfWeeks?.count
    }
}

extension Calendar {
    func date(Ofyear year: Int, month: Int, day: Int) -> Date? {
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        if let date = date(from: dateComponents) {
            return date
        } else {
            return nil
        }
    }
}

extension Calendar {
    func pastNMonths(_ nMonths: Int, fromDate: Date) -> OrderedSet<CalendarX.Month> {
        let result: [CalendarX.Month] = (0 ..< nMonths).reversed()
            .map { monthOffset in
                let targetDate = date(byAdding: .month, value: -monthOffset, to: fromDate)!
                let year = component(.year, from: targetDate)
                let month = component(.month, from: targetDate)
                
                return .init(year: year, month: month)
            }

        return .init(result) 
    }
}


extension Calendar {
    func weeksInMonth(_ month: Int, year: Int) -> OrderedSet<CalendarX.Week> {
        let numberOfWeeks = numberOfWeeksInMonth(month, year: year)!
        let weeks: [CalendarX.Week] = (1 ... numberOfWeeks).map {
            .init(year: year, month: month, weekOfMonth: $0)
        }
        return .init(weeks)
    }
        
    func daysInMonth(_ month: Int, year: Int) -> OrderedSet<CalendarX.Day> {
        let dates = datesInMonth(month, year: year)
        let days = dates.map { CalendarX.Day(date: $0, in: self) }
        return .init(days)
    }
}

extension Calendar {
    func daysInWeekOfMonth(
        _ weekOfMonth: Int,
        month: Int,
        year: Int
    ) -> OrderedSet<CalendarX.Day> {
        let dates = datesInWeekOfMonth(
            weekOfMonth,
            month: month,
            year: year
        )
        let days = dates.map { date in
            CalendarX.Day(date: date, in: self)
        }
        return .init(days)
    }
}
