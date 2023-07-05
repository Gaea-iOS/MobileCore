//
//  File.swift
//  
//
//  Created by 王小涛 on 2023/7/5.
//

import Foundation

public extension StringProtocol {
    func contains(_ other: some StringProtocol, caseInsensitive: Bool = false) -> Bool {
        let options: String.CompareOptions = caseInsensitive ? [] : .caseInsensitive
        return range(of: other, options: options) != nil
    }
}
