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
        cell.setData(postinfo: presenter.posts[indexPath.row])
        return cell
    }

}

extension PostsViewController: PostsViewPresenter {
    func dataIsUpdated() {
        print(presenter.posts[0])
        mainTableView!.reloadData()
    }
}
