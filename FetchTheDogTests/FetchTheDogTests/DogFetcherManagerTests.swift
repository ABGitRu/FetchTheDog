//
//  DogFetcherManagerTests.swift
//  FetchTheDogTests
//
//  Created by Mac on 18.05.2023.
//

import XCTest
@testable import FetchTheDog

class DogFetcherManagerTests: XCTestCase {
	var sut: DogFetcherManager!

	override func setUp() {
		super.setUp()
		sut = DogFetcherManager()
	}

	override func tearDown() {
		super.tearDown()
		sut = nil
	}

	func test_dogFetcherReceivesData() {
		setupMock()
		let json = """
{"message":"foo","status":"bar"}
"""
		let image = UIImage(systemName: "photo")
		MockURLProtocol.mockData["/api/breeds/image/random"] = json.data(using: .utf8)
		MockURLProtocol.mockData["foo"] = image?.pngData()
		let expectation = expectation(description: "Fetching")
		var expectedData: Data?
		var expectedError: Error?
		sut.fetchTheDog { result in
			switch result {
			case .success(let success):
				expectedData = success
			case .failure(let failure):
				expectedError = failure
			}
			expectation.fulfill()
			XCTAssertNotNil(expectedData)
			XCTAssertNil(expectedError)
		}
		waitForExpectations(timeout: 5)
	}

	func test_dogFetcherReceivesDecodeError() {
		setupMock()
		let json = """
{"message":"foo","staus":"bar"}
"""
		let image = UIImage(systemName: "photo")
		MockURLProtocol.mockData["/api/breeds/image/random"] = json.data(using: .utf8)
		MockURLProtocol.mockData["foo"] = image?.pngData()
		let expectation = expectation(description: "Fetching")
		var expectedData: Data?
		var expectedError: Error?
		sut.fetchTheDog { result in
			switch result {
			case .success(let success):
				expectedData = success
			case .failure(let failure):
				expectedError = failure
			}
			expectation.fulfill()
			XCTAssertNil(expectedData)
			XCTAssertNotNil(expectedError)
			if let error = expectedError as? PossibleFetcherErrors {
				XCTAssert(error == .canNotDecodeData)
			}
		}
		waitForExpectations(timeout: 5)
	}

	func test_dogFetcherReceivesErrorWhenDataIsNil() {
		setupMock()
		MockURLProtocol.mockData["/api/breeds/image/random"] = nil
		let expectation = expectation(description: "Fetching")
		var expectedData: Data?
		var expectedError: Error?
		sut.fetchTheDog { result in
			switch result {
			case .success(let success):
				expectedData = success
			case .failure(let failure):
				expectedError = failure
			}
			expectation.fulfill()
			XCTAssertNil(expectedData)
			XCTAssertNotNil(expectedError)
		}
		waitForExpectations(timeout: 5)
	}

	func test_dogFetcherReceivesError_noImageData() {
		setupMock()
		let json = """
{"message":"foo","status":"bar"}
"""
		var image = UIImage(systemName: "photo")
		image = nil
		MockURLProtocol.mockData["/api/breeds/image/random"] = json.data(using: .utf8)
		MockURLProtocol.mockData["foo"] = image?.pngData()
		let expectation = expectation(description: "Fetching")
		var expectedData: Data?
		var expectedError: Error?
		sut.fetchTheDog { result in
			switch result {
			case .success(let success):
				expectedData = success
			case .failure(let failure):
				expectedError = failure
			}
			expectation.fulfill()
			XCTAssertNil(expectedData)
			XCTAssertNotNil(expectedError)
			if let error = expectedError as? PossibleFetcherErrors {
				XCTAssert(error == .noImageData)
			}
		}
		waitForExpectations(timeout: 5)
	}

	private func setupMock() {
		URLProtocol.registerClass(MockURLProtocol.self)
		let configurationWithMock = URLSessionConfiguration.default
		configurationWithMock.protocolClasses?.insert(MockURLProtocol.self, at: 0)
		let session = URLSession(configuration: configurationWithMock)
		sut.session = session
	}
}
