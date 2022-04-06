//
//  ProfileView.swift
//  AssignmentOne
//
//  Created by Zishu Ma on 2022/3/23.
//

import SwiftUI
import Combine


struct ProfileView: View {
    
    @StateObject private var timelineDependenceInjection: TimelineDependenceInjection = TimelineDependenceInjection()
    
    var retrieveCurrentUserInfoUsecase: UserUseCase {
        return UserUseCaseImpl(userRepo: timelineDependenceInjection.userRepository)
    }
    
   
    var body: some View {
        UserInfoView(retrieveCurrentUserInfoUsecase: retrieveCurrentUserInfoUsecase)
    }
    
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
