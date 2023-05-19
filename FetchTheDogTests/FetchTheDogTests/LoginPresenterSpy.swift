//
//  LoginPresenterSpy.swift
//  FetchTheDogTests
//
//  Created by Mac on 18.05.2023.
//

import Foundation
@testable import FetchTheDog

final class LoginPresenterSpy: LoginPresenter {
	var registrationStatus: RegistrationResult?
	var loginStatus: LoginResult?

	override func presentRegistrationResult(response: Login.Register.Response) {
		registrationStatus = response.result
	}

	override func presentLoginResult(response: Login.Login.Response) {
		loginStatus = response.result
	}
}
