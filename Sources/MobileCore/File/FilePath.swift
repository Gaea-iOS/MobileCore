// FilePath.swift
// Copyright (c) 2023 Nostudio
// Created by Jerry X T Wang on 2023/2/22.

import Foundation

public struct FilePath {
    let directory: Directory
    let fileName: String
    
    public init(directory: Directory, fileName: String) {
        self.directory = directory
        self.fileName = fileName
    }

    public var url: URL {
        directory.appendingPathComponent(fileName)
    }
}
