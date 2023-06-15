// UserDefaultsCache.swift
// Copyright (c) 2023 Nostudio
// Created by Jerry X T Wang on 2023/2/22.

import Foundation

public final class UserDefaultsCache<T>: Caching {
    private let userDefaults: UserDefaults
    private let cacheKey: String
    private let serializer: any PairedSerializer<T>

    public init(userDefaults: UserDefaults = .standard,
         cacheKey: String,
         serializer: some PairedSerializer<T>)
    {
        self.userDefaults = userDefaults
        self.cacheKey = cacheKey
        self.serializer = serializer
    }

    public func save(_ value: T) throws {
        let data = try serializer.serialize(value)
        userDefaults.set(data, forKey: cacheKey)
    }

    public func load() throws -> T? {
        if let data = userDefaults.data(forKey: cacheKey) {
            let value = try serializer.deserialize(data)
            return value
        } else {
            return nil
        }
    }
}
