//
//  messageView.swift
//  AssignmentOne
//
//  Created by Zishu Ma on 2022/3/23.
//

import SwiftUI


struct UserImage : View {
    // @EnvironmentObject var ownerModel : OwnerModel
    var name: String
    var avatar: String
    
    var body: some View {
        HStack{
            Spacer()
            Text(name)
                .fontWeight(.bold)
                .foregroundColor(.white)
            AsyncImage(url: URL(string: avatar)){ image in
                image.resizable()
            }placeholder: {
                ProgressView()
            }
            .frame(width: 50, height: 50)
        }
        .offset(x: -20)
        .offset(y: 20)
    }
}

struct MessageView: View {
    
    @StateObject var messageModel : MessageModel = MessageModel()
    @StateObject var profileViewModel: ProfileViewModel = ProfileViewModel()
    
    var body: some View {
        ScrollView(.vertical){
            ZStack{
                let name = profileViewModel.user.nick
                let avatar = profileViewModel.user.avatar
                AsyncImage(url: URL(string: profileViewModel.user.avatar)){ image in
                    image.resizable()
                }placeholder: {
                    ProgressView()
                }
                .scaledToFit()
                .overlay(UserImage(name: name, avatar: avatar), alignment: .bottomTrailing)
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
