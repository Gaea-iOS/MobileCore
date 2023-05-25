//
//  File.swift
//  
//
//  Created by Jerrywang on 2023/5/25.
//

import Foundation

public extension Date {
    func display(dateFormat: DateFormatter) -> String {
        return dateFormat.string(from: self)
    }

    func display(format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
