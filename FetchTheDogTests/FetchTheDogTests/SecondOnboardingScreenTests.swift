//
//  SecondOnboardingScreenTests.swift
//  FetchTheDogTests
//
//  Created by Mac on 12.05.2023.
//

import XCTest
@testable import FetchTheDog

final class SecondOnboardingScreenTests: XCTestCase {

	var sut: SecondOnboardingScreen!

	override func setUp() {
		super.setUp()
		sut = SecondOnboardingScreen()
	}

	override func tearDown() {
		super.tearDown()
		sut = nil
	}

	func test_secondOnboardScreenIsLoaded() {
		sut.loadViewIfNeeded()
		XCTAssertNotNil(sut)
		XCTAssertNotNil(sut.viewIfLoaded)
		XCTAssertTrue(sut.isViewLoaded)
	}

}
