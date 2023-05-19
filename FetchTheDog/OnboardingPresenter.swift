//
//  OnboardingPresenter.swift
//  FetchTheDog
//
//  Created by Alexey Barinov on 11.05.2023.
//  Copyright (c) 2023 ABSoftware. All rights reserved.
//
//

import UIKit

protocol OnboardingPresentationLogic {
	func presentPage(response: Onboarding.SceneStart.Response)
	func presentNextScene(response: Onboarding.SceneEnding.Response)
}

class OnboardingPresenter: OnboardingPresentationLogic {
	weak var viewController: OnboardingDisplayLogic?

	func presentPage(response: Onboarding.SceneStart.Response) {
		let page = [response.pagesProvider.viewControllerList.first]
		let viewModel = Onboarding.SceneStart.ViewModel(provider: response.pagesProvider, page: page)
		viewController?.displayPage(viewModel: viewModel)
	}

	func presentNextScene(response: Onboarding.SceneEnding.Response) {
		let builder = response.builder
		viewController?.goToLogin(with: builder)
	}
}
