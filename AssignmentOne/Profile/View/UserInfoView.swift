//
//  UserInfoView.swift
//  AssignmentOne
//
//  Created by Zishu Ma on 2022/4/6.
//

import SwiftUI

struct UserInfoView: View {
    @StateObject var profileViewModel: ProfileViewModel
    
    init(retrieveCurrentUserInfoUsecase: UserUseCase){
        _profileViewModel = StateObject(wrappedValue: ProfileViewModel(userUseCase: retrieveCurrentUserInfoUsecase))
    }
    
    
    var body: some View {
        NavigationView{
            VStack{
                NavigationLink(destination: PersonalView(avatar: profileViewModel.user.avatar)){
                    HStack(alignment: .center) {
                        AsyncImage(url: URL(string: profileViewModel.user.avatar)){ image in
                            image.resizable()
                        }placeholder: {
                            ImagePlaceholderView()
                                .scaledToFill()
                        }
                        .frame(width: 70, height: 70)
                        .clipped()
                        
                        
                        Text(profileViewModel.user.nick)
                            .foregroundColor(.black)
                        Spacer()
                        Image(systemName: "chevron.right")
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
        .onAppear {
            profileViewModel.loadUser()
        }
    }
}


