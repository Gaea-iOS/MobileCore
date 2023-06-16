//
//  File.swift
//  
//
//  Created by 王小涛 on 2023/6/16.
//

import Foundation

public protocol KeyValueStorage {
    func save<Value, Key>(_ value: Value?, forKey: Key) throws where Key: Hashable
    func value<Value, Key>(forKey: Key) throws -> Value? where Key: Hashable
}

public extension KeyValueStorage {
    func value<Value, Key>(forKey key: Key, default: Value) throws -> Value where Key: Hashable {
        try value(forKey: key) ?? `default`
    }
}

public protocol CodableKeyValueStorage {
    func save<Value, Key>(_ value: Value?, forKey: Key) throws where Value: Codable, Key: Hashable
    func value<Value, Key>(forKey: Key) throws -> Value?  where Value: Codable, Key: Hashable
}
