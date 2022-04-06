//
//  WechatAPI.swift
//  AssignmentOne
//
//  Created by Zishu Ma on 2022/4/6.
//

import Foundation
import Combine

protocol WechatAPI {
    func retrieveUserInfo() -> AnyPublisher<User, WechatAPIError>
    func retrieveTweetsInfo() -> AnyPublisher<[Message], WechatAPIError>
}

enum WechatAPIError: Error {
    case internalError
}
