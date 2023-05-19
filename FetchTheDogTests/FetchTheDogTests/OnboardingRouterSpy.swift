//
//  OnboardingRouterSpy.swift
//  FetchTheDogTests
//
//  Created by Mac on 13.05.2023.
//

import Foundation
@testable import FetchTheDog

final class OnboardingRouterSpy: OnboardingRouter {
	var isNavigationTriggered = false

	override func navigateToLogin(source: OnboardingViewController, destination: LoginViewController, animated: Bool) {
		isNavigationTriggered = true
	}
}
