//
//  File.swift
//  
//
//  Created by 王小涛 on 2023/6/16.
//

import Foundation

public final class UserDefaultsStorage<K, V>: CodableKeyValueStorage where K: Hashable, V: Codable {
    
    public typealias Key = K
    public typealias Value = V
    
    private let userDefaults: UserDefaults
    
    private let serializer: any Serializer<Value>
    private let deserializer: any Deserializer<Value>

    init(
        userDefaults: UserDefaults = .standard,
        serializer: any Serializer<Value> = EncodableSerializer<Value>(),
        deserializer: any Deserializer<Value> = DecodableDeserializer<Value>()
    ){
        self.userDefaults = userDefaults
        self.serializer = serializer
        self.deserializer = deserializer
    }
    
    convenience public init?(
        suiteName: String,
        serializer: any Serializer<Value> = EncodableSerializer<Value>(),
        deserializer: any Deserializer<Value> = DecodableDeserializer<Value>()
    ) {
        guard let userDefaults = UserDefaults(suiteName: suiteName) else {
            return nil
        }
        self.init(
            userDefaults: userDefaults,
            serializer: serializer,
            deserializer: deserializer
        )
    }

    public func save(_ value: Value?, forKey key: Key) throws {
        let cachedKey = String(key.hashValue)
        if let value {
            let data = try serializer.serialize(value)
            userDefaults.set(data, forKey: cachedKey)
        } else {
            userDefaults.set(nil, forKey: cachedKey)
        }
    }
    
    public func value(forKey key: Key) throws -> Value? {
        let cachedKey = String(key.hashValue)
        if let data = userDefaults.data(forKey: cachedKey) {
            return try deserializer.deserialize(data)
        } else {
            return nil
        }
    }
}
