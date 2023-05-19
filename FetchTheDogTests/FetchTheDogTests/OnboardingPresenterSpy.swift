//
//  OnboardingPresenterSpy.swift
//  FetchTheDogTests
//
//  Created by Mac on 12.05.2023.
//

import Foundation
@testable import FetchTheDog

final class OnboardingPresenterSpy: OnboardingPresenter {
	var isPresentPageTriggered = false
	var isPresentNextSceneTriggered = false

	override func presentPage(response: Onboarding.SceneStart.Response) {
		isPresentPageTriggered = true
	}

	override func presentNextScene(response: Onboarding.SceneEnding.Response) {
		isPresentNextSceneTriggered = true
	}
}
