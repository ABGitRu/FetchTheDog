//
//  DogFetcherManagerMock.swift
//  FetchTheDogTests
//
//  Created by Mac on 19.05.2023.
//

import Foundation
@testable import FetchTheDog

final class DogFetcherManagerMock: IDogFetcherManager {
	var returnData = true
	func fetchTheDog(completion: @escaping (Result<Data, Error>) -> Void) {
		if returnData {
			let fakeData = Data()
			let result: Result<Data, Error> = .success(fakeData)
			completion(result)
		} else {
			let error = NSError(domain: "com.example.fetchTheDog", code: 0, userInfo: nil)
			let result: Result<Data, Error> = .failure(error)
			completion(result)
		}
	}
}
