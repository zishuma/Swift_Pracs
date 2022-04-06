//
//  UserUsecase.swift
//  AssignmentOne
//
//  Created by Zishu Ma on 2022/4/6.
//

import Foundation
import Combine

protocol UserUseCase {
    func retrieveCurrentUser() -> AnyPublisher<User, UserUseCaseError>
}

enum UserUseCaseError: Error {
    case internalError
}
