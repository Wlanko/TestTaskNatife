//
//  ViewController.swift
//  TestTask
//
//  Created by Vlad Kyrylenko on 13.06.2022.
//

import UIKit

protocol PostsViewPresenter: AnyObject {
    func dataIsUpdated()
}

protocol PostPushView: AnyObject {
    func push(postID: Int)
}

class PostsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var mainTableView: UITableView?
    lazy var presenter = PostsPresenter(with: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.loadData(endpoint: "/main.json")
        mainTableView?.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as! PostTableViewCell
        cell.setData(postinfo: presenter.posts[indexPath.row], view: self)
        return cell
    }

}

extension PostsViewController: PostsViewPresenter {
    func dataIsUpdated() {
        print(presenter.posts[0])
        mainTableView!.reloadData()
    }
}

extension PostsViewController: PostPushView {
    func push(postID: Int) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "PostViewController") as! PostViewController
        vc.postID = postID
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
