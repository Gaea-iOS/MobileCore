// UserDefaultsCache.swift
// Copyright (c) 2023 Nostudio
// Created by Jerry X T Wang on 2023/2/22.

import Foundation

public final class UserDefaultsCache<Value>: Caching {
    private let userDefaults: UserDefaults
    private let cacheKey: CachedKey<Value>
    
    private let serializer: any Serializer<Value>
    private let deserializer: any Deserializer<Value>

    init(
        userDefaults: UserDefaults = .standard,
        cacheKey: CachedKey<Value>,
        serializer: any Serializer<Value>,
        deserializer: any Deserializer<Value>
    ){
        self.userDefaults = userDefaults
        self.cacheKey = cacheKey
        self.serializer = serializer
        self.deserializer = deserializer
    }

    public func save(_ value: Value) throws {
        let data = try serializer.serialize(value)
        userDefaults.set(data, forKey: cacheKey.key)
    }

    public func load() throws -> Value? {
        if let data = userDefaults.data(forKey: cacheKey.key) {
            let value = try deserializer.deserialize(data)
            return value
        } else {
            return nil
        }
    }
}

public extension UserDefaultsCache where Value: Codable {
    convenience init?(
        suiteName: String,
        cacheKey: CachedKey<Value>,
        serializer: any Serializer<Value> = EncodableSerializer<Value>(),
        deserializer: any Deserializer<Value> = DecodableDeserializer<Value>()
    ) {
        guard let userDefaults = UserDefaults(suiteName: suiteName) else {
            return nil
        }
        
        self.init(
            userDefaults: userDefaults,
            cacheKey: cacheKey,
            serializer: serializer,
            deserializer: deserializer
        )
    }
}
