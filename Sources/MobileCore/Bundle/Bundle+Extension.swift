//
//  File.swift
//  
//
//  Created by 王小涛 on 2023/8/27.
//

import Foundation

public extension Localized where Base == Bundle {
    var bundleDisplayName: String? {
        base.localizedInfoDictionary?["CFBundleDisplayName"] as? String
    }
}

public extension Bundle {
    var bundleShortVersion: String? {
        infoDictionary?["CFBundleShortVersionString"] as? String
    }

    var bundleVersion: String? {
        infoDictionary?["CFBundleVersion"] as? String
    }
}

extension Bundle: LocalizedCompatible {}
