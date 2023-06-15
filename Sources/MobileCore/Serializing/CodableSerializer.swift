// CodableSerializer.swift
// Copyright (c) 2023 Nostudio
// Created by Jerry X T Wang on 2023/2/22.

import Foundation

typealias Encode<T: Encodable> = (T) throws -> Data
typealias Decode<T: Decodable> = (Data) throws -> T

public final class EncodableSerializer<Input>: Serializer where Input: Encodable {
    private let encode: Encode<Input>

    init(encode: @escaping Encode<Input> = JSONEncoder().encode) {
        self.encode = encode
    }

    public func serialize(_ input: Input) throws -> Data {
        try encode(input)
    }
}

extension JSONDecoder {
    func decode<T>(from data: Data) throws -> T where T: Decodable {
        try decode(T.self, from: data)
    }
}

public final class DecodableDeserializer<Output>: Deserializer where Output: Decodable {
    private let decode: Decode<Output>

    init(decode: @escaping Decode<Output> = JSONDecoder().decode(from:)) {
        self.decode = decode
    }

    public func deserialize(_ data: Data) throws -> Output {
        try decode(data)
    }
}

public func encodableSerializer<T: Encodable>(encoder: JSONEncoder = .init()) -> EncodableSerializer<T> {
    EncodableSerializer<T>(encode: encoder.encode(_:))
}

public func decodableDeserializer<T: Decodable>(decoder: JSONDecoder = .init()) -> DecodableDeserializer<T> {
    DecodableDeserializer<T>(decode: decoder.decode(from:))
}
