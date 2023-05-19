//
//  LoginInteractorSpy.swift
//  FetchTheDogTests
//
//  Created by Mac on 18.05.2023.
//

import Foundation
@testable import FetchTheDog

final class LoginInteractorSpy: LoginInteractor {
	var wasUserRegistrationStarted = false
	var wasUserLogingInStarted = false

	override func registerUser(request: Login.Register.Request) {
		wasUserRegistrationStarted = true
	}

	override func loginUser(request: Login.Login.Request) {
		wasUserLogingInStarted = true
	}
}
