//
//  DogFetcherModels.swift
//  FetchTheDog
//
//  Created by Alexey Barinov on 18.05.2023.
//  Copyright (c) 2023 ABSoftware. All rights reserved.
//
//

import UIKit

enum DogFetcher {
	// MARK: Use cases
	enum Fetch {
		struct Request {
		}
		struct Response {
			let response: Result<Data, Error>
		}
		struct SuccessViewModel {
			let data: Data
		}
		struct FailureViewModel {
			let error: PossibleFetcherErrors
		}
	}
}
