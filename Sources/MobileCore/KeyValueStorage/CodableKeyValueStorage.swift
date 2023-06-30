//
//  File 2.swift
//  
//
//  Created by 王小涛 on 2023/6/30.
//

import Foundation

public protocol CodableKeyValueStorage {
    func save<Value>(_ value: Value?, forKey: CachedKey<Value>) throws where Value: Codable
    func value<Value>(forKey: CachedKey<Value>) throws -> Value? where Value: Codable
}
