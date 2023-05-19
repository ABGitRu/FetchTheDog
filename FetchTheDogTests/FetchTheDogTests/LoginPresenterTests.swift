//
//  LoginPresenterTests.swift
//  FetchTheDogTests
//
//  Created by Mac on 18.05.2023.
//

import XCTest
@testable import FetchTheDog

final class LoginPresenterTests: XCTestCase {

	var sut: LoginPresenter!
	var viewController: LoginViewControllerSpy!

	override func setUp() {
		super.setUp()
		sut = LoginPresenter()
		viewController = LoginViewControllerSpy()
		sut.viewController = viewController
	}

	override func tearDown() {
		super.tearDown()
		sut = nil
	}

	func test_presentRegistrationResult_triggersDisplayOnViewController_whenResultIsSuccess() {
		sut.presentRegistrationResult(response: Login.Register.Response(result: .success))

		XCTAssert(viewController.isRegistrationResultDisplayed)
	}

	func test_presentRegistrationResult_triggersDisplayOnViewController_whenResultIsFailed() {
		sut.presentRegistrationResult(response: Login.Register.Response(result: .failed))

		XCTAssert(viewController.isRegistrationResultDisplayed)
	}

	func test_presentLoginResult_triggersDisplayOnViewController_whenResultIsSuccess() {
		sut.presentLoginResult(response: Login.Login.Response(result: .success))

		XCTAssert(viewController.isLoginResultDisplated)
	}

	func test_presentLoginResult_triggersDisplayOnViewController_whenResultIsFailed() {
		sut.presentLoginResult(response: Login.Login.Response(result: .failed))

		XCTAssert(viewController.isLoginResultDisplated)
	}

}
