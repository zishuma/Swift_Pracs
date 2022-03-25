//
//  AssignmentOneApp.swift
//  AssignmentOne
//
//  Created by Zishu Ma on 2022/3/23.
//

import SwiftUI

@main
struct AssignmentOneApp: App {
    @StateObject var ownerModel : OwnerModel = OwnerModel(avatar: "profile", name: "桃子猪")
    
    var body: some Scene {
        WindowGroup {
            FootTabView()
                .environmentObject(ownerModel)
        }
    }
}
