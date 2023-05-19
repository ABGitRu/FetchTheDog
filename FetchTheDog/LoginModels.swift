//
//  LoginModels.swift
//  FetchTheDog
//
//  Created by Alexey Barinov on 12.05.2023.
//  Copyright (c) 2023 ABSoftware. All rights reserved.
//
//

import UIKit

enum Login {
	// MARK: Use cases
	enum Register {
		struct Request {
			let user: User
		}
		struct Response {
			let result: RegistrationResult
		}
		struct ViewModel {
			let status: RegistrationStatus
		}
	}

	enum Login {
		struct Request {
			let user: User
		}
		struct Response {
			let result: LoginResult
		}
		struct ViewModel {
			let status: LoginStatus
		}
	}
}
