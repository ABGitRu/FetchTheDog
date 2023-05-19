//
//  OnboardingViewControllerTests.swift
//  FetchTheDogTests
//
//  Created by Mac on 13.05.2023.
//

import XCTest
@testable import FetchTheDog

final class OnboardingViewControllerTests: XCTestCase {

	var sut: OnboardingViewController!

	override func setUp() {
		super.setUp()
		sut = OnboardingViewController()
	}

	override func tearDown() {
		super.tearDown()
		sut = nil
	}

	func test_onboardingViewControllerIsLoaded() {
		sut.loadViewIfNeeded()

		XCTAssert(sut.isViewLoaded)
	}

	func test_when_thirdPageButtonTapped_interactorPreparesRounting() {
		let interactor = OnboardingInteractorSpy()
		sut.interactor = interactor

		sut.thirdPageButtonTapped()

		XCTAssert(interactor.isPrepareRoutingTriggered)
	}

	func test_goToLogin_triggers_routerNavigation() {
		let router = OnboardingRouterSpy()
		let builder = LoginBuilder()
		sut.router = router

		sut.goToLogin(with: builder)

		XCTAssert(router.isNavigationTriggered)
	}

	func test_displayPage_displaysFirstOnboardingScreen() {
		let provider = OnboardingPagesProvider()
		let controller = provider.viewControllerList.first
		let viewModel = Onboarding.SceneStart.ViewModel(provider: provider, page: [controller])
		sut.displayPage(viewModel: viewModel)
		let result = sut.viewControllers?.first
		XCTAssert(result is FirstOnboardingScreen)
	}
}
