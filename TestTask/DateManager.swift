//
//  DateManager.swift
//  TestTask
//
//  Created by Vlad Kyrylenko on 14.06.2022.
//

import Foundation

class DateManager {
    var postDate = Date()
    let currentDate = Date()
    let calendar = Calendar.current
    
    func getTimeForPost(timestamp: Double) -> String{
        var result = String()
        getPostDate(timestamp: timestamp)
        
        let postHour = calendar.component(.hour, from: postDate)
        let postMinute = calendar.component(.minute, from: postDate)
        let postDay = calendar.component(.day, from: postDate)
        let postMonth = calendar.component(.month, from: postDate)
        let postYear = calendar.component(.year, from: postDate)
        
        let hour = calendar.component(.hour, from: currentDate)
        let minute = calendar.component(.minute, from: currentDate)
        let day = calendar.component(.day, from: currentDate)
        let month = calendar.component(.month, from: currentDate)
        let year = calendar.component(.year, from: currentDate)
        
        if year == postYear {
            if day == postDay {
                if hour == postHour {
                    if minute == postMinute {
                        result = "1 min ago"
                    } else {
                        result = "\(minute - postMinute) min ago"
                    }
                } else {
                    result = "\(hour - postHour) min ago"
                }
            } else {
                result = "\(day).\(month)"
            }
        }
        
        return result
    }
    
    func getPostDate(timestamp: Double) {
        postDate = Date(timeIntervalSince1970: timestamp)
    }
}
