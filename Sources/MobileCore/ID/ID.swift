//
//  File.swift
//  
//
//  Created by 王小涛 on 2023/11/10.
//

import Foundation
import SwiftUI

// Refer to https://www.swiftbysundell.com/articles/type-safe-identifiers-in-swift/
public struct ID<T> {
    private var value = UUID()
    public init() {}
}

extension ID: Equatable where Self: Equatable {}
extension ID: Codable where Self: Codable {}
extension ID: Hashable where Self: Hashable {}
