//
//  TweetsUseCase.swift
//  AssignmentOne
//
//  Created by Zishu Ma on 2022/4/6.
//

import Foundation
import Combine

protocol TweetsUseCase {
    func retrieveAllTweets() -> AnyPublisher<[Message], TweetsUserCaseError>
}

enum TweetsUserCaseError: Error {
    case internalError
}
