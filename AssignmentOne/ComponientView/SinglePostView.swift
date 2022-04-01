//
//  SinglePostView.swift
//  AssignmentOne
//
//  Created by Zishu Ma on 2022/3/25.
//

import SwiftUI

struct SinglePostView: View {
    var msg : Message
    
    var body: some View {
        if let owner = msg.sender {
            HStack(alignment: .top){
                AsyncImage(url: URL(string: owner.avatar)){ image in
                    image.resizable()
                }placeholder: {
                    ProgressView()
                }
                .frame(width: 50, height: 50)
                
                VStack(alignment: .leading){
                    Text("\(owner.nick)")
                        .fontWeight(.bold)
                        .padding(.bottom, 1)
                    if let description = msg.content {
                        Text("\(description)")
                            .foregroundColor(.secondary)
                    }
                    
                    if let pics = msg.images {
                        PostImagesView(pics: pics)
                    }
                    
    //                if let fo = msg.follower {
    //                    ZStack{
    //                        Color.gray
    //                        HStack{
    //                            Image(systemName: "suit.heart")
    //                                .foregroundColor(.white)
    //                            Text("\(fo)")
    //                                .foregroundColor(.white)
    //                            Spacer()
    //                        }
    //                    }
    //
    //                }
                }
                Spacer()
            }
            .padding()
        }
    }
}

struct SinglePostView_Previews: PreviewProvider {
    static var previews: some View {
        SinglePostView(msg: Message(id: 1, content: "wtf", sender: Sender(username: "ankdla", nick: "桃子猪", avatar: "https://thoughtworks-mobile-2018.herokuapp.com/images/user/avatar/001.jpeg"))
)
    }
}
