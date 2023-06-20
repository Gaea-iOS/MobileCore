//
//  File.swift
//  
//
//  Created by 王小涛 on 2023/6/16.
//

import Foundation

public protocol KeyValueStorage {
    associatedtype Key: Hashable
    associatedtype Value
    
    func save(_ value: Value?, forKey: Key) throws
    func value(forKey: Key) throws -> Value?
    
    func all() -> [Key: Value]?
}

public protocol CodableKeyValueStorage<Key, Value>: KeyValueStorage where Value: Codable {}
