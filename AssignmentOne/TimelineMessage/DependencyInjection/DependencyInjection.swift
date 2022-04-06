//
//  DependencyInjection.swift
//  AssignmentOne
//
//  Created by Zishu Ma on 2022/4/6.
//

import Foundation
import SwiftUI

class TimelineDependenceInjection: ObservableObject {
    let wechatAPI: WechatAPI
    let remoteUserDataSource: UserDataSource
    let remoteTweetDataSource: TweetsDataSource
    let userRepository: UserRepo
    let tweetRepository: TweetsRepo
    
    init() {
        let wechatAPI: WechatAPI = WechatAPIImpl()
        let remoteUserDataSource: UserDataSource = UserDataSourceImpl(wechatAPI: wechatAPI)
        let remoteTweetDataSource: TweetsDataSource = TweetsDataSourceImpl(wechatAPI: wechatAPI)
        let userRepository: UserRepo = UserRepoImpl(userDataSource: remoteUserDataSource)
        let tweetRepository: TweetsRepo = TweetsRepoImpl(tweetsDataSource: remoteTweetDataSource)
        
        self.wechatAPI = wechatAPI
        self.remoteUserDataSource = remoteUserDataSource
        self.remoteTweetDataSource = remoteTweetDataSource
        self.userRepository = userRepository
        self.tweetRepository = tweetRepository
    }
}

extension EnvironmentValues {
    struct TimelineDependenceInjectionKey: EnvironmentKey {
        static var defaultValue: TimelineDependenceInjection = TimelineDependenceInjection()
    }
    
    var timelineDependenceInjection: TimelineDependenceInjection {
        get {
            return self[TimelineDependenceInjectionKey.self]
        }
        set {
            self[TimelineDependenceInjectionKey.self] = newValue
        }
    }
}
