//
//  LoginBuilder.swift
//  FetchTheDog
//
//  Created by Alexey Barinov on 12.05.2023.
//  Copyright (c) 2023 ABSoftware. All rights reserved.
//
//

import UIKit

protocol LoginIBuilder: AnyObject {
	func build() -> LoginViewController
}

class LoginBuilder: LoginIBuilder {

	func build() -> LoginViewController {
		let viewController = LoginViewController()
		let interactor = LoginInteractor()
		let presenter = LoginPresenter()
		let router = LoginRouter()
		let view = LoginView()
		viewController.interactor = interactor
		viewController.router = router
		viewController.mainView = view
		interactor.presenter = presenter
		presenter.viewController = viewController
		router.viewController = viewController
		router.dataStore = interactor
		return viewController
	}
}
