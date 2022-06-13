//
//  Posts.swift
//  TestTask
//
//  Created by Vlad Kyrylenko on 13.06.2022.
//

import Foundation

struct Post: Codable {
    let postId: Int
    let timeshamp: Int
    let title: String
    let preview_text: String
    let likes_count: Int
}

struct PostsList: Codable {
    let posts: [Post?]
}

struct PostInfo: Codable {
    let postId: Int
    let timeshamp: Int
    let title: String
    let text: String
    let postImage: URL
    let likes_count: Int
}
