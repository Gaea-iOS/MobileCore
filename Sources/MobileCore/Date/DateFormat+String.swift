//
//  File.swift
//  
//
//  Created by Jerrywang on 2023/5/10.
//

import Foundation

extension String: DateFormatCompatible {}

/**
 Year
 y    2019    Year with no padding
 yy    19    Year with two digits, will pad with zero if needed
 yyyy    2019    Year, with four digits, will pad with zero if needed
 */
public extension DateFormat where Base == String {
    static let yearWihoutPadding = "y"
    static let yearWithTwoDigits = "yy"
    static let yearWithFourDigits = "yyyy"
}

/**
 Month
 M    1    Numeric month with no padding
 MM    01    Two digit numeric month with padding
 MMMM    January    Full name of the month
 */
public extension DateFormat where Base == String {
    static let monthWithoutPadding = "M"
    static let monthWithPadding = "MM"
    static let monthNameInShortHand = "MMM"
    static let monthFullName = "MMMM"
}


/**
 Day
 d    1    Day of the month
 dd    01    Two digit day of the month with padding
 */
public extension DateFormat where Base == String {
    static let dayWithoutPadding = "d"
    static let dayWithPadding = "dd"
}

/**
 Day
 E    Fri    Day of the week short-hand
 EEEE    Friday    Full name of the day
 */
public extension DateFormat where Base == String {
    static let weekdayNameInShortHand = "E"
    static let weekdayFullName = "EEEE"
}

/**
 Hour
 h    2    Twelve hour format
 hh    02    Twelve hour format with padding
 H    14    24 hour format
 HH    04    24 hour format with padding
 a    AM    AM / PM
 */
public extension DateFormat where Base == String {
    static let hourWithoutPaddingIn12HourFormat = "h"
    static let hourWithPaddingIn12HourFormat = "hh"
    static let hourWithoutPaddingIn24HourFormat = "H"
    static let hourWithPaddingIn24HourFormat = "HH"
    static let hourInAMOrPM = "a"
}

/**
 Minute
 m    30    Minute with no padding
 mm    35    Minutes with padding
 */
public extension DateFormat where Base == String {
    static let minuteWithoutPadding = "m"
    static let minuteWithPadding = "mm"
}

/**
 Seconds
 s    5    Seconds with no padding
 ss    05    Seconds with padding
 SSS    4321    Milliseconds
 */
public extension DateFormat where Base == String {
    static let secondWithoutPadding = "s"
    static let secondWithPadding = "ss"
    static let millisecond = "SSS"
}


/**
 Time Zones
 zzz    PST    3 letter timezone
 zzzz    Pacific Standard Time    The whole timezone name
 Z    -0800    RFC 822 GMT Format
 ZZZZZ    -08:00    ISO 8601 Format
 */
public extension DateFormat where Base == String {
    static let timezoneWith3Letters = "zzz"
    static let timezoneFullName = "zzz"
    static let timezoneInRFC822GMTFormat = "Z"
    static let timezoneInISO8601Format = "ZZZZZ"
}

