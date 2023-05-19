//
//  OnboardingBuilder.swift
//  FetchTheDog
//
//  Created by Alexey Barinov on 11.05.2023.
//  Copyright (c) 2023 ABSoftware. All rights reserved.
//
//

import UIKit

protocol OnboardingIBuilder: AnyObject {
	func build() -> UIViewController
}

class OnboardingBuilder {

	func build() -> OnboardingViewController {
		let viewController = OnboardingViewController(
			transitionStyle: .scroll,
			navigationOrientation: .horizontal)
		let interactor = OnboardingInteractor()
		let presenter = OnboardingPresenter()
		let router = OnboardingRouter()
		viewController.interactor = interactor
		viewController.router = router
		interactor.presenter = presenter
		presenter.viewController = viewController
		router.viewController = viewController
		router.dataStore = interactor
		return viewController
	}
}
