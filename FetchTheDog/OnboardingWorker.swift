//
//  OnboardingWorker.swift
//  FetchTheDog
//
//  Created by Alexey Barinov on 11.05.2023.
//  Copyright (c) 2023 ABSoftware. All rights reserved.
//
//

import UIKit

class OnboardingWorker {
	var pagesProvider: IOnboardingPagesProvider? = OnboardingPagesProvider()

	var loginBulder: LoginIBuilder = LoginBuilder()
}
