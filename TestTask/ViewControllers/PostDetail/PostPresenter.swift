//
//  PostPresenter.swift
//  TestTask
//
//  Created by Vlad Kyrylenko on 14.06.2022.
//

import Foundation
import UIKit

class PostPresenter {
    var networkManager = NetworkManager()
    var postInfo: PostInfo?
    var postByID: PostById?
    weak var view: PostsViewPresenter?
    init(with view: PostViewController) {
        self.view = view
    }
    
    func loadData(endpoint: String) {
        networkManager.makeRequest(endpoint: endpoint) { [self] result in
            switch result {
                case .success(let data):
                    do {
                        postByID = try JSONDecoder().decode(PostById.self, from: data)
                        postInfo = postByID?.post
                    } catch {
                        print("Is it really JSON")
                    }
                case .failure(let error):
                    print(error)
            }
            DispatchQueue.main.async {
                self.view?.dataIsUpdated()
            }
        }
    }
}
