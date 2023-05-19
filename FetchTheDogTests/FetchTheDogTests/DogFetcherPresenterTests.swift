//
//  DogFetcherPresenterTests.swift
//  FetchTheDogTests
//
//  Created by Mac on 19.05.2023.
//

import XCTest
@testable import FetchTheDog

final class DogFetcherPresenterTests: XCTestCase {

	var sut: DogFetcherPresenter!
	var controller: DogFetcherViewControllerSpy!

	override func setUp() {
		super.setUp()
		sut = DogFetcherPresenter()
		controller = DogFetcherViewControllerSpy()
		sut.viewController = controller
	}

	override func tearDown() {
		super.tearDown()
		sut = nil
		controller = nil
	}

	func test_presentDogFetchResult_DisplaysSuccessScenario() {
		sut.presentDogFetchResult(response: DogFetcher.Fetch.Response(response: .success(Data())))
		XCTAssert(controller.isSuccessScenarioDisplayed)
	}

	func test_presentDogFetchResult_DisplaysFailureScenario() {
		sut.presentDogFetchResult(
			response: DogFetcher.Fetch.Response(
				response: .failure(PossibleFetcherErrors.noImageData)))
		XCTAssert(controller.isFailureScenarioDisplayed)
	}
}
