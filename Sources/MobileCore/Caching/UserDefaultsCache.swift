// UserDefaultsCache.swift
// Copyright (c) 2023 Nostudio
// Created by Jerry X T Wang on 2023/2/22.

import Foundation

public final class UserDefaultsCache<T>: Caching {
    private let userDefaults: UserDefaults
    private let cacheKey: String
    
    private let serializer: any Serializer<T>
    private let deserializer: any Deserializer<T>

    public init(
        userDefaults: UserDefaults = .standard,
        cacheKey: String,
        serializer: some Serializer<T>,
        deserializer: some Deserializer<T>
    ){
        self.userDefaults = userDefaults
        self.cacheKey = cacheKey
        self.serializer = serializer
        self.deserializer = deserializer
    }

    public func save(_ value: T) throws {
        let data = try serializer.serialize(value)
        userDefaults.set(data, forKey: cacheKey)
    }

    public func load() throws -> T? {
        if let data = userDefaults.data(forKey: cacheKey) {
            let value = try deserializer.deserialize(data)
            return value
        } else {
            return nil
        }
    }
}
