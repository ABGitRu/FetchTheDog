//
//  LoginWorkerMock.swift
//  FetchTheDogTests
//
//  Created by Mac on 18.05.2023.
//

import Foundation
@testable import FetchTheDog

final class LoginWorkerMock: LoginWorker {
	override func loginUser(user: User) -> LoginResult {
		if user.login.count > 4 && user.password.count > 4 {
			return .success
		} else {
			return .failed
		}
	}
}
