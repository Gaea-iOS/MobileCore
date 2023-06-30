// FileCache.swift
// Copyright (c) 2023 Nostudio
// Created by Jerry X T Wang on 2023/2/22.

import Foundation

public final class FileCache<Value>: Caching {
    private let file: URL
    private let serializer: any Serializer<Value>
    private let deserializer: any Deserializer<Value>

    public init(
        file: URL,
        serializer: some Serializer<Value>,
        deserializer: some Deserializer<Value>
    ) {
        self.file = file
        self.serializer = serializer
        self.deserializer = deserializer
    }

    public func save(_ value: Value) throws {
        let data = try serializer.serialize(value)
        try data.write(to: file)
    }

    public func load() throws -> Value? {
        let data = try Data(contentsOf: file)
        let value = try deserializer.deserialize(data)
        return value
    }
}

public extension FileCache where Value: Codable {
    convenience init(
        subFolder: String,
        fileName: String,
        serializer: any Serializer<Value> = EncodableSerializer<Value>(),
        deserializer: any Deserializer<Value> = DecodableDeserializer<Value>()
    ) {
        let document = DocumentDirectory(subFolder: subFolder)
        let file = FilePath(directory: document, fileName: fileName).url
        
        self.init(
            file: file,
            serializer: serializer,
            deserializer: deserializer
        )
    }
}
