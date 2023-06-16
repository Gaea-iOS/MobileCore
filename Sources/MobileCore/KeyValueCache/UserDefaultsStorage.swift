//
//  File.swift
//  
//
//  Created by 王小涛 on 2023/6/16.
//

import Foundation

public final class UserDefaultsStorage: CodableKeyValueStorage {
    private let userDefaults: UserDefaults
    
    private let serializer: AnyEncodableSerializer
    private let deserializer: AnyDecodableDeserializer

    public init(
        userDefaults: UserDefaults = .standard,
        serializer: AnyEncodableSerializer = JSONEncoder(),
        deserializer: AnyDecodableDeserializer = JSONDecoder()
    ){
        self.userDefaults = userDefaults
        self.serializer = serializer
        self.deserializer = deserializer
    }
    
    convenience init?(
        suiteName: String,
        serializer: AnyEncodableSerializer = JSONEncoder(),
        deserializer: AnyDecodableDeserializer = JSONDecoder()
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

    public func save<Value>(_ value: Value?, forKey key: CacheKey) throws where Value: Codable {
        if let value {
            let data = try serializer.serialize(value)
            userDefaults.set(data, forKey: key.key)
        } else {
            userDefaults.setNilValueForKey(key.key)
        }
    }
    
    public func value<Value>(forKey key: CacheKey) throws -> Value? where Value: Codable {
        if let data = userDefaults.data(forKey: key.key) {
            return try deserializer.deserialize(data)
        } else {
            return nil
        }
    }
}
