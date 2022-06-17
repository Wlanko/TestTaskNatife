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
    var error: Error? = nil
    weak var view: PostsViewPresenter?
    
    init(with view: PostsViewPresenter) {
        self.view = view
    }
    
    func loadData(endpoint: String) {
        postManager.getPostsList() { result in
            switch result {
            case .success(_):
                self.posts =  self.postManager.posts
                DispatchQueue.main.async {
                    self.view?.dataIsUpdated(result: .success(self.posts))
                }
            case .failure(let error):
                self.error = error
                DispatchQueue.main.async {
                    self.view?.dataIsUpdated(result: .failure(error))
                }
            }
            
        }
    }
    
    func sortPosts(sortBy: SortBy) {
        switch sortBy {
        case .date:
            posts.sort { lhs, rhs in
                return lhs.timeshamp > rhs.timeshamp
            }
        case .likes:
            posts.sort { lhs, rhs in
                return lhs.likes_count > rhs.likes_count
            }
        }
        
        view?.dataIsUpdated(result: .success(posts))
    }
}
