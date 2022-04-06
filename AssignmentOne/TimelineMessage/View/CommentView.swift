//
//  CommentView.swift
//  AssignmentOne
//
//  Created by Zishu Ma on 2022/4/6.
//

import SwiftUI

struct CommentView: View {
    var comment: Comment
    
    var body: some View {
        HStack{
            Text("\(comment.sender.nick): \(comment.content)")
                .foregroundColor(.white)
                .font(.system(size: 13.0))
            Spacer()
        }
        .background(.gray)
    }
}

struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView(comment: Comment(content: "wtf", sender: Sender(username: "rachelM", nick: "RachelM", avatar: "")))
    }
}
