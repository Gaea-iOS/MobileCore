//
//  File.swift
//  
//
//  Created by 王小涛 on 2023/6/29.
//

import Foundation

public struct System<Base> {
    public let base: Base

    init(_ base: Base) {
        self.base = base
    }
}

public protocol SystemCompatible {
    associatedtype SystemCompatibleType
    static var system: SystemCompatibleType.Type { get }
    var system: SystemCompatibleType { get }
}

public extension SystemCompatible {
    static var system: System<Self>.Type {
        System<Self>.self
    }

    var system: System<Self> {
        System(self)
    }
}

