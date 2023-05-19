//
//  LoginRouter.swift
//  FetchTheDog
//
//  Created by Alexey Barinov on 12.05.2023.
//  Copyright (c) 2023 ABSoftware. All rights reserved.
//
//

import UIKit

@objc protocol LoginRoutingLogic {
	func navigateToDogFetcher(
		source: LoginViewController,
		destination: DogFetcherViewController,
		animated: Bool)
}

protocol LoginDataPassing {
	var dataStore: LoginDataStore? { get }
}

class LoginRouter: NSObject, LoginRoutingLogic, LoginDataPassing {
	weak var viewController: LoginViewController?
	var dataStore: LoginDataStore?

	// MARK: Navigation

	func navigateToDogFetcher(source: LoginViewController, destination: DogFetcherViewController, animated: Bool) {
		UserDefaults.standard.set(true, forKey: FlowKeys.loginPassed.rawValue)
		source.navigationController?.pushViewController(destination, animated: animated)
	}

}
