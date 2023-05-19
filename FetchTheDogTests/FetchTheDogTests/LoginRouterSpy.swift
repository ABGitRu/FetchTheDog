//
//  LoginRouterSpy.swift
//  FetchTheDogTests
//
//  Created by Mac on 18.05.2023.
//

import Foundation
@testable import FetchTheDog

final class LoginRouterSpy: LoginRouter {
	var isNavigationTriggered = false

	override func navigateToDogFetcher(
		source: LoginViewController,
		destination: DogFetcherViewController,
		animated: Bool) {
		isNavigationTriggered = true
	}
}
