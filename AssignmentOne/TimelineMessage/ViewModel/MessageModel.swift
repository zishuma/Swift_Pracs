//
//  MessageModel.swift
//  AssignmentOne
//
//  Created by Zishu Ma on 2022/3/25.
//

import Foundation
import Combine

@MainActor final class MessageModel : ObservableObject {
    @Published var messages : [Message] = []
    private var timeLines : Set<AnyCancellable> = .init()
    private var tweetsUseCase: TweetsUseCase
    
    init(tweetsUseCase: TweetsUseCase){
        self.tweetsUseCase = tweetsUseCase
    }
    
    func loadTweets() {
        tweetsUseCase
            .retrieveAllTweets()
            .sink(receiveCompletion: {
                completion in
            }, receiveValue: { value in
                let filtered = value
                    .filter{ msg in
                        return !(msg.content == nil && msg.images == nil)
                    }
                self.messages.removeAll()
                self.messages.append(contentsOf: filtered)
            })
            .store(in: &self.timeLines)
    }
    
}

