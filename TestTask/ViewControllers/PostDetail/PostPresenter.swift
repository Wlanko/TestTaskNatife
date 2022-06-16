//
//  PostPresenter.swift
//  TestTask
//
//  Created by Vlad Kyrylenko on 14.06.2022.
//

import Foundation
import UIKit

class PostPresenter {
    var postManager = PostManager()
    var postInfo: PostInfo?
    var postByID: PostById?
    var postID: Int
    var error: Error? = nil
    weak var view: PostsViewPresenter?
    
    init(with postID: Int, view: PostsViewPresenter) {
        self.view = view
        self.postID = postID
    }
    
    
    func loadData() {
        postManager.getPostInfo(postID: postID) { result in
            switch result {
            case .success(let data):
                do {
                    self.postByID = try JSONDecoder().decode(PostById.self, from: data)
                    self.postInfo = self.postByID?.post
                } catch {
                    print("Is it really JSON")
                }
            case .failure(let error):
                self.error = error
                print(error)
            }
            DispatchQueue.main.async {
                self.view?.dataIsUpdated(error: self.error)
            }
        }
    }
}
