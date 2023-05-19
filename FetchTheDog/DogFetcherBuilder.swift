//
//  DogFetcherBuilder.swift
//  FetchTheDog
//
//  Created by Alexey Barinov on 18.05.2023.
//  Copyright (c) 2023 ABSoftware. All rights reserved.
//
//

import UIKit

protocol DogFetcherIBuilder: AnyObject {
	func build() -> DogFetcherViewController
}

class DogFetcherBuilder: DogFetcherIBuilder {

	func build() -> DogFetcherViewController {
		let viewController = DogFetcherViewController()
		let interactor = DogFetcherInteractor()
		let presenter = DogFetcherPresenter()
		let router = DogFetcherRouter()
		let view = DogFetcherView()
		viewController.interactor = interactor
		viewController.router = router
		viewController.mainView = view
		interactor.presenter = presenter
		presenter.viewController = viewController
		router.viewController = viewController
		router.dataStore = interactor
		return viewController
	}
}
