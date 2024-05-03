//
//  File.swift
//  
//
//  Created by 王小涛 on 2024/5/3.
//

import Foundation

public struct Pin: Equatable {
    public struct Bit: Identifiable, Equatable {
        let index: Int
        public private(set) var character: Character?

        public var id: Int { index }

        init(
            index: Int
        ) {
            self.index = index
            character = nil
        }

        mutating func update(character: Character) {
            self.character = character
        }

        mutating func reset() {
            character = nil
        }
    }

    public private(set) var bits: [Bit] = []

    let length: Int

    public init(length: Int) {
        self.length = length
        bits = initialBits(with: length)
    }

    public var value: String {
        get {
            bits.map(\.character)
                .compactMap{ $0 }
                .map(String.init)
                .reduce("", +)
        }
        set {
            reset()
            let characters = newValue.map { $0 }
            characters.forEach { input($0) }
        }
    }

    public var isDone: Bool {
        bits.filter { $0.character != nil }.count == length
    }

    private func initialBits(with length: Int) -> [Bit] {
        (0 ..< length).map(Bit.init(index:))
    }

    private var currentCount: Int {
        bits.map(\.character).compactMap { $0 }.count
    }

    mutating func input(_ character: Character) {
        guard currentCount < bits.count else { return }
        bits[currentCount].update(character: character)
    }

    public mutating func reset() {
        bits = initialBits(with: length)
    }
}
