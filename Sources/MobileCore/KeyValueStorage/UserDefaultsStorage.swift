//
//  File.swift
//  
//
//  Created by 王小涛 on 2023/6/16.
//

import Foundation

public final class UserDefaultsStorage<V>: CodableKeyValueStorage where V: Codable {
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

    public func save(_ value: Value?, forKey cachedKey: CachedKey<Value>) throws {
        if let value {
            let data = try serializer.serialize(value)
            userDefaults.set(data, forKey: cachedKey.key)
        } else {
            userDefaults.set(nil, forKey: cachedKey.key)
        }
    }
    
    public func value(forKey cachedKey: CachedKey<Value>) throws -> Value? {
        if let data = userDefaults.data(forKey: cachedKey.key) {
            return try deserializer.deserialize(data)
        } else {
            return nil
        }
    }
}
