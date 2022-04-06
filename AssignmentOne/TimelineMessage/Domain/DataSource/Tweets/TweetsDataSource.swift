//
//  TweetsDataSource.swift
//  AssignmentOne
//
//  Created by Zishu Ma on 2022/4/6.
//

import Foundation
import Combine

protocol TweetsDataSource {
    func getTweets() -> AnyPublisher<[Message], TweetsDataSourceError>
}

enum TweetsDataSourceError: Error{
    case internalError
}
