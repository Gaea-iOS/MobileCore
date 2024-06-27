//
//  File.swift
//  
//
//  Created by 王小涛 on 2023/11/10.
//

import Foundation
import SwiftUI

// Refer to https://www.swiftbysundell.com/articles/type-safe-identifiers-in-swift/
public protocol TypeSafeIdentifiable {
    associatedtype RawIdentifier = UUID
    var id: ID<Self> { get }
}

public struct ID<T: TypeSafeIdentifiable> {
    private var rawValue: T.RawIdentifier
    
    public init(rawValue: T.RawIdentifier) {
        self.rawValue = rawValue
    }
}

extension ID: Equatable where T.RawIdentifier: Equatable {}
extension ID: Codable where T.RawIdentifier: Codable {}
extension ID: Hashable where T.RawIdentifier: Hashable {}

extension Identifiable where Self: TypeSafeIdentifiable {}
