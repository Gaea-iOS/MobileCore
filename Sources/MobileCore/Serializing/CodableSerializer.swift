// CodableSerializer.swift
// Copyright (c) 2023 Nostudio
// Created by Jerry X T Wang on 2023/2/22.

import Foundation

typealias Encode<T: Encodable> = (T) throws -> Data
typealias Decode<T: Decodable> = (Data) throws -> T

public final class EncodableSerializer<Input>: Serializer where Input: Encodable {
    private let encode: Encode<Input>

    init(encode: @escaping Encode<Input>) {
        self.encode = encode
    }

    public func serialize(_ input: Input) throws -> Data {
        try encode(input)
    }
    
    public convenience init(encoder: JSONEncoder = .init()) {
        self.init(encode: encoder.encode(_:))
    }
}

extension JSONDecoder {
    func decode<T>(from data: Data) throws -> T where T: Decodable {
        try decode(T.self, from: data)
    }
}

public final class DecodableDeserializer<Output>: Deserializer where Output: Decodable {
    private let decode: Decode<Output>

    init(decode: @escaping Decode<Output>) {
        self.decode = decode
    }
    
    public convenience init(decoder: JSONDecoder = .init()) {
        self.init(decode: decoder.decode(from:))
    }

    public func deserialize(_ data: Data) throws -> Output {
        try decode(data)
    }
}
