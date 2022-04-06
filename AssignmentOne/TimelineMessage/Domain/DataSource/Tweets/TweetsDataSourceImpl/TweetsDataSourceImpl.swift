//
//  TweetsDataSourceImpl.swift
//  AssignmentOne
//
//  Created by Zishu Ma on 2022/4/6.
//

import Foundation
import Combine

final class TweetsDataSourceImpl: TweetsDataSource {
    private var wechatAPI: WechatAPI
    
    init(wechatAPI: WechatAPI){
        self.wechatAPI = wechatAPI
    }
    
    func getTweets() -> AnyPublisher<[Message], URLError> {
        return wechatAPI.retrieveTweetsInfo()
    }
}
