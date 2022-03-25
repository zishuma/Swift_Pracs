//
//  PersonalView.swift
//  AssignmentOne
//
//  Created by Zishu Ma on 2022/3/25.
//

import SwiftUI

struct PersonalView: View {
    @EnvironmentObject var ownerModel : OwnerModel
    
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
                ownerModel.changeAvatar()
            }label: {
                Image(systemName: "ellipsis")
            }
        }
    }
}

struct PersonalView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalView().environmentObject(OwnerModel(avatar: "profile", name: "桃子猪"))
    }
}
