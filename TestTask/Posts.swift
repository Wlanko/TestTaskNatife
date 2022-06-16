//
//  Posts.swift
//  TestTask
//
//  Created by Vlad Kyrylenko on 13.06.2022.
//

import Foundation

struct Post: Decodable {
    let postId: Int
    let timeshamp: Int
    let title: String
    let preview_text: String
    let likes_count: Int
}

struct PostsList: Decodable {
    let posts: [Post?]
}

struct PostInfo: Decodable {
    let postId: Int
    let timeshamp: Int
    let title: String
    let text: String
    let postImage: URL
    let likes_count: Int
}

struct PostById: Decodable {
    let post: PostInfo
}

enum SortBy {
    case date
    case likes
}
