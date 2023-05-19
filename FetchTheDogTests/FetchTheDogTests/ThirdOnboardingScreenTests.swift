//
//  ThirdOnboardingScreenTests.swift
//  FetchTheDogTests
//
//  Created by Mac on 12.05.2023.
//

import XCTest
@testable import FetchTheDog

final class ThirdOnboardingScreenTests: XCTestCase {

	var sut: ThirdOnboardingScreen!
	var controllerSpy: OnboardingViewControllerSpy!

	override func setUp() {
		super.setUp()
		sut = ThirdOnboardingScreen()
		controllerSpy = OnboardingViewControllerSpy()
	}

	override func tearDown() {
		super.tearDown()
		sut = nil
		controllerSpy = nil
	}

	func test_thirdOnboardScreenIsLoaded() {
		sut.loadViewIfNeeded()
		XCTAssertNotNil(sut)
		XCTAssertNotNil(sut.viewIfLoaded)
		XCTAssertTrue(sut.isViewLoaded)
	}

	func test_when_showLoginFormButtonTapped_NotificationSended() {
		controllerSpy.loadViewIfNeeded()
		sut.showLoginFormButtonTapped()
		XCTAssert(controllerSpy.isThirdPageButtonTapped)
	}

}
