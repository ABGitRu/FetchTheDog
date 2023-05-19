//
//  FirstOnboardingScreenTests.swift
//  FetchTheDogTests
//
//  Created by Mac on 12.05.2023.
//

import XCTest
@testable import FetchTheDog

final class FirstOnboardingScreenTests: XCTestCase {

	var sut: FirstOnboardingScreen!

	override func setUp() {
		super.setUp()
		sut = FirstOnboardingScreen()
	}

	override func tearDown() {
		super.tearDown()
		sut = nil
	}

	func test_firstOnboardScreenIsLoaded() {
		sut.loadViewIfNeeded()
		XCTAssertNotNil(sut)
		XCTAssertNotNil(sut.viewIfLoaded)
		XCTAssertTrue(sut.isViewLoaded)
	}

}
