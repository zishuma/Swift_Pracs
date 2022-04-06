//
//  MessageHeaderView.swift
//  AssignmentOne
//
//  Created by Zishu Ma on 2022/4/6.
//

import SwiftUI

struct MessageHeaderView: View {
    @StateObject var profileViewModel: ProfileViewModel
    
    init(retrieveCurrentUserInfoUsecase: UserUseCase) {
        _profileViewModel = StateObject(wrappedValue: ProfileViewModel(userUseCase: retrieveCurrentUserInfoUsecase))
    }
    
    var body: some View {
        ZStack{
            let name = profileViewModel.user.nick
            let avatar = profileViewModel.user.avatar
            AsyncImage(url: URL(string: profileViewModel.user.profileimage)){ image in
                image.resizable()
                    .scaledToFit()
                    .frame(minWidth: 0, maxWidth: .infinity)
            }placeholder: {
                ImagePlaceholderView()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: 400)
            }
            .scaledToFit()
            .overlay(UserImage(name: name, avatar: avatar), alignment: .bottomTrailing)
            .frame(maxWidth: .infinity, maxHeight: 300)
        }
        .onAppear {
            profileViewModel.loadUser()
        }
    }
}
