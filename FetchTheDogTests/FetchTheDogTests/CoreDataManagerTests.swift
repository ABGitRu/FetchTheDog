//
//  CoreDataManagerTests.swift
//  FetchTheDogTests
//
//  Created by Mac on 17.05.2023.
//

import XCTest
@testable import FetchTheDog

class CoreDataManagerTests: XCTestCase {
	var coreDataManager: ICoreDataManager!
	override func setUp() {
		super.setUp()
		coreDataManager = CoreDataManager()
		coreDataManager.deleteAllUsers()
	}

	override func tearDown() {
		coreDataManager = nil
		super.tearDown()
	}

	func testSaveUser() {
		let user = User(login: "john123", password: "password123")

		coreDataManager.saveUser(user)

		let users = coreDataManager.fetchUsers()

		XCTAssertEqual(users.count, 1)
		XCTAssertEqual(users.first?.login, "john123")
		XCTAssertEqual(users.first?.password, "password123")
	}

	func testFetchUsers() {
		let user1 = User(login: "john123", password: "password123")
		let user2 = User(login: "jane456", password: "password456")

		coreDataManager.saveUser(user1)
		coreDataManager.saveUser(user2)

		let users = coreDataManager.fetchUsers()

		XCTAssertEqual(users.count, 2)
		XCTAssertTrue(users.contains(where: { $0.login == "john123" && $0.password == "password123" }))
		XCTAssertTrue(users.contains(where: { $0.login == "jane456" && $0.password == "password456" }))
	}

//	func testDeleteAllUsers() {
//		let user1 = User(login: "john123", password: "password123")
//		let user2 = User(login: "jane456", password: "password456")
//
//		coreDataManager.saveUser(user1)
//		coreDataManager.saveUser(user2)
//
//		var users = coreDataManager.fetchUsers()
//		XCTAssertEqual(users.count, 2)
//
//		coreDataManager.deleteAllUsers()
//
//		users = coreDataManager.fetchUsers()
//		XCTAssertEqual(users.count, 0)
//	}

	func testFetchUsersEmpty() {
		let users = coreDataManager.fetchUsers()

		XCTAssertEqual(users.count, 0)
	}

	func testDeleteUserNonexistent() {
		let user1 = User(login: "john123", password: "password123")
		let user2 = User(login: "jane456", password: "password456")

		coreDataManager.saveUser(user1)

		var users = coreDataManager.fetchUsers()
		XCTAssertEqual(users.count, 1)

		coreDataManager.deleteUser(user2)

		users = coreDataManager.fetchUsers()
		XCTAssertEqual(users.count, 1)
		XCTAssertEqual(users.first?.login, "john123")
		XCTAssertEqual(users.first?.password, "password123")
	}
}
