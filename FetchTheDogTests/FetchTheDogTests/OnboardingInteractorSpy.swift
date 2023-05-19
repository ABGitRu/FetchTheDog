//
//  OnboardingInteractorSpy.swift
//  FetchTheDogTests
//
//  Created by Mac on 13.05.2023.
//

import Foundation
@testable import FetchTheDog

final class OnboardingInteractorSpy: OnboardingInteractor {
	var isMakeSceneTriggered = false
	var isPrepareRoutingTriggered = false

	override func makeScene(request: Onboarding.SceneStart.Request) {
		isMakeSceneTriggered = true
	}

	override func prepareRouting(request: Onboarding.SceneEnding.Request) {
		isPrepareRoutingTriggered = true
	}
}
