//
//  DescriptionTableViewCell.swift
//  TestTask
//
//  Created by Vlad Kyrylenko on 14.06.2022.
//

import UIKit

class DescriptionTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(title: String, description: String) {
        titleLabel.text = title
        descriptionLabel.text = description
    }
}
