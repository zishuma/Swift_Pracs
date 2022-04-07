//
//  TweetsRepoImplTest.swift
//  AssignmentOne
//
//  Created by Zishu Ma on 2022/4/7.
//  
//

import Quick
import Nimble
import Combine
@testable import AssignmentOne

class TweetsRepoImplTest: QuickSpec {
    override func spec() {
        describe("getTweets", closure: {
            let tweet1 = Message(id: 1, content: "Wowww", images: nil, sender: Sender(username: "ok", nick: "ok", avatar: ""), comments: nil)
            let tweet2 = Message(id: 2, content: nil, images: [ImageURL(url: "")], sender: Sender(username: "ok", nick: "ok", avatar: ""), comments: nil)
            let tweet3 = Message(id: 3, content: nil, images: nil, sender: Sender(username: "ok", nick: "ok", avatar: ""), comments: nil)
            let tweet4 = Message(id: 3, content: "ok", images: nil, sender: Sender(username: "ok", nick: "ok", avatar: ""), comments: nil)

            
            let tweetsOne: AnyPublisher<[Message], TweetsDataSourceError> = Just([tweet1, tweet2, tweet3])
                .setFailureType(to: TweetsDataSourceError.self)
                .eraseToAnyPublisher()
            let tweetsTwo: AnyPublisher<[Message], TweetsDataSourceError> = Just([tweet1, tweet2, tweet4])
                .setFailureType(to: TweetsDataSourceError.self)
                .eraseToAnyPublisher()
            
            let tweetsRepoOne = TweetsRepoImpl(tweetsDataSource: FakeTweetsDataSource(tweets: tweetsOne))
            let tweetsRepoTwo = TweetsRepoImpl(tweetsDataSource: FakeTweetsDataSource(tweets: tweetsTwo))

            var subscription: Set<AnyCancellable> = .init()
            
            context("when there are two valid tweets and one invalid tweet", closure: {
                var resultTweets: [Message] = []
                tweetsRepoOne
                    .getTweets()
                    .sink(receiveCompletion: {
                        completion in
                    }, receiveValue: { value in
                        let filtered = value
                            .filter{ msg in
                                return !(msg.content == nil && msg.images == nil)
                            }
                        resultTweets.removeAll()
                        resultTweets.append(contentsOf: filtered)
                    })
                    .store(in: &subscription)
                
                it("return two valid tweets", closure: {
                    expect(resultTweets.count).to(equal(2))
                })
            })
            context("when there are two valid tweets", closure: {
                var resultTweets: [Message] = []
                tweetsRepoTwo
                    .getTweets()
                    .sink(receiveCompletion: {
                        completion in
                    }, receiveValue: { value in
                        let filtered = value
                            .filter{ msg in
                                return !(msg.content == nil && msg.images == nil)
                            }
                        resultTweets.removeAll()
                        resultTweets.append(contentsOf: filtered)
                    })
                    .store(in: &subscription)
                it("return both tweets", closure: {
                    expect(resultTweets.count).to(equal(3))
                })
            })
        })
    }
}

private final class FakeTweetsDataSource: TweetsDataSource {
    var tweets: AnyPublisher<[Message], TweetsDataSourceError>
    
    init(tweets: AnyPublisher<[Message], TweetsDataSourceError>) {
        self.tweets = tweets
    }
    
    func getTweets() -> AnyPublisher<[Message], TweetsDataSourceError> {
        
        return tweets
    }
}
