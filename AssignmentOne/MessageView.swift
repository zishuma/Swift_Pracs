//
//  messageView.swift
//  AssignmentOne
//
//  Created by Zishu Ma on 2022/3/23.
//

import SwiftUI

struct Message : Identifiable {
    var id : String
    var pic : String
    var name : String
    var description : String
    var imag : String?
    var follower : String?
    
}


struct UserImage : View {
    var body: some View {
        HStack{
            Spacer()
            Text("桃子猪")
                .fontWeight(.bold)
                .foregroundColor(.white)
            Image("profile")
        }
        .offset(x: -40)
        .offset(y: 20)
    }
}

struct MessageView: View {
    
    @StateObject var messageModel = MessageModel()
    
    var body: some View {
        ScrollView(.vertical){
            ZStack{
                Image("view")
                    .resizable()
                    .overlay(UserImage(), alignment: .bottomTrailing)
                    .frame(minWidth: 0, maxWidth: .infinity)
            }
            LazyVStack(alignment: .leading) {
                ForEach(messageModel.messages){ msg in
                    SinglePostView(msg: msg)
                }
            }
            .background(Color.white)
            .padding()
        }
        .navigationTitle("朋友圈")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}
