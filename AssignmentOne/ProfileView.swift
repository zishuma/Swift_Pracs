//
//  ProfileView.swift
//  AssignmentOne
//
//  Created by Zishu Ma on 2022/3/23.
//

import SwiftUI


struct ProfileView: View {
    @EnvironmentObject var ownModel : OwnerModel
    
    var body: some View {
        NavigationView{
            List{
                NavigationLink(destination: PersonalView()){
                    HStack(alignment: .top) {
                        Image(ownModel.avatar)
                            .resizable()
                            .frame(width: 50, height: 50)
                        Text(ownModel.name)
                        Spacer()
                    }
                }
            }
            .background(Color.white.ignoresSafeArea())
            .navigationTitle("我")
            .navigationBarTitleDisplayMode(.inline)
           Spacer()
        }
    }
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView().environmentObject(OwnerModel(avatar: "profile", name: "桃子猪"))
    }
}
