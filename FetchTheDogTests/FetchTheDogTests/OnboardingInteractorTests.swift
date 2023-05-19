//
//  OnboardingInteractorTests.swift
//  FetchTheDogTests
//
//  Created by Mac on 12.05.2023.
//

import XCTest
@testable import FetchTheDog

final class OnboardingInteractorTests: XCTestCase {

	var sut: OnboardingInteractor!
	var presenterSpy: OnboardingPresenterSpy!

	override func setUp() {
		super.setUp()
		sut = OnboardingInteractor()
		presenterSpy = OnboardingPresenterSpy()
		sut.presenter = presenterSpy
	}

	override func tearDown() {
		super.tearDown()
		sut = nil
		presenterSpy = nil
	}

	func test_makeScene_sendsPresentPageToPresenter() {
		let request = Onboarding.SceneStart.Request()
		sut.makeScene(request: request)

		XCTAssert(presenterSpy.isPresentPageTriggered)
	}

	func test_prepateRouting_sendsPresentNextSceneToPresenter() {
		let request = Onboarding.SceneEnding.Request()
		sut.prepareRouting(request: request)

		XCTAssert(presenterSpy.isPresentNextSceneTriggered)
	}
}
