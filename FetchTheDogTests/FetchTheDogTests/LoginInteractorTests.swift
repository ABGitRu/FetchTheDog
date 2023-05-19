//
//  LoginInteractorTests.swift
//  FetchTheDogTests
//
//  Created by Mac on 18.05.2023.
//

import XCTest
@testable import FetchTheDog

final class LoginInteractorTests: XCTestCase {

	var sut: LoginInteractor!
	var presenter: LoginPresenterSpy!

	override func setUp() {
		super.setUp()
		sut = LoginInteractor()
		presenter = LoginPresenterSpy()
		sut.presenter = presenter
	}

	override func tearDown() {
		super.tearDown()
		sut = nil
		presenter = nil
	}

	func test_registerUser_passesFailedStatus() {
		sut.registerUser(request: Login.Register.Request(user: User(login: "foo", password: "bar")))

		XCTAssert(presenter.registrationStatus == .failed)
	}

	func test_registerUser_passesSuccessStatus_whenLoginAndPassword_hasMoreThan4Char() {
		sut.registerUser(request: Login.Register.Request(user: User(login: "foo12", password: "bar12")))

		XCTAssert(presenter.registrationStatus == .success)
	}

	func test_loginUser_passesFailStatus() {
		sut.loginUser(request: Login.Login.Request(user: User(login: "foo", password: "bar")))

		XCTAssert(presenter.loginStatus == .failed)
	}

	func test_loginUser_passesSuccessStatus() {
		sut.worker = LoginWorkerMock()
		sut.loginUser(request: Login.Login.Request(user: User(login: "foo12", password: "bar12")))

		XCTAssert(presenter.loginStatus == .success)
	}
}
