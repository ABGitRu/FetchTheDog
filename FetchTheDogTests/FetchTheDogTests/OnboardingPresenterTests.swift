//
//  OnboardingPresenterTests.swift
//  FetchTheDogTests
//
//  Created by Mac on 12.05.2023.
//

import XCTest
@testable import FetchTheDog

final class OnboardingPresenterTests: XCTestCase {

	var sut: OnboardingPresenter!
	var viewControllerSpy: OnboardingViewControllerSpy!

	override func setUp() {
		super.setUp()
		sut = OnboardingPresenter()
		viewControllerSpy = OnboardingViewControllerSpy()
		sut.viewController = viewControllerSpy
	}

	override func tearDown() {
		super.tearDown()
		sut = nil
		viewControllerSpy = nil
	}

	func test_presentPage_dispaysPage() {
		let provider = OnboardingPagesProvider()
		let response = Onboarding.SceneStart.Response(pagesProvider: provider)
		sut.presentPage(response: response)

		XCTAssert(viewControllerSpy.isPageDisplayed)
	}

	func test_presentNextScene_triggersGoToLoginFlow() {
		let builder = LoginBuilder()
		let response = Onboarding.SceneEnding.Response(builder: builder)
		sut.presentNextScene(response: response)

		XCTAssert(viewControllerSpy.isGoToLoginTriggered)
	}
}
