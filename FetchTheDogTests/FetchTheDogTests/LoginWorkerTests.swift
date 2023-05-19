//
//  LoginWorkerTests.swift
//  FetchTheDogTests
//
//  Created by Mac on 17.05.2023.
//

import XCTest
@testable import FetchTheDog

final class LoginWorkerTests: XCTestCase {

	var sut: LoginWorker!

	override func setUp() {
		super.setUp()
		sut = LoginWorker()
	}
	override func tearDown() {
		super.tearDown()
		sut = nil
	}

	func testRegisterUserSavesUser() {
		sut.coreDataManager = CoreDataManagerMock()
		sut.registerUser(user: User(login: "foo12", password: "bar12"))
		let users = sut.coreDataManager.fetchUsers()

		XCTAssert(users.first?.login == "foo12")
		XCTAssert(users.first?.password == "bar12")
	}

	func testRegisterUserDontSavesUserAndResultIsFailed() {
		sut.coreDataManager = CoreDataManagerMock()
		let result = sut.registerUser(user: User(login: "foo", password: "bar"))
		XCTAssert(result == .failed)
	}

	func testRegisterUserSavesUserAndResultIsSuccess() {
		sut.coreDataManager = CoreDataManagerMock()
		let result = sut.registerUser(user: User(login: "foo12", password: "bar12"))
		XCTAssert(result == .success)
	}

	func testLoginUserSucceded() {
		sut.coreDataManager = CoreDataManagerMock()
		sut.registerUser(user: User(login: "foo12", password: "bar12"))

		let result = sut.loginUser(user: User(login: "foo12", password: "bar12"))
		XCTAssert(result == .success)
	}

	func testLoginUserFailed() {
		sut.coreDataManager = CoreDataManagerMock()
		sut.registerUser(user: User(login: "foo12", password: "bar12"))

		let result = sut.loginUser(user: User(login: "foo", password: "bar"))
		XCTAssert(result == .failed)
	}

	func testLoginUserFailedWhenThereIsNoUsers() {
		sut.coreDataManager = CoreDataManagerMock()

		let result = sut.loginUser(user: User(login: "foo", password: "bar"))
		let result2 = sut.loginUser(user: User(login: "foo12", password: "bar12"))
		XCTAssert(result == .failed)
		XCTAssert(result2 == .failed)
	}
}
