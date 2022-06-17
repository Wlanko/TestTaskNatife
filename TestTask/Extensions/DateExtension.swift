//
//  DateExtension.swift
//  TestTask
//
//  Created by Vlad Kyrylenko on 17.06.2022.
//

import Foundation

extension Date {
    struct Seconds {
        static let minute = Double(60)
        static let hour = Double(60*60)
        static let day = Double(60*60*24)
        static let week = Double(60*60*24*7)
        static let month = Double(60*60*24*7*4)
    }
}
