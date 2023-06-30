// Caching.swift
// Copyright (c) 2023 Nostudio
// Created by Jerry X T Wang on 2023/2/22.

import Foundation

public protocol Caching<Value> {
    associatedtype Value
    func save(_ value: Value) throws
    func load() throws -> Value?
}
