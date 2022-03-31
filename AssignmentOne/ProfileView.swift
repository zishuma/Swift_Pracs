//
//  ProfileView.swift
//  AssignmentOne
//
//  Created by Zishu Ma on 2022/3/23.
//

import SwiftUI


struct ProfileView: View {
    @StateObject var profileViewModel: ProfileViewModel = .init()
    
    var body: some View {
        NavigationView{
            VStack{
                NavigationLink(destination: PersonalView()){
                    HStack(alignment: .center) {
                        AsyncImage(url: URL(string: profileViewModel.user.avatar)){ image in
                            image.resizable()
                        }placeholder: {
                            ProgressView()
                        }
                        .frame(width: 70, height: 70)
                        
                        
                        Text(profileViewModel.user.nick)
                            .foregroundColor(.black)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .padding(.top, 30)
                            .foregroundColor(.gray)
                    }
                    .padding()
                }
                .background(Color.white.ignoresSafeArea())
                .navigationTitle("我")
                .navigationBarTitleDisplayMode(.inline)
                Spacer()
            }
        }
    }
    
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
