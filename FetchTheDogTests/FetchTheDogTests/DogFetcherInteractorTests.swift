//
//  DogFetcherInteractorTests.swift
//  FetchTheDogTests
//
//  Created by Mac on 19.05.2023.
//

import XCTest
@testable import FetchTheDog

final class DogFetcherInteractorTests: XCTestCase {

	var sut: DogFetcherInteractor!
	var presenter: DogFetcherPresenterSpy!

	override func setUp() {
		super.setUp()
		sut = DogFetcherInteractor()
		presenter = DogFetcherPresenterSpy()
		sut.worker = DogFetcherWorkerMock()
		sut.presenter = presenter
	}

	override func tearDown() {
		super.tearDown()
		sut = nil
	}

	func test_fetchTheDog_triggersPresenter_toPresentResultOfFetching() {
		sut.fetchTheDog(request: DogFetcher.Fetch.Request())
		XCTAssert(presenter.isResultPresented)
	}
}
