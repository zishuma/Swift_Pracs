//
//  ProfileViewModel.swift
//  AssignmentOne
//
//  Created by Zishu Ma on 2022/3/31.
//

import Foundation
import Combine

@MainActor final class ProfileViewModel: ObservableObject {
    @Published var user: User = User(avatar: "", nick: "", username: "")
    private var value: Set<AnyCancellable> = .init()
    
    init(){
        URLSession.shared.dataTaskPublisher(for: URL(string: "https://thoughtworks-mobile-2018.herokuapp.com/user/jsmith")!)
            .map{$0.data}
            .flatMap{ data in
                return Just(data)
                    .decode(type: User.self, decoder: JSONDecoder())
                    .catch{ _ in
                        return Just(User(avatar: "", nick: "", username: ""))
                    }
            }
            .compactMap{
                $0
            }
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {
                completion in
            }, receiveValue: { value in
                print(value)
                self.user = User(avatar: value.avatar, nick: value.nick, username: value.username)
            })
            .store(in: &self.value)
    }
    
}


struct User: Codable {
    let avatar: String
    let nick: String
    let username: String
}
