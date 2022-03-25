//
//  PersonalView.swift
//  AssignmentOne
//
//  Created by Zishu Ma on 2022/3/25.
//

import SwiftUI



struct PersonalView: View {
    @EnvironmentObject var ownerModel : OwnerModel
    @State var changeAvatar = false
    
    var body: some View {
        VStack{
            Image(ownerModel.avatar)
                .resizable()
                .scaledToFit()
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
                Button("修改头像") {
                    ownerModel.changeAvatar()
                }
                Button("Cancel", role: .cancel) { }
            } message: {
                Text("更多")
            }
        }
    }
}

struct PersonalView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalView().environmentObject(OwnerModel(avatar: "profile", name: "桃子猪"))
    }
}
