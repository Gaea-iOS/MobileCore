//
//  File.swift
//  
//
//  Created by 王小涛 on 2024/5/25.
//

import Foundation

public extension String.LocalizationValue {
    var localized: String {
        .init(localized: self)
    }
}
