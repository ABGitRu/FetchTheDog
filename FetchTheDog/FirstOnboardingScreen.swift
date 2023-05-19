//
//  FirstOnboardingScreen.swift
//  FetchTheDog
//
//  Created by Mac on 11.05.2023.
//

import UIKit

final class FirstOnboardingScreen: UIViewController {

	var label: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .center
		label.textColor = .white
		label.numberOfLines = 0
		label.text = L10n.Onboarding.FirstPage.welcome
		return label
	}()
	override func viewDidLoad() {
		super.viewDidLoad()
		setupView()
	}

	private func setupView() {
		view.backgroundColor = .darkGray
		view.addSubview(label)
		NSLayoutConstraint.activate([
			label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
			label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
			label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
		])
	}
}
