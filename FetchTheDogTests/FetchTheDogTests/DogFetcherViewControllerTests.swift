//
//  DogFetcherViewControllerTests.swift
//  FetchTheDogTests
//
//  Created by Mac on 18.05.2023.
//

import XCTest
@testable import FetchTheDog

final class DogFetcherViewControllerTests: XCTestCase {

	var sut: DogFetcherViewController!
	var interactor: DogFetcherInteractorSpy!

	override func setUp() {
		super.setUp()
		sut = DogFetcherViewController()
		interactor = DogFetcherInteractorSpy()
		sut.interactor = interactor
	}

	override func tearDown() {
		super.tearDown()
		sut = nil
		interactor = nil
	}

	func test_fetchDogTapped_triggersFethingFlow() {
		sut.fetchDogTapped()

		XCTAssert(interactor.isFetchTheDogFlowStarted)
	}

	func test_displaySuccessFetchScenario_changesImage() {
		let expectation = XCTestExpectation(description: "Ставим картинку")
		let image = UIImage(systemName: "lane")
		guard let imageData = image?.pngData() else { XCTFail("image need to be generated"); return }
		sut.mainView = DogFetcherView(frame: .zero)
		sut.mainView?.dogImageView.image = nil

		sut.displaySuccessFetchScenario(viewModel: DogFetcher.Fetch.SuccessViewModel(data: imageData))

		DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
			XCTAssertNotNil(self.sut.mainView)
			XCTAssertNotNil(self.sut.mainView?.dogImageView.image)
			expectation.fulfill()
		}

		wait(for: [expectation], timeout: 5)
	}

	func test_displayFailureFetchScenario_noImageData_showsAlert() {
		setupForAlertTests()
		sut.displayFailureFetchScenario(viewModel: DogFetcher.Fetch.FailureViewModel(error: .noImageData))

		let presentedViewController = sut.presentedViewController as? UIAlertController
		XCTAssert(presentedViewController?.title == L10n.DogFetcher.FetchFailureAlert.noImageDataTitle)
		XCTAssert(presentedViewController?.message == L10n.DogFetcher.FetchFailureAlert.noImageDataMessage)
	}

	func test_displayFailureFetchScenario_canNotCreateURL_showsAlert() {
		setupForAlertTests()
		sut.displayFailureFetchScenario(viewModel: DogFetcher.Fetch.FailureViewModel(error: .canNotCreateURL))

		let presentedViewController = sut.presentedViewController as? UIAlertController
		XCTAssert(presentedViewController?.title == L10n.DogFetcher.FetchFailureAlert.сanNotCreateURLTitle)
		XCTAssert(presentedViewController?.message == L10n.DogFetcher.FetchFailureAlert.сanNotCreateURLMessage)
	}

	func test_displayFailureFetchScenario_canNotLoadImage_showsAlert() {
		setupForAlertTests()
		sut.displayFailureFetchScenario(viewModel: DogFetcher.Fetch.FailureViewModel(error: .canNotLoadImage))

		let presentedViewController = sut.presentedViewController as? UIAlertController
		XCTAssert(presentedViewController?.title == L10n.DogFetcher.FetchFailureAlert.noDogsDataTitle)
		XCTAssert(presentedViewController?.message == L10n.DogFetcher.FetchFailureAlert.noDogsDataMessage)
	}

	func test_displayFailureFetchScenario_canNotDecodeData_showsAlert() {
		setupForAlertTests()
		sut.displayFailureFetchScenario(viewModel: DogFetcher.Fetch.FailureViewModel(error: .canNotDecodeData))

		let presentedViewController = sut.presentedViewController as? UIAlertController
		XCTAssert(presentedViewController?.title == L10n.DogFetcher.FetchFailureAlert.noDogsDataTitle)
		XCTAssert(presentedViewController?.message == L10n.DogFetcher.FetchFailureAlert.noDogsDataMessage)
	}

	func test_displayFailureFetchScenario_noDogsData_showsAlert() {
		setupForAlertTests()
		sut.displayFailureFetchScenario(viewModel: DogFetcher.Fetch.FailureViewModel(error: .noDogsData))

		let presentedViewController = sut.presentedViewController as? UIAlertController
		XCTAssert(presentedViewController?.title == L10n.DogFetcher.FetchFailureAlert.noDogsDataTitle)
		XCTAssert(presentedViewController?.message == L10n.DogFetcher.FetchFailureAlert.noDogsDataMessage)
	}

	private func setupForAlertTests() {
		sut.loadViewIfNeeded()
		sut.mainView = DogFetcherView(frame: .zero)
		let window = UIWindow(frame: UIScreen.main.bounds)
		window.rootViewController = sut
		window.makeKeyAndVisible()
	}
}
