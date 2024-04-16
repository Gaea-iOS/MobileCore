//
//  File.swift
//  
//
//  Created by 王小涛 on 2023/11/10.
//

import Foundation
import SwiftUI

public struct ID<T> {
    private var value = UUID()
}

extension ID: Equatable where Self: Equatable {}
extension ID: Codable where Self: Codable {}

extension Binding {
    func isPresent<Wrapped>() -> Binding<Bool> 
    where Value == Wrapped? {
        .init(
            get: { wrappedValue != nil },
            set: { isPresent, transaction in
                if !isPresent {
                    self.transaction(transaction).wrappedValue = nil
                }
            }
        )
    }
}

extension Binding {
    func removeDuplicates(by isDuplicate: @escaping (Value, Value) -> Bool) -> Self {
        .init(
            get: { wrappedValue },
            set: { newValue, transaction in
                guard isDuplicate(wrappedValue, newValue) else { return }
                self.transaction(transaction).wrappedValue = newValue
            }
        )
    }
}

extension Binding where Value: Equatable {
    func removeDuplicates() -> Self {
        removeDuplicates(by: ==)
    }
}
