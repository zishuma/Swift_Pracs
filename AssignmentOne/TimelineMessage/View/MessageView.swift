//
//  messageView.swift
//  AssignmentOne
//
//  Created by Zishu Ma on 2022/3/23.
//

import SwiftUI
import Combine

struct MessageView: View {
    
    @StateObject private var timelineDependenceInjection: TimelineDependenceInjection = TimelineDependenceInjection()
    
    var retrieveCurrentUserInfoUsecase: UserUseCase {
        return UserUseCaseImpl(userRepo: timelineDependenceInjection.userRepository)
    }
    
    var retrieveCurrentUserTweetsUsecase: TweetsUseCase {
        return TweetsUseCaseImpl(tweetsRepo: timelineDependenceInjection.tweetRepository)
    }
    
    var body: some View {
        ScrollView(.vertical){
            MessageHeaderView(retrieveCurrentUserInfoUsecase: retrieveCurrentUserInfoUsecase)
            TimelineView(retrieveCurrentTweetInfoUsecase: retrieveCurrentUserTweetsUsecase)
        }
        .navigationTitle("朋友圈")
        .navigationBarTitleDisplayMode(.inline)
    }
}

