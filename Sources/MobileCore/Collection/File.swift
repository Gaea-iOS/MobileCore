//
//  File.swift
//  
//
//  Created by Jerrywang on 2023/5/15.
//

import Foundation

public extension Collection where Element: Collection {
    func flatten() -> [Element.Element] {
        flatMap { $0 }
    }
}
