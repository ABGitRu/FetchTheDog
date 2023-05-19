//
//  AppFlow.swift
//  FetchTheDog
//
//  Created by Mac on 12.05.2023.
//

import UIKit

protocol IAppFlow {
	var scenario: Scenario? { get set }
	func getScene() -> UIViewController
}

final class AppFlow {
	var scenario: Scenario?
	var storage = UserDefaults.standard

	func getScene() -> UIViewController {
		checkScenario()
		let coordinator = AppCoordinator(scenario: scenario ?? .full)
		return coordinator.start()
	}

	private func checkScenario() {
		let onboardflow = FlowKeys.onboardPassed
		let loginFlow = FlowKeys.loginPassed
		let isOnboardPassed = storage.bool(forKey: onboardflow.key)
		let isLoginPassed = storage.bool(forKey: loginFlow.key)

		if isOnboardPassed {
			scenario = .fromLogin
		}

		if isLoginPassed {
			scenario = .fromDogFetcher
		}
	}
}
