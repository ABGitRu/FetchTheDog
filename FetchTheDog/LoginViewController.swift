//
//  LoginViewController.swift
//  FetchTheDog
//
//  Created by Alexey Barinov on 12.05.2023.
//  Copyright (c) 2023 ABSoftware. All rights reserved.
//
//

import UIKit

protocol LoginDisplayLogic: AnyObject {
	func displayRegistrationResult(viewModel: Login.Register.ViewModel)
	func displayLoginResult(viewModel: Login.Login.ViewModel)
}

class LoginViewController: UIViewController, LoginDisplayLogic {
	var interactor: LoginBusinessLogic?
	var router: (NSObjectProtocol & LoginRoutingLogic & LoginDataPassing)?
	var mainView: LoginView?
	// MARK: Object lifecycle

	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}

	// MARK: View lifecycle

	override func loadView() {
		view = mainView
	}

	@objc func loginButtonTapped() {
		if let login = mainView?.loginTextField.text, let password = mainView?.passwordTextField.text {
			let request = Login.Login.Request(user: User(login: login, password: password))
			interactor?.loginUser(request: request)
		}
	}

	@objc func registerButtonTapped() {
		if let login = mainView?.loginTextField.text, let password = mainView?.passwordTextField.text {
			let request = Login.Register.Request(user: User(login: login, password: password))
			interactor?.registerUser(request: request)
		}
	}

	func displayRegistrationResult(viewModel: Login.Register.ViewModel) {
		switch viewModel.status {
		case .success:
			showLoginRegisterAlert(
				title: L10n.Login.registrationSuccessAlertTitle,
				message: L10n.Login.registrationSuccessAlertMessage,
				buttonTitle: L10n.Login.registrationSuccessAlertButtonTitle,
				style: .default)
		case .fail:
			showLoginRegisterAlert(
				title: L10n.Login.registrationFailAlertTitle,
				message: L10n.Login.registrationFailAlertMessage,
				buttonTitle: L10n.Login.registrationFailAlertButtonTitle,
				style: .destructive)
		}
	}

	func displayLoginResult(viewModel: Login.Login.ViewModel) {
		switch viewModel.status {
		case .success:
			goToDogFetcher(with: DogFetcherBuilder())
		case .fail:
			showLoginRegisterAlert(
				title: L10n.Login.loginFailAlertTitle,
				message: L10n.Login.loginFailAlertMessage,
				buttonTitle: L10n.Login.loginFailAlertButtonTitle,
				style: .destructive)
		}
	}

	func goToDogFetcher(with builder: DogFetcherIBuilder) {
		router?.navigateToDogFetcher(source: self, destination: builder.build(), animated: true)
	}

	private func showLoginRegisterAlert(
		title: String,
		message: String,
		buttonTitle: String,
		style: UIAlertAction.Style) {
		let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
		let okAction = UIAlertAction(title: buttonTitle, style: style)
		ac.addAction(okAction)
		present(ac, animated: true)
	}
}
