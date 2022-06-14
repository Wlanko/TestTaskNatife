//
//  PostsPresenter.swift
//  TestTask
//
//  Created by Vlad Kyrylenko on 13.06.2022.
//

import Foundation

class PostsPresenter {
    var networkManager = NetworkManager()
    var postsList: PostsList?
    var posts = [Post]()
    weak var view: PostsViewPresenter?
    init(with view: PostsViewPresenter) {
        self.view = view
    }
    
    func loadData(endpoint: String) {
        networkManager.makeRequest(endpoint: endpoint) { [self] result in
            switch result {
            case .success(let data):
                do {
                    postsList = try JSONDecoder().decode(PostsList.self, from: data)
                    posts = postsList?.posts as! [Post]
                } catch {
                    print("Is that really JSON?")
                }
            case .failure(let error):
                print(error)
            }
            DispatchQueue.main.async { [self] in
                view?.dataIsUpdated()
            }
        }
    }
}
