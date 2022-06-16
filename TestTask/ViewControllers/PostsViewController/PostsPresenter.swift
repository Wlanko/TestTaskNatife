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
            case .success(let data):
                do {
                    self.postsList = try JSONDecoder().decode(PostsList.self, from: data)
                    self.posts =  self.postsList?.posts as! [Post]
                } catch {
                    print("Is that really JSON?")
                }
            case .failure(let error):
                print(error)
                self.error = error
            }
            DispatchQueue.main.async {
                self.view?.dataIsUpdated(error: self.error)
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
        
        view?.dataIsUpdated(error: error)
    }
}
