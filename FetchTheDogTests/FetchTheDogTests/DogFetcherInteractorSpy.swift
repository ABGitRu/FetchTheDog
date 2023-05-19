//
//  DogFetcherInteractorSpy.swift
//  FetchTheDogTests
//
//  Created by Mac on 18.05.2023.
//

import Foundation
@testable import FetchTheDog

final class DogFetcherInteractorSpy: DogFetcherInteractor {
	var isFetchTheDogFlowStarted = false
	override func fetchTheDog(request: DogFetcher.Fetch.Request) {
		isFetchTheDogFlowStarted = true
	}
}
