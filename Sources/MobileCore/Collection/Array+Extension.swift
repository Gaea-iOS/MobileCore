//
//  File.swift
//  
//
//  Created by Jerrywang on 2023/5/21.
//

import Foundation

public extension Array {
    func element(at index: Int) -> Element? {
        guard index >= 0, index < count else { return nil }
        return self[index]
    }
    
    func group(in number: Int) -> [[Element]] {
        let numberOfGroup = count / number
        
        var result = (0..<numberOfGroup).map {
            let indexRange = ($0 * number)..<(($0 + 1) * number)
            return Array(self[indexRange])
        }
        
        if count % number != 0 {
            let restIndexRange = (number * numberOfGroup)..<count
            let rest = Array(self[restIndexRange])
            result.append(rest)
        }
        
        return result
    }
}
