//
//  ViewController.swift
//  TestTask
//
//  Created by Vlad Kyrylenko on 13.06.2022.
//

import UIKit

protocol PostsViewPresenter: AnyObject {
    func dataIsUpdated()
    func onError(error: Error)
}

protocol PostCellDelegate: AnyObject {
    func push(postID: Int)
}

class PostsViewController: UIViewController {
    @IBOutlet weak var mainTableView: UITableView?
    lazy var presenter = PostsPresenter(with: self)
    var sortBy: SortBy = .date
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.loadData()
    }
    
    @IBAction func sortButton(_ sender: Any) {
        let sortByActionSheet = UIAlertController(title: "Sort by", message: nil, preferredStyle: .actionSheet)
        sortByActionSheet.addAction(UIAlertAction(title: "Date", style: .default) { [weak self] action in
            guard let self = self else { return }
            self.sortBy = .date
            self.presenter.sortPosts(sortBy: self.sortBy)
        })
        sortByActionSheet.addAction(UIAlertAction(title: "Likes", style: .default) { [weak self] action in
            guard let self = self else { return }
            self.sortBy = .likes
            self.presenter.sortPosts(sortBy: self.sortBy)
        })
        sortByActionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        present(sortByActionSheet, animated: true)
    }

}

extension PostsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as! PostCell
        cell.delegate = self
        cell.setData(postinfo: presenter.posts[indexPath.row])
        return cell
    }
}

extension PostsViewController: PostsViewPresenter {
    func onError(error: Error) {
        let alert = UIAlertController(title: "Error", message: "\(error)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
                                                                                                             
        self.present(alert, animated: true)
    }
    
    func dataIsUpdated() {
            mainTableView!.reloadData()
    }
}

extension PostsViewController: PostCellDelegate {
    func push(postID: Int) {
        guard let vc = PostModule.buildModule(postId: postID) else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
