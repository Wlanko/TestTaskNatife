//
//  DescriptionTableViewCell.swift
//  TestTask
//
//  Created by Vlad Kyrylenko on 14.06.2022.
//

import UIKit

class DescriptionCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func setData(title: String, description: String) {
        titleLabel.text = title
        descriptionLabel.text = description
    }
}
