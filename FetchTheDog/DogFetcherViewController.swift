//
//  DogFetcherViewController.swift
//  FetchTheDog
//
//  Created by Alexey Barinov on 18.05.2023.
//  Copyright (c) 2023 ABSoftware. All rights reserved.
//
//

import UIKit

protocol DogFetcherDisplayLogic: AnyObject {
	func displaySuccessFetchScenario(viewModel: DogFetcher.Fetch.SuccessViewModel)
	func displayFailureFetchScenario(viewModel: DogFetcher.Fetch.FailureViewModel)
}

class DogFetcherViewController: UIViewController, DogFetcherDisplayLogic {
	var interactor: DogFetcherBusinessLogic?
	var router: (NSObjectProtocol & DogFetcherRoutingLogic & DogFetcherDataPassing)?
	var mainView: DogFetcherView?
	// MARK: Object lifecycle

	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}

	// MARK: View lifecycle

	override func loadView() {
		view = mainView
	}

	func displaySuccessFetchScenario(viewModel: DogFetcher.Fetch.SuccessViewModel) {
		DispatchQueue.main.async { [weak self] in
			self?.mainView?.dogImageView.image = UIImage(data: viewModel.data)
		}
	}

	func displayFailureFetchScenario(viewModel: DogFetcher.Fetch.FailureViewModel) {
		switch viewModel.error {
		case .noImageData:
			showFailureFetchAlert(
				title: L10n.DogFetcher.FetchFailureAlert.noImageDataTitle,
				message: L10n.DogFetcher.FetchFailureAlert.noImageDataMessage)
		case .canNotCreateURL:
			showFailureFetchAlert(
				title: L10n.DogFetcher.FetchFailureAlert.сanNotCreateURLTitle,
				message: L10n.DogFetcher.FetchFailureAlert.сanNotCreateURLMessage)
		case .noDogsData:
			showFailureFetchAlert(
				title: L10n.DogFetcher.FetchFailureAlert.noDogsDataTitle,
				message: L10n.DogFetcher.FetchFailureAlert.noDogsDataMessage)
		case .canNotLoadImage:
			showFailureFetchAlert(
				title: L10n.DogFetcher.FetchFailureAlert.noDogsDataTitle,
				message: L10n.DogFetcher.FetchFailureAlert.noDogsDataMessage)
		case .canNotDecodeData:
			showFailureFetchAlert(
				title: L10n.DogFetcher.FetchFailureAlert.noDogsDataTitle,
				message: L10n.DogFetcher.FetchFailureAlert.noDogsDataMessage)
		}
	}

	@objc func fetchDogTapped() {
		let request = DogFetcher.Fetch.Request()
		interactor?.fetchTheDog(request: request)
	}

	private func showFailureFetchAlert(title: String, message: String) {
		let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
		let okAction = UIAlertAction(
			title: L10n.DogFetcher.fetchFailureAlertButtonTittle,
			style: .destructive)
		ac.addAction(okAction)
		present(ac, animated: true)
	}
}
