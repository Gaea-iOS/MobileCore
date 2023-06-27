//
//  File.swift
//  
//
//  Created by 王小涛 on 2023/6/27.
//

import SwiftUI

extension LocalizedStringKey: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(String(describing: self))
    }

    public static func ==(lhs: LocalizedStringKey, rhs: LocalizedStringKey) -> Bool {
        return String(describing: lhs) == String(describing: rhs)
    }
}
