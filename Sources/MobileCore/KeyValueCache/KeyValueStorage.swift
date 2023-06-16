//
//  File.swift
//  
//
//  Created by 王小涛 on 2023/6/16.
//

import Foundation

public struct CacheKey {
    let key: String
    public init(key: String) {
        self.key = key
    }
}

public protocol KeyValueStorage {
    func save<Value>(_ value: Value?, forKey: CacheKey) throws
    func value<Value>(forKey: CacheKey) throws -> Value?
}

public extension KeyValueStorage {
    func value<Value>(forKey key: CacheKey, default: Value) throws -> Value {
        try value(forKey: key) ?? `default`
    }
}

public protocol CodableKeyValueStorage {
    func save<Value>(_ value: Value?, forKey: CacheKey) throws where Value: Codable
    func value<Value>(forKey: CacheKey) throws -> Value?  where Value: Codable
}
