//
//  AppCoordinator.swift
//  FetchTheDog
//
//  Created by Mac on 12.05.2023.
//

import UIKit

enum Scenario {
	case full
	case fromLogin
	case fromDogFetcher
}

protocol IAppCoordinator {
	var scenario: Scenario { get set }
	func start() -> UIViewController
}

final class AppCoordinator: IAppCoordinator {
	var scenario: Scenario

	init(scenario: Scenario) {
		self.scenario = scenario
	}

	func start() -> UIViewController {
		switch scenario {
		case .full:
			return OnboardingBuilder().build()
		case .fromLogin:
			return LoginBuilder().build()
		case .fromDogFetcher:
			return DogFetcherBuilder().build()
		}
	}
}
