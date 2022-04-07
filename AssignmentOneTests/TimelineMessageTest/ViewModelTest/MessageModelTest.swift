//
//  MessageModelTest.swift
//  AssignmentOneTests
//
//  Created by Zishu Ma on 2022/4/7.
//

import XCTest
import Combine
@testable import AssignmentOne

class MessageModelTest: XCTestCase {


    @MainActor func testShouldAddTwoValidTweetsIntoMessagesField() throws {
        // Given
        let messgeModel = MessageModel(tweetsUseCase: FakeTweetsUseCase())
        
        // When
        messgeModel
            .loadTweets()
        
        // Then
        XCTAssertEqual(messgeModel.messages.count, 2)
        XCTAssertEqual(messgeModel.messages[0].id, 1)
        XCTAssertEqual(messgeModel.messages[1].id, 2)
    }

}


private final class FakeTweetsUseCase: TweetsUseCase {
    
    func retrieveAllTweets() -> AnyPublisher<[Message], TweetsUserCaseError> {
        let tweet1 = Message(id: 1, content: "Wowww", images: nil, sender: Sender(username: "ok", nick: "ok", avatar: ""), comments: nil)
        let tweet2 = Message(id: 2, content: nil, images: [ImageURL(url: "")], sender: Sender(username: "ok", nick: "ok", avatar: ""), comments: nil)
        let tweet3 = Message(id: 3, content: nil, images: nil, sender: Sender(username: "ok", nick: "ok", avatar: ""), comments: nil)
        
        return Just([tweet1, tweet2, tweet3])
            .setFailureType(to: TweetsUserCaseError.self)
            .eraseToAnyPublisher()
    }
}
