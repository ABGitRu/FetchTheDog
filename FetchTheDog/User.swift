//
//  User.swift
//  FetchTheDog
//
//  Created by Mac on 14.05.2023.
//

import Foundation

struct User {
	let login: String
	let password: String
}

extension User: Comparable {
	static func < (lhs: User, rhs: User) -> Bool {
		if lhs.login < rhs.login {
			return true
		}
		return false
	}

	static func == (lhs: User, rhs: User) -> Bool {
		if lhs.login == rhs.login && lhs.password == rhs.password {
			return true
		}
		return false
	}
}
