//
//  SecondOnboardingScreen.swift
//  FetchTheDog
//
//  Created by Mac on 11.05.2023.
//

import UIKit

final class SecondOnboardingScreen: UIViewController {
	var label: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .center
		label.numberOfLines = 0
		label.textColor = .white
		label.text = L10n.Onboarding.SecondPage.about
		return label
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		setupView()
	}

	private func setupView() {
		view.backgroundColor = #colorLiteral(red: 0.07862693816, green: 0.08271663636, blue: 0.07506420463, alpha: 0.8470588235)
		view.addSubview(label)
		NSLayoutConstraint.activate([
			label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
			label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
			label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
		])
	}
}
