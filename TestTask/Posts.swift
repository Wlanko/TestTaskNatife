//
//  Posts.swift
//  TestTask
//
//  Created by Vlad Kyrylenko on 13.06.2022.
//

import Foundation

struct Post: Codable, Comparable {
    let postId: Int
    let timeshamp: Int
    let title: String
    let preview_text: String
    let likes_count: Int
    
    static func < (lhs: Post, rhs: Post) -> Bool {
        return lhs.timeshamp < rhs.timeshamp
    }
    static func > (lhs: Post, rhs: Post) -> Bool {
        return lhs.likes_count > rhs.likes_count
    }
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

struct PostById: Codable {
    let post: PostInfo
}

enum SortBy {
    case date
    case likes
}
