//
//  DogFetcherPresenter.swift
//  FetchTheDog
//
//  Created by Alexey Barinov on 18.05.2023.
//  Copyright (c) 2023 ABSoftware. All rights reserved.
//
//

import UIKit

protocol DogFetcherPresentationLogic {
	func presentDogFetchResult(response: DogFetcher.Fetch.Response)
}

class DogFetcherPresenter: DogFetcherPresentationLogic {
	weak var viewController: DogFetcherDisplayLogic?

	func presentDogFetchResult(response: DogFetcher.Fetch.Response) {
		switch response.response {
		case .success(let data):
			let viewModel = DogFetcher.Fetch.SuccessViewModel(data: data)
			viewController?.displaySuccessFetchScenario(viewModel: viewModel)
		case .failure(let error):
			if let error = error as? PossibleFetcherErrors {
				let viewModel = DogFetcher.Fetch.FailureViewModel(error: error)
				viewController?.displayFailureFetchScenario(viewModel: viewModel)
			}
		}

	}
}
