//
//  DogFetcherView.swift
//  FetchTheDog
//
//  Created by Alexey Barinov on 18.05.2023.
//  Copyright (c) 2023 ABSoftware. All rights reserved.
//
//

import UIKit

class DogFetcherView: UIView {

	var dogImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.image = UIImage(systemName: "photo")
		return imageView
	}()

	var fetchDogButton: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setTitle(L10n.DogFetcher.fetchDogButtonTitle, for: .normal)
		button.backgroundColor = .green
		button.layer.cornerRadius = 12
		return button
	}()

	override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = .white
		setupView()
		setupButtonsTargets()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func setupView() {
		addSubview(dogImageView)
		addSubview(fetchDogButton)

		NSLayoutConstraint.activate([
			dogImageView.topAnchor.constraint(equalTo: topAnchor, constant: 44),
			dogImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
			dogImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
			dogImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3),

			fetchDogButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -44),
			fetchDogButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
			fetchDogButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
			fetchDogButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.05)
		])
	}

	private func setupButtonsTargets() {
		fetchDogButton.addTarget(
			nil,
			action: #selector(DogFetcherViewController.fetchDogTapped),
			for: .touchUpInside)
	}
}
