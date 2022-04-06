//
//  File.swift
//  AssignmentOne
//
//  Created by Zishu Ma on 2022/4/6.
//

import Foundation

struct User: Codable {
    var profileimage: String
    var avatar: String
    var nick: String
    var username: String
    
    private enum CodingKeys: String, CodingKey {
            case profileimage = "profile-image"
            case avatar
            case nick
            case username
        }
}
