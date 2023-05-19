//
//  OnboardingPagesProvider.swift
//  FetchTheDog
//
//  Created by Mac on 11.05.2023.
//

import UIKit

protocol IOnboardingPagesProvider: UIPageViewControllerDataSource {
	var viewControllerList: [UIViewController] { get set }
}

final class OnboardingPagesProvider: NSObject, IOnboardingPagesProvider {

	var viewControllerList = [FirstOnboardingScreen(),
							  SecondOnboardingScreen(),
							  ThirdOnboardingScreen()]
}

extension OnboardingPagesProvider {

	func pageViewController(
		_ pageViewController: UIPageViewController,
		viewControllerBefore viewController: UIViewController) -> UIViewController? {
		guard let viewControllerIndex = viewControllerList.firstIndex(of: viewController) else {
			return nil
		}

		let previousIndex = viewControllerIndex - 1

		guard previousIndex >= 0 else {
			return nil
		}

		return viewControllerList[previousIndex]
	}

	func pageViewController(
		_ pageViewController: UIPageViewController,
		viewControllerAfter viewController: UIViewController) -> UIViewController? {
		guard let viewControllerIndex = viewControllerList.firstIndex(of: viewController) else {
			return nil
		}

		let nextIndex = viewControllerIndex + 1

		guard nextIndex < viewControllerList.count else {
			return nil
		}

		return viewControllerList[nextIndex]
	}

	func presentationCount(for pageViewController: UIPageViewController) -> Int {
		viewControllerList.count
	}

	func presentationIndex(for pageViewController: UIPageViewController) -> Int {
		guard let firstViewController = viewControllerList.first,
			  let firstViewControllerIndex = viewControllerList.firstIndex(of: firstViewController) else {
			return 0
		}

		return firstViewControllerIndex
	}

}
