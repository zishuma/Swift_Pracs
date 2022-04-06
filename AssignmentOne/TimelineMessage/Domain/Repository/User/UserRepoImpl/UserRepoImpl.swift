//
//  UserRepoImpl.swift
//  AssignmentOne
//
//  Created by Zishu Ma on 2022/4/6.
//

import Foundation
import Combine

final class UserRepoImpl: UserRepo {
    private var userDataSource: UserDataSource
    
    init(userDataSource: UserDataSource){
        self.userDataSource = userDataSource
    }
    
    func getCurrentUser() -> AnyPublisher<User, URLError> {
        return userDataSource.getCurrentUser()
    }
}
