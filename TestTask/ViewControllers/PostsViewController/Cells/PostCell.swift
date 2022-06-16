//
//  MainTableViewCell.swift
//  TestTask
//
//  Created by Vlad Kyrylenko on 13.06.2022.
//

import UIKit

class PostCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var descriptionLabel: UILabel?
    @IBOutlet weak var likesLabel: UILabel?
    @IBOutlet weak var dateLabel: UILabel?
    
    let dateManager = DateManager()
    var postID: Int = 0
    weak var delegate: PostCellDelegate?
    
    func setData(postinfo: Post?, delegate: PostCellDelegate) {
        titleLabel?.text = postinfo?.title
        descriptionLabel?.text = postinfo?.preview_text
        likesLabel?.text = "❤️ \(String(postinfo?.likes_count ?? 0))"
        dateLabel?.text = dateManager.getTimeForPost(timestamp: Double(postinfo!.timeshamp))
        postID = postinfo?.postId ?? 0
        
        self.delegate = delegate
    }
    @IBAction func expandButton(_ sender: Any) {
        delegate?.push(postID: postID)
    }
    
}
