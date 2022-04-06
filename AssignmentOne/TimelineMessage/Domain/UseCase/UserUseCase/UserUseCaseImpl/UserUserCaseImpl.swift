//
//  UserUserCaseImpl.swift
//  AssignmentOne
//
//  Created by Zishu Ma on 2022/4/6.
//

import Foundation
import Combine

final class UserUseCaseImpl: UserUseCase {
    private var userRepo: UserRepo
    
    init(userRepo: UserRepo){
        self.userRepo = userRepo
    }
    
    func retrieveCurrentUser() -> AnyPublisher<User, URLError> {
        return userRepo.getCurrentUser()
    }
}
