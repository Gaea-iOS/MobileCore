// Directory.swift
// Copyright (c) 2023 Nostudio
// Created by Jerry X T Wang on 2023/2/22.

import Foundation

public protocol Directory {
    var isExist: Bool { get }

    func create() throws
    func appendingPathComponent(_ path: String) -> URL
}

public final class DocumentDirectory: Directory {
    private let fileManager: FileManager
    private let subFolder: String?

    public init(
        fileManager: FileManager = .default,
        subFolder: String? = nil
    ) {
        self.fileManager = fileManager
        self.subFolder = subFolder
    }

    private var url: URL {
        let documentURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]

        if let subFolder {
            return documentURL.appendingPathComponent(subFolder)
        } else {
            return documentURL
        }
    }

    public func appendingPathComponent(_ path: String) -> URL {
        url.appendingPathComponent(path)
    }

    public var isExist: Bool {
        fileManager.fileExists(atPath: url.path)
    }

    public func create() throws {
        try fileManager.createDirectory(atPath: url.path, withIntermediateDirectories: true)
    }
}
