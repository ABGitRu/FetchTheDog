//
//  LoginViewControllerTests.swift
//  FetchTheDogTests
//
//  Created by Mac on 18.05.2023.
//

import XCTest
@testable import FetchTheDog
final class LoginViewControllerTests: XCTestCase {

	var sut: LoginViewController!
	var view: LoginView!
	var interactorSpy: LoginInteractorSpy!

	override func setUp() {
		super.setUp()
		interactorSpy = LoginInteractorSpy()
		sut = LoginViewController()
		sut.interactor = interactorSpy
		view = LoginView()
		sut.mainView = view
	}

	override func tearDown() {
		super.tearDown()
		sut = nil
		view = nil
	}

	func test_displayRegistrationResult_showsSuccessAlert() {
		sut.loadViewIfNeeded()

		let window = UIWindow(frame: UIScreen.main.bounds)
		window.rootViewController = sut
		window.makeKeyAndVisible()

		sut.displayRegistrationResult(viewModel: Login.Register.ViewModel(status: .success))

		let presentedViewController = sut.presentedViewController as? UIAlertController
		XCTAssert(presentedViewController?.title == L10n.Login.registrationSuccessAlertTitle)
		XCTAssert(presentedViewController?.message == L10n.Login.registrationSuccessAlertMessage)
	}

	func test_displayRegistrationResult_showsFailedAlert() {
		sut.loadViewIfNeeded()

		let window = UIWindow(frame: UIScreen.main.bounds)
		window.rootViewController = sut
		window.makeKeyAndVisible()

		sut.displayRegistrationResult(viewModel: Login.Register.ViewModel(status: .fail))

		let presentedViewController = sut.presentedViewController as? UIAlertController
		XCTAssert(presentedViewController?.title == L10n.Login.registrationFailAlertTitle)
		XCTAssert(presentedViewController?.message == L10n.Login.registrationFailAlertMessage)
	}

	func test_registerButtonTapped_triggersInteractor() {
		sut.loadViewIfNeeded()
		sut.mainView?.loginTextField.text = "foo"
		sut.mainView?.passwordTextField.text = "bar"
		sut.registerButtonTapped()

		XCTAssert(interactorSpy.wasUserRegistrationStarted)
	}

	func test_loginButtonTapped_triggersInteractor() {
		sut.loadViewIfNeeded()
		sut.mainView?.loginTextField.text = "foo"
		sut.mainView?.passwordTextField.text = "bar"
		sut.loginButtonTapped()

		XCTAssert(interactorSpy.wasUserLogingInStarted)
	}

	func test_displayLoginResult_showsFailedAlert() {
		sut.loadViewIfNeeded()

		let window = UIWindow(frame: UIScreen.main.bounds)
		window.rootViewController = sut
		window.makeKeyAndVisible()

		sut.displayLoginResult(viewModel: Login.Login.ViewModel(status: .fail))

		let presentedViewController = sut.presentedViewController as? UIAlertController
		XCTAssert(presentedViewController?.title == L10n.Login.loginFailAlertTitle)
		XCTAssert(presentedViewController?.message == L10n.Login.loginFailAlertMessage)
	}

	func test_displayLoginResult_showsSuccessAlertTriggersRouter() {
		let router = LoginRouterSpy()
		sut.router = router
		sut.displayLoginResult(viewModel: Login.Login.ViewModel(status: .success))

		XCTAssert(router.isNavigationTriggered)
	}

	func test_goToDogFetcher_TriggersRouter() {
		let router = LoginRouterSpy()
		sut.router = router
		sut.goToDogFetcher(with: DogFetcherBuilder())

		XCTAssert(router.isNavigationTriggered)
	}

}
