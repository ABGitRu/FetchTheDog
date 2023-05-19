//
//  DogFetcherRouter.swift
//  FetchTheDog
//
//  Created by Alexey Barinov on 18.05.2023.
//  Copyright (c) 2023 ABSoftware. All rights reserved.
//
//

import UIKit

@objc protocol DogFetcherRoutingLogic {
}

protocol DogFetcherDataPassing {
	var dataStore: DogFetcherDataStore? { get }
}

class DogFetcherRouter: NSObject, DogFetcherRoutingLogic, DogFetcherDataPassing {
	weak var viewController: DogFetcherViewController?
	var dataStore: DogFetcherDataStore?
}
