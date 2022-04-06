//
//  MessageModel.swift
//  AssignmentOne
//
//  Created by Zishu Ma on 2022/4/6.
//

import Foundation

struct Message : Identifiable, Codable {
    var id : Int
    var content : String?
    var images : [ImageURL]?
    var sender: Sender?
    var comments: [Comment]?
}
