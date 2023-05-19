//
//  SceneDelegate.swift
//  FetchTheDog
//
//  Created by Mac on 10.05.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?

	func scene(
		_ scene: UIScene,
		willConnectTo session: UISceneSession,
		options connectionOptions: UIScene.ConnectionOptions) {

		guard let windowScene = (scene as? UIWindowScene) else { return }
		window = UIWindow(windowScene: windowScene)
		let rootVC = AppFlow().getScene()
		let navigation = UINavigationController(rootViewController: rootVC)
		window?.rootViewController = navigation
		window?.makeKeyAndVisible()
	}
}
