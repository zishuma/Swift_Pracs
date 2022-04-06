//
//  UserDataSourceImpl.swift
//  AssignmentOne
//
//  Created by Zishu Ma on 2022/4/6.
//

import Foundation
import Combine

final class UserDataSourceImpl : UserDataSource {
    var wechatAPI: WechatAPI
    
    init(wechatAPI: WechatAPI){
        self.wechatAPI = wechatAPI
    }
    
    func getCurrentUser() -> AnyPublisher<User, UserDataSourceError> {
        return wechatAPI.retrieveUserInfo()
            .mapError({ _ in UserDataSourceError.internalError })
            .eraseToAnyPublisher()
    }
}
