//
//  Untitled.swift
//  MobileCore
//
//  Created by 王小涛 on 2026/1/1.
//

import Foundation

extension Sequence {
    func asyncMap<T>(_ transform: (Element) async throws -> T) async rethrows -> [T] {
        var values = [T]()
        for element in self {
            try await values.append(transform(element))
        }
        return values
    }
    
    func asyncFirst(_ where: (Element) async throws -> Bool) async rethrows -> Element? {
        for element in self {
            if try await `where`(element) {
                return element
            }
        }
        return nil
    }
}
