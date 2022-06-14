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
    
    let dateManager = DateManager()
    var postID: Int = 0
    weak var view: PostPushView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        //super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setData(postinfo: Post?, view: PostPushView) {
        titleLabel?.text = postinfo?.title
        descriptionLabel?.text = postinfo?.preview_text
        likesLabel?.text = "❤️ \(String(postinfo?.likes_count ?? 0))"
        dateLabel?.text = dateManager.getTimeForPost(timestamp: Double(postinfo!.timeshamp))
        postID = postinfo?.postId ?? 0
        
        self.view = view
    }
    @IBAction func expandButton(_ sender: Any) {
        view?.push(postID: postID)
    }
    
}
