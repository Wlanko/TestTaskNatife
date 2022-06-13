//
//  MainTableViewCell.swift
//  TestTask
//
//  Created by Vlad Kyrylenko on 13.06.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var descriptionLabel: UILabel?
    @IBOutlet weak var likesLabel: UILabel?
    @IBOutlet weak var dateLabel: UILabel?
    @IBOutlet weak var expandButton: UIButton?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(postinfo: Post?) {
        titleLabel?.text = postinfo?.title
        descriptionLabel?.text = postinfo?.preview_text
        likesLabel?.text = String(postinfo?.likes_count ?? 0)
        
    }

}
