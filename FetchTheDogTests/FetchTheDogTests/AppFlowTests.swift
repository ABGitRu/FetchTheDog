//
//  AppFlowTests.swift
//  FetchTheDogTests
//
//  Created by Mac on 12.05.2023.
//

import XCTest
@testable import FetchTheDog

final class AppFlowTests: XCTestCase {

	var sut: AppFlow!
	var storageMock: UserDefaultsMock!

	override func setUp() {
		super.setUp()
		sut = AppFlow()
		storageMock = UserDefaultsMock()
	}

	override func tearDown() {
		super.tearDown()
		sut = nil
		storageMock = nil
	}

	func test_getScene_returns_onboardingScene_whenScenarioIsFull() {
		storageMock.alreadyInBase = false
		sut.storage = storageMock
		let result = sut.getScene()
		XCTAssert(result is OnboardingViewController)
	}

	func test_getScene_returns_loginScene_whenScenarioIsFromLogin() {
		storageMock.alreadyInBase = true
		storageMock.flow = .onboardPassed
		sut.storage = storageMock
		let result = sut.getScene()
		XCTAssert(result is LoginViewController)
	}

	func test_getScene_returns_defaultScene_whenScenarioIsUnreacheble() {
		sut.storage = storageMock
		let result = sut.getScene()
		XCTAssert(result is OnboardingViewController)
	}
}
