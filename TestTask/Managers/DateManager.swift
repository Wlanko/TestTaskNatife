//
//  DateManager.swift
//  TestTask
//
//  Created by Vlad Kyrylenko on 14.06.2022.
//

import Foundation

class DateManager {
    func getTimeForPost(timestamp: Double) -> String {
        let difference = Date().timeIntervalSince1970 - timestamp
        
        switch difference {
        case  0 ..< Date.Seconds.minute:
            return "\(difference) sec ago"
        case Date.Seconds.minute ..< Date.Seconds.hour:
            return "\(Int(difference / Date.Seconds.minute)) min ago"
        case Date.Seconds.hour ..< Date.Seconds.day:
            return "\(Int(difference / Date.Seconds.hour)) hours ago"
        case Date.Seconds.day ..< Date.Seconds.week:
            return "\(Int(difference / Date.Seconds.day)) days ago"
        case Date.Seconds.week ..< Date.Seconds.month:
            return "\(Int(difference / Date.Seconds.week)) weeks"
        default:
            let postDate = Date(timeIntervalSince1970: timestamp)
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd.MM"
            return "\(dateFormatter.string(from: postDate))"
        }
    }
}
