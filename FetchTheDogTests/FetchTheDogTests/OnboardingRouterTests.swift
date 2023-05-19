//
//  OnboardingRouterTests.swift
//  FetchTheDogTests
//
//  Created by Mac on 12.05.2023.
//

import XCTest
@testable import FetchTheDog

final class OnboardingRouterTests: XCTestCase {

	var sut: OnboardingRouter!

	override func setUp() {
		super.setUp()
		sut = OnboardingRouter()
	}

	override func tearDown() {
		super.tearDown()
		sut = nil
	}

	func test_navigateToLoginPresentsNewController() {
		// Arrange
		let firstController = OnboardingViewController()
		let navigation = UINavigationController(rootViewController: firstController)
		let secondController = LoginViewController()

		// Act
		sut.navigateToLogin(source: firstController, destination: secondController, animated: false)

		// Assert
		XCTAssertEqual(navigation.topViewController, secondController)
	}

}
