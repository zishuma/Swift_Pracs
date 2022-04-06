//
//  TweetsRepoImpl.swift
//  AssignmentOne
//
//  Created by Zishu Ma on 2022/4/6.
//

import Foundation
import Combine

final class TweetsRepoImpl: TweetsRepo{
    private var tweetsDataSource: TweetsDataSource
    
    init(tweetsDataSource: TweetsDataSource){
        self.tweetsDataSource = tweetsDataSource
    }
    
    func getTweets() -> AnyPublisher<[Message], URLError> {
        return tweetsDataSource.getTweets()
    }
}
