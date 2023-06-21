//
//  File.swift
//  
//
//  Created by 王小涛 on 2023/6/16.
//

import Foundation

public struct CachedKey<Value> {
    let key: String
    
    public init(key: String) {
        self.key = key
    }
}

public protocol KeyValueStorage<Value> {
    associatedtype Value
    func save(_ value: Value?, forKey: CachedKey<Value>) throws
    func value(forKey: CachedKey<Value>) throws -> Value?
}

public protocol CodableKeyValueStorage<Value>: KeyValueStorage where Value: Codable {}
