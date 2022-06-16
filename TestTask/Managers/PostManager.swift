//
//  PostManager.swift
//  TestTask
//
//  Created by Vlad Kyrylenko on 16.06.2022.
//

import Foundation

class PostManager {
    var networkManager = NetworkManager()
    var posts = [Post]()
    var postInfo: PostInfo?
    
    func getPostsList(obj: DataSeted) {
        let endpoint = "/main.json"
        
        var postsList: PostsList?
        
        networkManager.makeRequest(endpoint: endpoint) { result in
            switch result {
            case .success(let data):
                do {
                    postsList = try JSONDecoder().decode(PostsList.self, from: data)
                    self.posts =  postsList?.posts as! [Post]
                    print(self.posts)
                } catch {
                    print("Is that really JSON?")
                }
            case .failure(let error):
                print(error)
            }

            DispatchQueue.main.async {
                obj.dataSeted()
            }
        }
    }
    
    func getPostInfo(obj: DataSeted, postID: Int) {
        let endpoint = "/posts/\(postID).json"
        
        var postByID: PostById?
        
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
                obj.dataSeted()
            }
        }
    }
}
