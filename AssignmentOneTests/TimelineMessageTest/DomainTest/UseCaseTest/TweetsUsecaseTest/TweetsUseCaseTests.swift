//
//  AssignmentOneTests.swift
//  AssignmentOneTests
//
//  Created by Zishu Ma on 2022/3/23.
//

import XCTest
import Combine
@testable import AssignmentOne

class TweetsUsecaseTests: XCTestCase {

    func testShouldFilterOutInvalidTweets() throws {
        //Given
        let tweetsUseCase = TweetsUseCaseImpl(tweetsRepo: FakeTweetsRepo())
        var subscription: Set<AnyCancellable> = .init()
        
        //When
        var result: [Message] = []
        tweetsUseCase
            .retrieveAllTweets()
            .sink(receiveCompletion: {
                completion in
            }, receiveValue: { value in
                let filtered = value
                    .filter{ msg in
                        return !(msg.content == nil && msg.images == nil)
                    }
                result.removeAll()
                result.append(contentsOf: filtered)
            })
            .store(in: &subscription)
        
        //Then
        XCTAssertEqual(result.count, 2)
        XCTAssertEqual(result[0].id, 1)
        XCTAssertEqual(result[1].id, 2)
    }


}

private final class FakeTweetsRepo: TweetsRepo {
    func getTweets() -> AnyPublisher<[Message], TweetsRepoError> {
        let tweet1 = Message(id: 1, content: "Wowww", images: nil, sender: Sender(username: "ok", nick: "ok", avatar: ""), comments: nil)
        let tweet2 = Message(id: 2, content: nil, images: [ImageURL(url: "")], sender: Sender(username: "ok", nick: "ok", avatar: ""), comments: nil)
        let tweet3 = Message(id: 3, content: nil, images: nil, sender: Sender(username: "ok", nick: "ok", avatar: ""), comments: nil)
        
        return Just([tweet1, tweet2, tweet3])
            .setFailureType(to: TweetsRepoError.self)
            .eraseToAnyPublisher()
    }
}
