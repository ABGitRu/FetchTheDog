//
//  DogFetcherViewControllerSpy.swift
//  FetchTheDogTests
//
//  Created by Mac on 18.05.2023.
//

import Foundation
@testable import FetchTheDog

final class DogFetcherViewControllerSpy: DogFetcherViewController {
	var isSuccessScenarioDisplayed = false
	var isFailureScenarioDisplayed = false
	override func displaySuccessFetchScenario(viewModel: DogFetcher.Fetch.SuccessViewModel) {
		isSuccessScenarioDisplayed = true
	}

	override func displayFailureFetchScenario(viewModel: DogFetcher.Fetch.FailureViewModel) {
		isFailureScenarioDisplayed = true
	}
}
