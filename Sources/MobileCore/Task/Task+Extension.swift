//
//  File.swift
//  
//
//  Created by 王小涛 on 2023/7/4.
//

import Foundation

public extension Task where Success == Never, Failure == Never {
    static func sleep(seconds: Double) async throws {
        try await sleep(nanoseconds: UInt64(seconds * Double(1_000_000_000)))
    }
}
