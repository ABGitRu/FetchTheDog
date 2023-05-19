//
//  URLSessionMock.swift
//  FetchTheDogTests
//
//  Created by Mac on 18.05.2023.
//

import Foundation

class MockURLProtocol: URLProtocol {

	static var mockData = [String: Data]()

	override class func canInit(with task: URLSessionTask) -> Bool {
		true
	}

	override class func canInit(with request: URLRequest) -> Bool {
		true
	}

	override class func canonicalRequest(for request: URLRequest) -> URLRequest {
		request
	}

	override func startLoading() {
		enum CustomError: Error {
			case noData
		}
		if let url = request.url {
			let path: String
			if let queryString = url.query {
				path = url.relativePath + "?" + queryString
			} else {
				path = url.relativePath
			}
			if let data = MockURLProtocol.mockData[path] {
				client?.urlProtocol(self, didLoad: data)
				client?.urlProtocol(self, didReceive: HTTPURLResponse(), cacheStoragePolicy: .allowed)
			} else {
				client?.urlProtocol(self, didFailWithError: CustomError.noData)
			}
		}
		client?.urlProtocolDidFinishLoading(self)
	}

	override func stopLoading() {}

}
