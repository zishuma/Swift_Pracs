//
//  WechatAPIImpl.swift
//  AssignmentOne
//
//  Created by Zishu Ma on 2022/4/6.
//

import Foundation
import Combine

final class WechatAPIImpl : WechatAPI {
    
    
    func retrieveUserInfo() -> AnyPublisher<User, URLError> {
        return URLSession.shared.dataTaskPublisher(for: URL(string: "https://thoughtworks-mobile-2018.herokuapp.com/user/jsmith")!)
            .map{$0.data}
            .flatMap{ data in
                return Just(data)
                    .decode(type: User.self, decoder: JSONDecoder())
                    .catch{ _ in
                        return Just(User(profileimage: "", avatar: "", nick: "", username: ""))
                    }
            }
            .compactMap{
                $0
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func retrieveTweetsInfo() -> AnyPublisher<[Message], URLError> {
        return URLSession.shared.dataTaskPublisher(for: URL(string: "https://thoughtworks-mobile-2018.herokuapp.com/user/jsmith/tweets")!)
            .map{$0.data}
            .flatMap{ data in
                return Just(data)
                    .decode(type: [Message].self, decoder: JSONDecoder())
                    .catch{ _ in
                        return Just([])
                    }
            }
            .compactMap{
                $0
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
}
