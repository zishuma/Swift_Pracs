//
//  TweetsUseCaseImpl.swift
//  AssignmentOne
//
//  Created by Zishu Ma on 2022/4/6.
//

import Foundation
import Combine

final class TweetsUseCaseImpl: TweetsUseCase{
    private var tweetsRepo: TweetsRepo
    
    init(tweetsRepo: TweetsRepo){
        self.tweetsRepo = tweetsRepo
    }
    
    func retrieveAllTweets() -> AnyPublisher<[Message], TweetsUserCaseError> {
        return tweetsRepo.getTweets()
            .mapError({ _ in TweetsUserCaseError.internalError })
            .eraseToAnyPublisher()
    }
}
