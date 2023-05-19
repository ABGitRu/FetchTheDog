//
//  OnboardingPagesProviderTests.swift
//  FetchTheDogTests
//
//  Created by Mac on 13.05.2023.
//

import XCTest
@testable import FetchTheDog

final class OnboardingPagesProviderTests: XCTestCase {
	var sut: OnboardingPagesProvider!

	override func setUp() {
		super.setUp()
		sut = OnboardingPagesProvider()
	}

	override func tearDown() {
		super.tearDown()
		sut = nil
	}

	func testPageViewControllerBefore() {
		// Arrange
		let pageViewController = UIPageViewController()
		sut.viewControllerList = [
			FirstOnboardingScreen(),
			SecondOnboardingScreen(),
			ThirdOnboardingScreen()
		]
		let secondViewController = sut.viewControllerList[1]

		// Act
		let result = sut.pageViewController(pageViewController, viewControllerBefore: secondViewController)

		// Assert
		XCTAssertNotNil(result)
		XCTAssertTrue(result is FirstOnboardingScreen)
	}

	func testPageViewControllerBeforeReturnsNilWhenIndexLessThenZero() {
		// Arrange
		let pageViewController = UIPageViewController()
		sut.viewControllerList = [
			FirstOnboardingScreen(),
			SecondOnboardingScreen(),
			ThirdOnboardingScreen()
		]
		let firstViewController = sut.viewControllerList[0]

		// Act
		let result = sut.pageViewController(pageViewController, viewControllerBefore: firstViewController)

		// Assert
		XCTAssertNil(result)
	}

	func testPageViewControllerBeforeReturnsNil() {
		// Arrange
		let pageViewController = UIPageViewController()
		let controller = UIViewController()

		// Act
		let result = sut.pageViewController(pageViewController, viewControllerBefore: controller)

		// Assert
		XCTAssertNil(result)
	}

	func testPageViewControllerAfter() {
		// Arrange
		let pageViewController = UIPageViewController()
		sut.viewControllerList = [
			FirstOnboardingScreen(),
			SecondOnboardingScreen(),
			ThirdOnboardingScreen()
		]
		let secondViewController = sut.viewControllerList[1]

		// Act
		let result = sut.pageViewController(pageViewController, viewControllerAfter: secondViewController)

		// Assert
		XCTAssertNotNil(result)
		XCTAssertTrue(result is ThirdOnboardingScreen)
	}

	func testPageViewControllerAfterReturnsNil() {
		// Arrange
		let pageViewController = UIPageViewController()
		let controller = UIViewController()

		// Act
		let result = sut.pageViewController(pageViewController, viewControllerAfter: controller)

		// Assert
		XCTAssertNil(result)
	}

	func testPageViewControllerAfterReturnsNilWhenListCountLessTheNextIndex() {
		// Arrange
		let pageViewController = UIPageViewController()
		sut.viewControllerList = [
			FirstOnboardingScreen(),
			SecondOnboardingScreen(),
			ThirdOnboardingScreen()
		]

		// Act
		let result = sut.pageViewController(pageViewController, viewControllerAfter: sut.viewControllerList[2])

		// Assert
		XCTAssertNil(result)
	}

	func testPresentationCount() {
		// Arrange
		let pageViewController = UIPageViewController()
		sut.viewControllerList = [
			FirstOnboardingScreen(),
			SecondOnboardingScreen(),
			ThirdOnboardingScreen()
		]

		// Act
		let result = sut.presentationCount(for: pageViewController)

		// Assert
		XCTAssertEqual(result, 3)
	}

	func testPresentationIndex() {
		// Arrange
		let pageViewController = UIPageViewController()
		sut.viewControllerList = [
			FirstOnboardingScreen(),
			SecondOnboardingScreen(),
			ThirdOnboardingScreen()
		]

		// Act
		let result = sut.presentationIndex(for: pageViewController)

		// Assert
		XCTAssertEqual(result, 0)
	}

	func testPresentationIndexReturnsZeroWhenThereIsNoAnyViewControllersInList() {
		// Arrange
		let pageViewController = UIPageViewController()

		sut.viewControllerList = []
		// Act
		let result = sut.presentationIndex(for: pageViewController)

		// Assert
		XCTAssertEqual(result, 0)
	}

}
