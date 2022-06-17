//
//  PostsPresenter.swift
//  TestTask
//
//  Created by Vlad Kyrylenko on 13.06.2022.
//

import Foundation

class PostsPresenter {
    var postManager = PostManager()
    var postsList: PostsList?
    var posts = [Post]()
    weak var view: PostsViewPresenter?
    
    init(with view: PostsViewPresenter) {
        self.view = view
    }
    
    func loadData() {
        postManager.getPostsList() { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let posts):
                self.posts =  posts
                DispatchQueue.main.async {
                    self.view?.dataIsUpdated()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.view?.onError(error: error)
                }
            }
        }
    }
    
    func sortPosts(sortBy: SortBy) {
        posts.sort { lhs, rhs in
            switch sortBy {
            case .date:
                return lhs.timeshamp > rhs.timeshamp
            case .likes:
                return lhs.likes_count > rhs.likes_count
            }
        }
        
        view?.dataIsUpdated()
    }
}
