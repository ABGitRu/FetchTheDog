//
//  CoreDataManagerMock.swift
//  FetchTheDogTests
//
//  Created by Mac on 17.05.2023.
//

import Foundation
@testable import FetchTheDog

final class CoreDataManagerMock: ICoreDataManager {
	var users: [User] = []

	func saveUser(_ user: FetchTheDog.User) {
		users.append(user)
	}

	func fetchUsers() -> [FetchTheDog.User] {
		users
	}

	func deleteUser(_ user: FetchTheDog.User) {
		var index = -1
		for userAccount in users {
			index += 1
			if userAccount == user {
				users.remove(at: index)
			}
		}
	}

	func deleteAllUsers() {
		users.removeAll()
	}

}
