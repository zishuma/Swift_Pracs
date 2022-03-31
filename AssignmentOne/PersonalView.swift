//
//  PersonalView.swift
//  AssignmentOne
//
//  Created by Zishu Ma on 2022/3/25.
//

import SwiftUI



struct PersonalView: View {
 //   @EnvironmentObject var ownerModel : OwnerModel
    @StateObject var profileViewModel: ProfileViewModel = .init()
    @State var changeAvatar = false
    
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: profileViewModel.user.avatar)){ image in
                image.resizable()
                    .scaledToFit()
            }placeholder: {
                ProgressView()
            }
           
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
        PersonalView()
    }
}
