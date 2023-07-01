////
////  File.swift
////  
////
////  Created by 王小涛 on 2023/7/1.
////
//
//import Foundation
//
//public protocol DefaultValuable {
//    static var defaultValue: Self { get }
//}
//
//extension Int: DefaultValuable {
//    public static var defaultValue: Self { .zero }
//}
//
//extension Bool: DefaultValuable {
//    public static var defaultValue: Self { false }
//}
//
//extension String: DefaultValuable {
//    public static var defaultValue: Self { "" }
//}
//
//extension Optional: DefaultValuable {
//    public static var defaultValue: Self { .none }
//}
//
//extension Array: DefaultValuable {
//    public static var defaultValue: Array<Element> {
//        []
//    }
//}
