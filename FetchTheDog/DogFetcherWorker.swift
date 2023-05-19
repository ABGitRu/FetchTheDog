//
//  DogFetcherWorker.swift
//  FetchTheDog
//
//  Created by Alexey Barinov on 18.05.2023.
//  Copyright (c) 2023 ABSoftware. All rights reserved.
//
//

import UIKit

class DogFetcherWorker {
	var fetcherManager: IDogFetcherManager = DogFetcherManager()

	func fetchTheDog(completion: @escaping (Result<Data, Error>) -> Void) {
		fetcherManager.fetchTheDog { result in
			completion(result)
		}
	}
}
