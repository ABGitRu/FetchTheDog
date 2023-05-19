//
//  UserTests.swift
//  FetchTheDogTests
//
//  Created by Mac on 18.05.2023.
//

import XCTest
@testable import FetchTheDog

final class UserTests: XCTestCase {

	var sut: User!

	override func setUp() {
		super.setUp()
		sut = User(login: "foo", password: "bar")
	}
	override func tearDown() {
		super.tearDown()
		sut = nil
	}

	func test_compareLessReturnsCorrectResult() {
		let comparableUser = User(login: "baz", password: "foo")

		XCTAssert(comparableUser < sut)
	}

	func test_compareLessReturnsCorrectOppositeResult() {
		let comparableUser = User(login: "baz", password: "foo")

		XCTAssertFalse(sut < comparableUser)
	}

	func test_compareEqualReturnsCorrectOppositeResult() {
		let comparableUser = User(login: "baz", password: "foo")

		XCTAssertFalse(sut == comparableUser)
	}

	func test_compareEqualReturnsCorrectResult() {
		let comparableUser = User(login: "foo", password: "bar")

		XCTAssert(sut == comparableUser)
	}
}
