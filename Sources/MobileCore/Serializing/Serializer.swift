// Serializer.swift
// Copyright (c) 2023 Nostudio
// Created by Jerry X T Wang on 2023/2/22.

import Foundation

public protocol Serializer<Input> {
    associatedtype Input
    func serialize(_ input: Input) throws -> Data
}

public protocol Deserializer<Output> {
    associatedtype Output
    func deserialize(_ data: Data) throws -> Output
}

//public protocol PairedSerializer<Value>: Serializer, Deserializer where Input == Value, Output == Value {
//    associatedtype Value
//}
//
//public final class AnyPairedSerializer<Value>: PairedSerializer {
//    private let serializer: any Serializer<Value>
//    private let deserializer: any Deserializer<Value>
//
//    public init(
//        serializer: some Serializer<Value>,
//        deserializer: some Deserializer<Value>
//    ) {
//        self.serializer = serializer
//        self.deserializer = deserializer
//    }
//
//    public func serialize(_ input: Value) throws -> Data {
//        try serializer.serialize(input)
//    }
//
//    public func deserialize(_ data: Data) throws -> Value {
//        try deserializer.deserialize(data)
//    }
//}
