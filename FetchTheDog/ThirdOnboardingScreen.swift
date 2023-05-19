//
//  ThirdOnboardingScreen.swift
//  FetchTheDog
//
//  Created by Mac on 11.05.2023.
//

import UIKit

final class ThirdOnboardingScreen: UIViewController {

	var label: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .center
		label.numberOfLines = 0
		label.textColor = .white
		return label
	}()

	var showLoginFormButton: UIButton = {
		let button = UIButton(configuration: .bordered())
		button.backgroundColor = .lightGray
		button.setTitleColor(.white, for: .normal)
		button.translatesAutoresizingMaskIntoConstraints = false
		button.layer.cornerRadius = 12
		button.setTitle(L10n.Onboarding.ThirdPage.loginFormButton, for: .normal)
		return button
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		setupView()
	}

	@objc func showLoginFormButtonTapped() {
		let center = NotificationCenter.default
		center.post(name: AppNotification.name, object: nil)
	}

	private func setupView() {
		showLoginFormButton.addTarget(self, action: #selector(showLoginFormButtonTapped), for: .touchUpInside)
		label.text = L10n.Onboarding.ThirdPage.letsDive
		view.backgroundColor = .darkGray
		view.addSubview(label)
		view.addSubview(showLoginFormButton)
		NSLayoutConstraint.activate([
			label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
			label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
			label.centerYAnchor.constraint(equalTo: view.centerYAnchor),

			showLoginFormButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 32),
			showLoginFormButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			showLoginFormButton.heightAnchor.constraint(equalToConstant: 44),
			showLoginFormButton.widthAnchor.constraint(equalToConstant: 120)
		])
	}
}
