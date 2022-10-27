//
//  User.swift
//  Tweet
//
//  Created by 민성홍 on 2022/10/25.
//

import Foundation

struct User: Codable {
    var name: String
    var account: String

    static var shared = User(name: "민성홍", account: "sunghong32")
}
