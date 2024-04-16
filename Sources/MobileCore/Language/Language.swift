//
//  File.swift
//  
//
//  Created by 王小涛 on 2024/4/16.
//

import Foundation

public enum Language: String {
    case zh_Hans
    case zh_Hant
    case en
    
    // 无论是通过App本身的设置语言，还是通过系统设置里面的地区和语言修改语言，这里都可以得到正确的语言设置。
    public static func current() -> Self {
        guard let preferredLanguage = Locale.preferredLanguages.first else {
            return .en
        }
        let locale = Locale(identifier: preferredLanguage)

        guard let languageCode = locale.language.languageCode else {
            return .en
        }
        let scriptCode = locale.language.script?.identifier

        if languageCode == .english {
            return .en
        } else if languageCode == .chinese {
            if scriptCode == "Hant" {
                return .zh_Hant
            } else {
                return .zh_Hans
            }
        }

        return .en
    }
}
