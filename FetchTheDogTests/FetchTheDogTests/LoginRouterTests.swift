//
//  LoginRouterTests.swift
//  FetchTheDogTests
//
//  Created by Mac on 18.05.2023.
//

import XCTest
@testable import FetchTheDog

final class LoginRouterTests: XCTestCase {

	var sut: LoginRouter!

	override func setUp() {
		super.setUp()
		sut = LoginRouter()
	}

	override func tearDown() {
		super.tearDown()
		sut = nil
	}

	func test_navigateDogFetcherPresentsNewController() {
		// Arrange
		let firstController = LoginViewController()
		let navigation = UINavigationController(rootViewController: firstController)
		let secondController = DogFetcherViewController()

		// Act
		sut.navigateToDogFetcher(source: firstController, destination: secondController, animated: false)

		// Assert
		XCTAssertEqual(navigation.topViewController, secondController)
	}
}
