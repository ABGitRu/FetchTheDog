//
//  LoginViewControllerSpy.swift
//  FetchTheDogTests
//
//  Created by Mac on 18.05.2023.
//

import Foundation
@testable import FetchTheDog

final class LoginViewControllerSpy: LoginViewController {

	var isRegistrationResultDisplayed = false
	var isLoginResultDisplated = false

	override func displayRegistrationResult(viewModel: Login.Register.ViewModel) {
		isRegistrationResultDisplayed = true
	}

	override func displayLoginResult(viewModel: Login.Login.ViewModel) {
		isLoginResultDisplated = true
	}
}
