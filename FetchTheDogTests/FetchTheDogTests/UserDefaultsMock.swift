//
//  UserDefaultsMock.swift
//  FetchTheDogTests
//
//  Created by Mac on 12.05.2023.
//

import Foundation
@testable import FetchTheDog

final class UserDefaultsMock: UserDefaults {
	var alreadyInBase = false
	var flow: FlowKeys = .onboardPassed
	override func bool(forKey defaultName: String) -> Bool {
		switch flow {
		case .onboardPassed:
			if defaultName == FlowKeys.onboardPassed.rawValue {
				return alreadyInBase
			}
			return false
		case .loginPassed:
			return alreadyInBase
		}
	}
}
