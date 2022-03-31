//
//  messageView.swift
//  AssignmentOne
//
//  Created by Zishu Ma on 2022/3/23.
//

import SwiftUI


struct UserImage : View {
    @EnvironmentObject var ownerModel : OwnerModel
    
    var body: some View {
        HStack{
            Spacer()
            Text(ownerModel.name)
                .fontWeight(.bold)
                .foregroundColor(.white)
            Image(ownerModel.avatar)
        }
        .offset(x: -20)
        .offset(y: 20)
    }
}

struct MessageView: View {
    
    @StateObject var messageModel : MessageModel = MessageModel()
    
    var body: some View {
        ScrollView(.vertical){
            ZStack{
                Image("view")
                    .resizable()
                    .scaledToFit()
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
