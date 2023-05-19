//
//  LoginPresenter.swift
//  FetchTheDog
//
//  Created by Alexey Barinov on 12.05.2023.
//  Copyright (c) 2023 ABSoftware. All rights reserved.
//
//

import UIKit

enum RegistrationStatus {
	case success
	case fail
}

enum LoginStatus {
	case success
	case fail
}

protocol LoginPresentationLogic {
	func presentRegistrationResult(response: Login.Register.Response)
	func presentLoginResult(response: Login.Login.Response)
}

class LoginPresenter: LoginPresentationLogic {
	weak var viewController: LoginDisplayLogic?

	func presentRegistrationResult(response: Login.Register.Response) {
		var status: RegistrationStatus
		switch response.result {
		case .failed:
			status = .fail
		case .success:
			status = .success
		}

		let viewModel = Login.Register.ViewModel(status: status)
		viewController?.displayRegistrationResult(viewModel: viewModel)
	}

	func presentLoginResult(response: Login.Login.Response) {
		var status: LoginStatus

		switch response.result {
		case .failed:
			status = .fail
		case .success:
			status = .success
		}

		let viewModel = Login.Login.ViewModel(status: status)
		viewController?.displayLoginResult(viewModel: viewModel)
	}
}
