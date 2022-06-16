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
    weak var view: PostsViewPresenter?
    
    init(with postID: Int, view: PostsViewPresenter) {
        self.view = view
        self.postID = postID
    }
    
    
    func loadData() {
        postManager.getPostInfo(postID: postID) { postInfo in
            self.postInfo = postInfo
            DispatchQueue.main.async {
                self.view?.dataIsUpdated()
            }
        }
    }
}
