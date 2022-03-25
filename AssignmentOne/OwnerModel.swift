//
//  OwnerModel.swift
//  AssignmentOne
//
//  Created by Zishu Ma on 2022/3/25.
//

import Foundation

@MainActor class OwnerModel : ObservableObject{
    @Published var avatar : String
    @Published var name: String
    
    init(avatar : String, name : String) {
        self.avatar = avatar
        self.name = name
    }
    
    func changeAvatar() {
        if self.avatar == "viewProfile" {
            self.avatar = "profile"
        } else {
            self.avatar = "viewProfile"
        }
    }
}
