//
//  NetworkManager.swift
//  TestTask
//
//  Created by Vlad Kyrylenko on 13.06.2022.
//

import Foundation
// TODO: create PostsManager
class NetworkManager {
    enum NetworkError: Error {
        case wrongURL
    }
    enum URlmethod: String {
        case get = "GET"
        case post = "POST"
    }
    
    let baseURL = "https://raw.githubusercontent.com/anton-natife/jsons/master/api"
    
    func makeRequest(endpoint: String,
                     method: URlmethod = .get,
                     body: Data? = nil,
                     completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        let stringURL = "\(baseURL)\(endpoint)"
        guard let url = URL(string: stringURL) else {
            completion(.failure(NetworkError.wrongURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: request,
                                   completionHandler: { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            if let data = data {
                completion(.success(data))
            }
        }).resume()
    }
}
