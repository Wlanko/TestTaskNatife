//
//  PostPresenter.swift
//  TestTask
//
//  Created by Vlad Kyrylenko on 14.06.2022.
//

import Foundation
import UIKit

class PostPresenter: DataSeted {
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
        postManager.getPostInfo(obj: self, postID: postID)
    }
    
    func dataSeted() {
        postInfo = postManager.postInfo
        view?.dataIsUpdated()
    }
}
