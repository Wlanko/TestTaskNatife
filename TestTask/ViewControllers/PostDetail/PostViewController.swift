//
//  PostViewController.swift
//  TestTask
//
//  Created by Vlad Kyrylenko on 14.06.2022.
//

import UIKit

struct PostModule {
    static func buildModule(postId: Int) -> UIViewController? {
        let story = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = story.instantiateViewController(withIdentifier: "PostViewController") as? PostViewController else { return nil }
        let presenter = PostPresenter(with: postId, view: vc)
        vc.presenter = presenter
        return vc
    }
}

class PostViewController: UIViewController, UITableViewDataSource {
    var presenter: PostPresenter?
    
    @IBOutlet weak var postTableView: UITableView?

    override func viewDidLoad() {
        super.viewDidLoad()
        postTableView?.separatorStyle = .none
        postTableView?.dataSource = self
        presenter?.loadData()
        // Do any additional setup after loading the view.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = postTableView?.dequeueReusableCell(withIdentifier: "TitleAndDescriptionCell") as! DescriptionCell
        cell.setData(title: presenter?.postInfo?.title ?? "None", description: presenter?.postInfo?.text ?? "-")
        
        switch indexPath.row {
            case 0:
                let imageCell = postTableView?.dequeueReusableCell(withIdentifier: "ImageCell") as! ImageCell
                imageCell.setData(url: presenter?.postInfo?.postImage)
            
                return imageCell
            case 2:
                let likesAndDateCell = postTableView?.dequeueReusableCell(withIdentifier: "LikesAndDateCell") as! LikesAndDateCell
                likesAndDateCell.setData(likes: presenter?.postInfo?.likes_count ?? 0, date: presenter?.postInfo?.timeshamp ?? Int(Date().timeIntervalSince1970))
                
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
