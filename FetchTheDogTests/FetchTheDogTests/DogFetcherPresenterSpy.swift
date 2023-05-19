//
//  DogFetcherPresenterSpy.swift
//  FetchTheDogTests
//
//  Created by Mac on 18.05.2023.
//

import Foundation
@testable import FetchTheDog

final class DogFetcherPresenterSpy: DogFetcherPresenter {
	var isResultPresented = false
	override func presentDogFetchResult(response: DogFetcher.Fetch.Response) {
		isResultPresented = true
	}
}
