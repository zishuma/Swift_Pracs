//
//  UserDataSource.swift
//  AssignmentOne
//
//  Created by Zishu Ma on 2022/4/6.
//

import Foundation
import Combine
import SwiftUI

protocol UserDataSource {
    func getCurrentUser() -> AnyPublisher<User, UserDataSourceError>
}

enum UserDataSourceError: Error {
    case internalError
}
