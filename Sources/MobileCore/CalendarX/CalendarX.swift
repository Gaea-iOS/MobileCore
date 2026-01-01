// CalendarX+Day.swift
// Copyright (c) 2023 Nostudio
// Created by Jerry X T Wang on 2023/7/6.、

import Foundation

public struct CalendarX: Sendable{
    public static let shared: CalendarX = .init()
    private init() {}
    
    public var gregorian: Calendar = .init(identifier: .gregorian)
}
