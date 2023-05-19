//
//  OnboardingRouter.swift
//  FetchTheDog
//
//  Created by Alexey Barinov on 11.05.2023.
//  Copyright (c) 2023 ABSoftware. All rights reserved.
//
//

import UIKit

@objc protocol OnboardingRoutingLogic {
	func navigateToLogin(
		source: OnboardingViewController,
		destination: LoginViewController,
		animated: Bool)
}

protocol OnboardingDataPassing {
	var dataStore: OnboardingDataStore? { get }
}

class OnboardingRouter: NSObject, OnboardingRoutingLogic, OnboardingDataPassing {
	weak var viewController: OnboardingViewController?
	var dataStore: OnboardingDataStore?

	// MARK: Navigation

	func navigateToLogin(
		source: OnboardingViewController,
		destination: LoginViewController,
		animated: Bool) {
		UserDefaults.standard.set(true, forKey: FlowKeys.onboardPassed.rawValue)
		source.navigationController?.pushViewController(destination, animated: animated)
	}
}
