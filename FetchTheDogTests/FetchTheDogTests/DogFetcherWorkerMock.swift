//
//  DogFetcherWorkerMock.swift
//  FetchTheDogTests
//
//  Created by Mac on 19.05.2023.
//

import Foundation
@testable import FetchTheDog

final class DogFetcherWorkerMock: DogFetcherWorker {
	override func fetchTheDog(completion: @escaping (Result<Data, Error>) -> Void) {
		completion(.success(Data()))
	}
}
