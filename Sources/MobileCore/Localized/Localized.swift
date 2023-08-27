//
//  File.swift
//  
//
//  Created by 王小涛 on 2023/8/27.
//

public struct Localized<Base> {
    let base: Base

    init(_ base: Base) {
        self.base = base
    }
}

public protocol LocalizedCompatible {
    associatedtype LocalizedCompatibleType
    static var localized: LocalizedCompatibleType.Type { get }
    var localized: LocalizedCompatibleType { get }
}

public extension LocalizedCompatible {
    static var localized: Localized<Self>.Type {
        Localized<Self>.self
    }

    var localized: Localized<Self> {
        Localized(self)
    }
}
