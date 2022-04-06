//
//  ProfileViewModel.swift
//  AssignmentOne
//
//  Created by Zishu Ma on 2022/3/31.
//

import Foundation
import Combine

@MainActor final class ProfileViewModel: ObservableObject {
    @Published var user: User = User(profileimage: "", avatar: "", nick: "", username: "")
    private var value: Set<AnyCancellable> = .init()
    private var userUsecase: UserUseCase
    
    init(userUseCase: UserUseCase){
        self.userUsecase = userUseCase
    }
    
    func loadUser() {
        userUsecase
            .retrieveCurrentUser()
            .sink(receiveCompletion: {
                completion in
            }, receiveValue: { value in
                print(value)
                self.user = User(profileimage: value.profileimage, avatar: value.avatar, nick: value.nick, username: value.username)
            })
            .store(in: &self.value)
    }
    
}

