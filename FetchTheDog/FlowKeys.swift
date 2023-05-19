//
//  FlowKeys.swift
//  FetchTheDog
//
//  Created by Mac on 12.05.2023.
//

import Foundation

enum FlowKeys: String {
	case onboardPassed
	case loginPassed

	var key: String {
		self.rawValue
	}
}
