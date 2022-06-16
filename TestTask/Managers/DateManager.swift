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
        let difference = currentDate.timeIntervalSince1970 - timestamp
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM"
        
        let minute = Double(60)
        let hour = Double(60*60)
        let day = Double(60*60*24)
        let week = Double(60*60*24*7)
        let month = Double(60*60*24*7*4)
        
        switch difference {
        case  0 ..< minute:
            result = "\(difference) sec ago"
        case minute ..< hour:
            result = "\(Int(difference / minute)) min ago"
        case hour ..< day:
            result = "\(Int(difference / hour)) hours ago"
        case day ..< week:
            result = "\(Int(difference / day)) days ago"
        case week ..< month:
            result = "\(Int(difference / week)) weeks"
        default:
            result = "\(dateFormatter.string(from: postDate))"
        }
        
        return result
    }
}
