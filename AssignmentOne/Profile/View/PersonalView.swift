//
//  PersonalView.swift
//  AssignmentOne
//
//  Created by Zishu Ma on 2022/3/25.
//

import SwiftUI



struct PersonalView: View {
    var avatar: String
    @State var changeAvatar = false
    
    
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: avatar)){ image in
                image.resizable()
                    .scaledToFit()
            }placeholder: {
                ImagePlaceholderView()
                    .scaledToFill()
            }
            .frame(maxHeight: 400)
           
        }
        .navigationTitle("个人")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            Button{
                changeAvatar = true
            }label: {
                Image(systemName: "ellipsis")
            }
            .confirmationDialog("Change background", isPresented: $changeAvatar) {
                Button("Cancel", role: .cancel) { }
            } message: {
                Text("更多")
            }
        }
    }
}

struct PersonalView_Previews: PreviewProvider {
    
    static var previews: some View {
        PersonalView(avatar: "https://thoughtworks-mobile-2018.herokuapp.com/images/user/avatar.png")
    }
}
