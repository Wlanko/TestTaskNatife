//
//  LikesAndDateTableViewCell.swift
//  TestTask
//
//  Created by Vlad Kyrylenko on 14.06.2022.
//

import UIKit

class LikesAndDateCell: UITableViewCell {
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    func setData(likes: Int, date: Int){
        likesLabel.text = "❤️ \(likes)"
        dateLabel.text = DateManager().getTimeForPost(timestamp: Double(date))
    }
}
