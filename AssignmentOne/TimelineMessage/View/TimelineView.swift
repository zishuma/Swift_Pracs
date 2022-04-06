//
//  TimelineView.swift
//  AssignmentOne
//
//  Created by Zishu Ma on 2022/4/6.
//

import SwiftUI

struct TimelineView: View {
    @StateObject var messageModel : MessageModel
    
    init(retrieveCurrentTweetInfoUsecase: TweetsUseCase) {
        _messageModel = StateObject(wrappedValue: MessageModel(tweetsUseCase: retrieveCurrentTweetInfoUsecase))
    }
    
    
    var body: some View {
        LazyVStack(alignment: .leading) {
            ForEach(messageModel.messages){ msg in
                SinglePostView(msg: msg)
            }
        }
        .background(Color.white)
        .padding()
        .onAppear {
            messageModel.loadTweets()
        }
    }
}
