//
//  LoginInteractor.swift
//  FetchTheDog
//
//  Created by Alexey Barinov on 12.05.2023.
//  Copyright (c) 2023 ABSoftware. All rights reserved.
//
//

import UIKit

protocol LoginBusinessLogic {
	func registerUser(request: Login.Register.Request)
	func loginUser(request: Login.Login.Request)
}

protocol LoginDataStore {
}

class LoginInteractor: LoginBusinessLogic, LoginDataStore {
	var presenter: LoginPresentationLogic?
	var worker: LoginWorker?

	func registerUser(request: Login.Register.Request) {
		worker = LoginWorker()
		if let result = worker?.registerUser(user: request.user) {
			let response = Login.Register.Response(result: result)
			presenter?.presentRegistrationResult(response: response)
		}
	}

	func loginUser(request: Login.Login.Request) {
		if worker == nil { worker = LoginWorker() }
		if let result = worker?.loginUser(user: request.user) {
			let response = Login.Login.Response(result: result)
			presenter?.presentLoginResult(response: Login.Login.Response(result: response.result))
		}
	}
}
