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
    
    convenience public init?(
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

    public func save<Value, Key>(_ value: Value?, forKey key: Key) throws where Value: Codable, Key: Hashable {
        let cachedKey = String(key.hashValue)
        if let value {
            let data = try serializer.serialize(value)
            userDefaults.set(data, forKey: cachedKey)
        } else {
            userDefaults.set(nil, forKey: cachedKey)
        }
    }
    
    public func value<Value, Key>(forKey key: Key) throws -> Value? where Value: Codable, Key: Hashable {
        let cachedKey = String(key.hashValue)
        if let data = userDefaults.data(forKey: cachedKey) {
            return try deserializer.deserialize(data)
        } else {
            return nil
        }
    }
}
