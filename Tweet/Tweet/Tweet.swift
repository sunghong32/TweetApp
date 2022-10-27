//
//  Tweet.swift
//  Tweet
//
//  Created by 민성홍 on 2022/10/25.
//

import Foundation

struct Tweet: Codable {
    let user: User
    let contents: String
}
