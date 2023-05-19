//
//  DogFetcherInteractor.swift
//  FetchTheDog
//
//  Created by Alexey Barinov on 18.05.2023.
//  Copyright (c) 2023 ABSoftware. All rights reserved.
//
//

import UIKit

protocol DogFetcherBusinessLogic {
	func fetchTheDog(request: DogFetcher.Fetch.Request)
}

protocol DogFetcherDataStore {
}

class DogFetcherInteractor: DogFetcherBusinessLogic, DogFetcherDataStore {
	var presenter: DogFetcherPresentationLogic?
	var worker: DogFetcherWorker?

	func fetchTheDog(request: DogFetcher.Fetch.Request) {
		if worker == nil { worker = DogFetcherWorker() }
		worker?.fetchTheDog(completion: { [weak self] result in
			let response = DogFetcher.Fetch.Response(response: result)
			self?.presenter?.presentDogFetchResult(response: response)
		})
	}
}
