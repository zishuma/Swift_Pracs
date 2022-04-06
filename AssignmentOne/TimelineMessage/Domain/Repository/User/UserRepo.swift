//
//  UserRepo.swift
//  AssignmentOne
//
//  Created by Zishu Ma on 2022/4/6.
//

import Foundation
import Combine

protocol UserRepo{
    func getCurrentUser() -> AnyPublisher<User, UserRepoError>
}

enum UserRepoError: Error {
    case internalError
}
