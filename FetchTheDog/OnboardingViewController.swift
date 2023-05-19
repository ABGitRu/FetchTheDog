//
//  OnboardingViewController.swift
//  FetchTheDog
//
//  Created by Alexey Barinov on 11.05.2023.
//  Copyright (c) 2023 ABSoftware. All rights reserved.
//
//

import UIKit

protocol OnboardingDisplayLogic: AnyObject {
	func displayPage(viewModel: Onboarding.SceneStart.ViewModel)
	func goToLogin(with builder: LoginIBuilder)
}

class OnboardingViewController: UIPageViewController, OnboardingDisplayLogic {
	var interactor: OnboardingBusinessLogic?
	var router: (NSObjectProtocol & OnboardingRoutingLogic & OnboardingDataPassing)?
	// MARK: Object lifecycle

	override init(
		transitionStyle style: UIPageViewController.TransitionStyle,
		navigationOrientation: UIPageViewController.NavigationOrientation,
		options: [UIPageViewController.OptionsKey : Any]? = nil) {
		super.init(transitionStyle: style, navigationOrientation: navigationOrientation)
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}

	// MARK: View lifecycle

	override func viewDidLoad() {
		super.viewDidLoad()
		startScene()
	}

	func startScene() {
		NotificationCenter.default.addObserver(
			self,
			selector: #selector(thirdPageButtonTapped),
			name: AppNotification.name,
			object: nil)
		let request = Onboarding.SceneStart.Request()
		interactor?.makeScene(request: request)
	}

	@objc func thirdPageButtonTapped() {
		interactor?.prepareRouting(request: Onboarding.SceneEnding.Request())
	}

	func displayPage(viewModel: Onboarding.SceneStart.ViewModel) {
		view.backgroundColor = .darkGray
		dataSource = viewModel.provider
		let page = viewModel.page.compactMap { $0 }
		setViewControllers(page, direction: .forward, animated: true)
	}

	func goToLogin(with builder: LoginIBuilder) {
		router?.navigateToLogin(source: self, destination: builder.build(), animated: true)
	}
}
