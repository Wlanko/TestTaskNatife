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
    
    func getPostsList(complition: @escaping (_ result: Result<Data, Error>) -> Void) {
        var postsList: PostsList?
        
        networkManager.makeRequest(endpoint: Endpoint.posts.enpoint) { result in
            switch result {
            case .success(let data):
                do {
                    postsList = try JSONDecoder().decode(PostsList.self, from: data)
                    self.posts =  postsList?.posts as! [Post]
                    complition(.success(data))
                } catch {
                    complition(.failure(error))
                }
            case .failure(let error):
                print(error)
            }
            
            DispatchQueue.main.async {
                //obj.dataSeted()
            }
        }
    }
    
    func getPostInfo(postID: Int,
                     complition: @escaping (_ result: Result<Data, Error>) -> Void) {
        var postByID: PostById?
        
        networkManager.makeRequest(endpoint: Endpoint.post(id: postID).enpoint) { [self] result in
            switch result {
            case .success(let data):
                do {
                    postByID = try JSONDecoder().decode(PostById.self, from: data)
                    postInfo = postByID?.post
                    complition(.success(data))
                } catch {
                    complition(.failure(error))
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    enum Endpoint {
        case posts
        case post(id: Int)
        var enpoint: String {
            switch self {
            case .posts:
                return "/main.json"
            case .post(let id):
                return "/posts/\(id).json"
            }
        }
    }
}
