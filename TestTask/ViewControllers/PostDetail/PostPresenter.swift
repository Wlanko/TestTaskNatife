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
            case .success(_):
                self.postInfo = self.postManager.postInfo
                DispatchQueue.main.async {
                    self.view?.dataIsUpdated(result: .success(self.postManager.posts))
                }
            case .failure(let error):
                self.error = error
                DispatchQueue.main.async {
                    self.view?.dataIsUpdated(result: .failure(error))
                }
            }
            
        }
    }
}
