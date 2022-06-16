//
//  PostsPresenter.swift
//  TestTask
//
//  Created by Vlad Kyrylenko on 13.06.2022.
//

import Foundation

protocol DataSeted {
    func dataSeted()
}

class PostsPresenter: DataSeted {
    var postManager = PostManager()
    var postsList: PostsList?
    var posts = [Post]()
    weak var view: PostsViewPresenter?
    
    init(with view: PostsViewPresenter) {
        self.view = view
    }
    
    func loadData(endpoint: String) {
        postManager.getPostsList(obj: self)
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
    
    func dataSeted() {
        posts = postManager.posts
        view?.dataIsUpdated()
    }
}
