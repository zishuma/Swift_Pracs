//
//  messageView.swift
//  AssignmentOne
//
//  Created by Zishu Ma on 2022/3/23.
//

import SwiftUI

struct MessageView: View {
    
    @StateObject var messageModel : MessageModel = MessageModel()
    @StateObject var profileViewModel: ProfileViewModel = ProfileViewModel()
    
    var body: some View {
        ScrollView(.vertical){
            ZStack{
                let name = profileViewModel.user.nick
                let avatar = profileViewModel.user.avatar
                AsyncImage(url: URL(string: profileViewModel.user.profileimage)){ image in
                    image.resizable()
                        .scaledToFit()
                        .frame(minWidth: 0, maxWidth: .infinity)
                }placeholder: {
                    ImagePlaceholderView()
                        .scaledToFill()
                        .frame(maxWidth: .infinity, maxHeight: 400)
                }
                .scaledToFit()
                .overlay(UserImage(name: name, avatar: avatar), alignment: .bottomTrailing)
                .frame(maxWidth: .infinity, maxHeight: 300)
                
                
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
