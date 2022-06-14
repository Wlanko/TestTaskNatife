//
//  LikesAndDateTableViewCell.swift
//  TestTask
//
//  Created by Vlad Kyrylenko on 14.06.2022.
//

import UIKit
import Kingfisher

class LikesAndDateTableViewCell: UITableViewCell {
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(likes: Int, date: Int){
        likesLabel.text = "❤️ \(likes)"
        dateLabel.text = DateManager().getTimeForPost(timestamp: Double(date))
    }
}
