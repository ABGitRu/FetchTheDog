//
//  DogFetcherManager.swift
//  FetchTheDog
//
//  Created by Mac on 18.05.2023.
//

import UIKit

enum PossibleFetcherErrors: String, Error {
	case noImageData
	case canNotCreateURL
	case noDogsData
	case canNotLoadImage
	case canNotDecodeData
}

protocol IDogFetcherManager {
	func fetchTheDog(completion: @escaping (Result<Data, Error>) -> Void)
}

final class DogFetcherManager: IDogFetcherManager {
	var session = URLSession.shared
	let url = URL(string: "https://dog.ceo/api/breeds/image/random")

	func fetchTheDog(completion: @escaping (Result<Data, Error>) -> Void) {
		guard let url = url else {
			completion(.failure(PossibleFetcherErrors.canNotCreateURL))
			return
		}

		let request = URLRequest(url: url)
		session.dataTask(with: request) { data, _, _ in

			guard let data = data else {
				completion(.failure(PossibleFetcherErrors.noDogsData))
				return
			}

			do {
				let decoder = JSONDecoder()
				let dog = try decoder.decode(Dog.self, from: data)

				if let imageUrl = URL(string: dog.message) {
					self.loadImage(from: imageUrl, completion: completion)
				} else {
					completion(.failure(PossibleFetcherErrors.canNotLoadImage))
				}
			} catch {
				completion(.failure(PossibleFetcherErrors.canNotDecodeData))
			}
		}.resume()
	}

	private func loadImage(from url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
		session.dataTask(with: url) { data, _, _ in
			guard let data = data else {
				completion(.failure(PossibleFetcherErrors.noImageData))
				return
			}
			completion(.success(data))
		}.resume()
	}
}
