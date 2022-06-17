//
//  PostManager.swift
//  TestTask
//
//  Created by Vlad Kyrylenko on 16.06.2022.
//

import Foundation

class PostManager {
    var networkManager = NetworkManager()
    
    func getPostsList(complition: @escaping (_ result: Result<[Post], Error>) -> Void) {
        networkManager.makeRequest(endpoint: Endpoint.posts.path) { result in
            switch result {
            case .success(let data):
                do {
                    let postsList = try JSONDecoder().decode(PostsList.self, from: data)
                    complition(.success(postsList.posts))
                } catch {
                    complition(.failure(error))
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getPostInfo(postID: Int,
                     complition: @escaping (_ result: Result<PostInfo, Error>) -> Void) {
        networkManager.makeRequest(endpoint: Endpoint.post(id: postID).path) { result in
            switch result {
            case .success(let data):
                do {
                    let postByID = try JSONDecoder().decode(PostById.self, from: data)
                    complition(.success(postByID.post))
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
        
        var path: String {
            switch self {
            case .posts:
                return "/main.json"
            case .post(let id):
                return "/posts/\(id).json"
            }
        }
    }
}
