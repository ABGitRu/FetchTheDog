//
//  OnboardingInteractor.swift
//  FetchTheDog
//
//  Created by Alexey Barinov on 11.05.2023.
//  Copyright (c) 2023 ABSoftware. All rights reserved.
//
//

import UIKit

protocol OnboardingBusinessLogic {
	func makeScene(request: Onboarding.SceneStart.Request)
	func prepareRouting(request: Onboarding.SceneEnding.Request)
}

protocol OnboardingDataStore {
}

class OnboardingInteractor: OnboardingBusinessLogic, OnboardingDataStore {
	var presenter: OnboardingPresentationLogic?
	var worker: OnboardingWorker?
	// var name: String = ""

	// MARK: makeScene

	func makeScene(request: Onboarding.SceneStart.Request) {
		worker = OnboardingWorker()
		if let pagesProvider = worker?.pagesProvider {
			let response = Onboarding.SceneStart.Response(pagesProvider: pagesProvider)
			presenter?.presentPage(response: response)
		}
	}

	func prepareRouting(request: Onboarding.SceneEnding.Request) {
		worker = OnboardingWorker()
		if let builder = worker?.loginBulder {
			let response = Onboarding.SceneEnding.Response(builder: builder)
			presenter?.presentNextScene(response: response)
		}
	}
}
