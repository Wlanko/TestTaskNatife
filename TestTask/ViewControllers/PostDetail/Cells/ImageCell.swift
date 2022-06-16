//
//  ImageTableViewCell.swift
//  TestTask
//
//  Created by Vlad Kyrylenko on 14.06.2022.
//

import UIKit
import Kingfisher

class ImageCell: UITableViewCell {
    @IBOutlet weak var postImage: UIImageView!
    
    func setData(url: URL?) {
        postImage.kf.setImage(with: url, placeholder: UIImage(named: "placeholder"))
    }

}
