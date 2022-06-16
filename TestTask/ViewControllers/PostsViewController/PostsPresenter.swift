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
    
    func loadData(endpoint: String) {
        postManager.getPostsList() { posts in
            self.posts = posts
            DispatchQueue.main.async {
                self.view?.dataIsUpdated()
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
        
        view?.dataIsUpdated()
    }
}
