//
//  PostViewController.swift
//  TestTask
//
//  Created by Vlad Kyrylenko on 14.06.2022.
//

import UIKit

class PostViewController: UIViewController, UITableViewDataSource {
    var postID: Int = 0
    lazy var presenter = PostPresenter(with: self)
    
    @IBOutlet weak var postTableView: UITableView?

    override func viewDidLoad() {
        super.viewDidLoad()
        postTableView?.separatorStyle = .none
        postTableView?.dataSource = self
        presenter.loadData(endpoint: "/posts/\(postID).json")
        // Do any additional setup after loading the view.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = postTableView?.dequeueReusableCell(withIdentifier: "TitleAndDescriptionCell") as! DescriptionTableViewCell
        cell.setData(title: presenter.postInfo?.title ?? "None", description: presenter.postInfo?.text ?? "-")
        
        switch indexPath.row {
            case 0:
                let imageCell = postTableView?.dequeueReusableCell(withIdentifier: "ImageCell") as! ImageTableViewCell
                imageCell.setData(url: presenter.postInfo?.postImage ?? URL(string: "https://cid.center/wp-content/uploads/2020/11/placeholder.png")!)
            
                return imageCell
            case 2:
                let likesAndDateCell = postTableView?.dequeueReusableCell(withIdentifier: "LikesAndDateCell") as! LikesAndDateTableViewCell
                likesAndDateCell.setData(likes: presenter.postInfo?.likes_count ?? 0, date: presenter.postInfo?.timeshamp ?? 1645030659)
                
                return likesAndDateCell
            default:
                return cell
        }
    }

}

extension PostViewController: PostsViewPresenter {
    func dataIsUpdated() {
        postTableView?.reloadData()
    }
}
