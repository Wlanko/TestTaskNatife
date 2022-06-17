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
    var postID: Int
    weak var view: PostsViewPresenter?
    
    var postInfo: PostInfo?
    
    init(with postID: Int, view: PostsViewPresenter) {
        self.view = view
        self.postID = postID
    }
    
    
    func loadData() {
        postManager.getPostInfo(postID: postID) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let posts):
                self.postInfo = posts
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
}
