//
//  DogFetcherWorkerTests.swift
//  FetchTheDogTests
//
//  Created by Mac on 19.05.2023.
//

import XCTest
@testable import FetchTheDog

class DogFetcherWorkerTests: XCTestCase {
	var sut: DogFetcherWorker!
	var dogFetcherManagerMock: DogFetcherManagerMock!

	override func setUp() {
		super.setUp()
		sut = DogFetcherWorker()
		dogFetcherManagerMock = DogFetcherManagerMock()
		sut.fetcherManager = dogFetcherManagerMock
	}

	override func tearDown() {
		super.tearDown()
		sut = nil
	}

	func test_fetchTheDogReturnsDataInCompletionBlock() {
		dogFetcherManagerMock.returnData = true
		sut.fetchTheDog { result in
			switch result {
			case .success(let success):
				XCTAssertNotNil(success)
			case .failure(let failure):
				XCTAssertNil(failure)
			}
		}
	}

	func test_fetchTheDogReturnsErrorInCompletionBlock() {
		dogFetcherManagerMock.returnData = false
		sut.fetchTheDog { result in
			switch result {
			case .success(let success):
				XCTAssertNil(success)
			case .failure(let failure):
				XCTAssertNotNil(failure)
			}
		}
	}
}
