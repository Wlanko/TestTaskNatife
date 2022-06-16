//
//  DateManager.swift
//  TestTask
//
//  Created by Vlad Kyrylenko on 14.06.2022.
//

import Foundation

class DateManager {
    func getTimeForPost(timestamp: Double) -> String{
        let postDate = Date(timeIntervalSince1970: timestamp) 
        let currentDate = Date()
        var result = String()
        let dateFormatter = DateFormatter()
        let difference = currentDate.timeIntervalSince1970 - timestamp
        
        dateFormatter.dateFormat = "dd.MM"
        
        switch difference {
        case  0 ..< 60:
            result = "\(difference) sec ago"
        case 60 ..< 3600:
            result = "\(Int(difference / 60)) min ago"
        case 3600 ..< 86400:
            result = "\(Int(difference / 3600)) hours ago"
        case 86400 ..< 604800:
            result = "\(Int(difference / 86400)) days ago"
        case 604800 ..< 2419200:
            result = "\(Int(difference / 604800)) weeks"
        default:
            result = "\(dateFormatter.string(from: postDate))"
        }
        
        return result
    }
}
