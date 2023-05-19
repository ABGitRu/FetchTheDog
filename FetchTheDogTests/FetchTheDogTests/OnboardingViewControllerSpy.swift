//
//  OnboardingViewControllerSpy.swift
//  FetchTheDogTests
//
//  Created by Mac on 12.05.2023.
//

import Foundation
@testable import FetchTheDog

final class OnboardingViewControllerSpy: OnboardingViewController {
	var isPageDisplayed = false
	var isGoToLoginTriggered = false
	var isThirdPageButtonTapped = false

	override func startScene() {
		NotificationCenter.default.addObserver(
			self,
			selector: #selector(thirdPageButtonTapped),
			name: AppNotification.name,
			object: nil)
		let request = Onboarding.SceneStart.Request()
		interactor?.makeScene(request: request)
	}

	override func displayPage(viewModel: Onboarding.SceneStart.ViewModel) {
		isPageDisplayed = true
	}

	override func goToLogin(with builder: LoginIBuilder) {
		isGoToLoginTriggered = true
	}

	override func thirdPageButtonTapped() {
		isThirdPageButtonTapped = true
	}
}
