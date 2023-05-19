//
//  LoginWorker.swift
//  FetchTheDog
//
//  Created by Alexey Barinov on 12.05.2023.
//  Copyright (c) 2023 ABSoftware. All rights reserved.
//
//

import UIKit

enum RegistrationResult {
	case failed
	case success
}

enum LoginResult {
	case failed
	case success
}

class LoginWorker {
	var coreDataManager: ICoreDataManager = CoreDataManager()

	@discardableResult
	func registerUser(user: User) -> RegistrationResult {
		var result: RegistrationResult = .failed
		if user.login.count > 4 && user.password.count > 4 {
			coreDataManager.saveUser(user)
			result = .success
			return result
		} else {
			result = .failed
		}
		return result
	}

	func loginUser(user: User) -> LoginResult {
		let users = coreDataManager.fetchUsers()
		var result: LoginResult = .failed
		for registeredUser in users {
			if registeredUser == user && user.login.count > 4 && user.password.count > 4 {
				result = .success
				return result
			} else {
				result = .failed
			}
		}
		return result
	}
}
