//
//  File.swift
//  
//
//  Created by Jerrywang on 2023/5/10.
//

import Foundation

public struct DateFormat<Base> {
    let base: Base

    init(_ base: Base) {
        self.base = base
    }
}

public protocol DateFormatCompatible {
    associatedtype DateFormatCompatibleType
    static var dateFormat: DateFormatCompatibleType.Type { get }
    var dateFormat: DateFormatCompatibleType { get }
}

public extension DateFormatCompatible {
    static var dateFormat: DateFormat<Self>.Type {
        DateFormat<Self>.self
    }

    var dateFormat: DateFormat<Self> {
        DateFormat(self)
    }
}


