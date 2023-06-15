// FileCache.swift
// Copyright (c) 2023 Nostudio
// Created by Jerry X T Wang on 2023/2/22.

import Foundation

public final class FileCache<T>: Caching {
    private let file: URL
    private let serializer: any Serializer<T>
    private let deserializer: any Deserializer<T>

    public init(
        file: URL,
        serializer: some Serializer<T>,
        deserializer: some Deserializer<T>
    ) {
        self.file = file
        self.serializer = serializer
        self.deserializer = deserializer
    }

    public func save(_ value: T) throws {
        let data = try serializer.serialize(value)
        try data.write(to: file)
    }

    public func load() throws -> T? {
        let data = try Data(contentsOf: file)
        let value = try deserializer.deserialize(data)
        return value
    }
}

public extension FileCache where T: Codable {
    convenience init(
        subFolder: String,
        fileName: String,
        serializer: any Serializer<T> = EncodableSerializer<T>(),
        deserializer: any Deserializer<T> = DecodableDeserializer<T>()
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
