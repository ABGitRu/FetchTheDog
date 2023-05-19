//
//  OnboardingModels.swift
//  FetchTheDog
//
//  Created by Alexey Barinov on 11.05.2023.
//  Copyright (c) 2023 ABSoftware. All rights reserved.
//
//

import UIKit

enum Onboarding {
	// MARK: SceneStart
	enum SceneStart {
		struct Request {
		}
		struct Response {
			let pagesProvider: IOnboardingPagesProvider
		}
		struct ViewModel {
			let provider: IOnboardingPagesProvider
			let page: [UIViewController?]
		}
	}
	// MARK: SceneEnding
	enum SceneEnding {
		struct Request {}
		struct Response {
			let builder: LoginIBuilder
		}
		struct ViewModel {}
	}
}
