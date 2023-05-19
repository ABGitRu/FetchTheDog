//
//  CoreDataManager.swift
//  FetchTheDog
//
//  Created by Mac on 14.05.2023.
//

import CoreData

enum UserEntityKeys: String {
	case entityName = "UserAccount"
	case login = "login"
	case password = "password"
}

protocol ICoreDataManager {
	func saveUser(_ user: User)
	func fetchUsers() -> [User]
	func deleteUser(_ user: User)
	func deleteAllUsers()
}

final class CoreDataManager: ICoreDataManager {
	private let persistentContainer: NSPersistentContainer

	init() {
		persistentContainer = NSPersistentContainer(name: "UserAccount")
		persistentContainer.loadPersistentStores { _, error in
			if let error = error {
				fatalError("Failed to load Core Data stack: \(error)")
			}
		}
	}

	@discardableResult
	private func createManagedUser(from user: User) -> NSManagedObject {
		let context = persistentContainer.viewContext
		let managedUser = NSEntityDescription.insertNewObject(
			forEntityName: UserEntityKeys.entityName.rawValue,
			into: context)

		managedUser.setValue(user.login, forKey: UserEntityKeys.login.rawValue)
		managedUser.setValue(user.password, forKey: UserEntityKeys.password.rawValue)

		return managedUser
	}

	private func fetchManagedUsers() -> [NSManagedObject] {
		let context = persistentContainer.viewContext
		let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: UserEntityKeys.entityName.rawValue)

		do {
			let managedUsers = try context.fetch(fetchRequest)
			return managedUsers
		} catch {
			return []
		}
	}

	private func deleteUser(_ managedUser: NSManagedObject) {
		let context = persistentContainer.viewContext
		context.delete(managedUser)

		saveContext()
	}

	private func saveContext() {
		let context = persistentContainer.viewContext

		if context.hasChanges {
			do {
				try context.save()
			} catch {
			}
		}
	}

	func saveUser(_ user: User) {
		createManagedUser(from: user)
		saveContext()
	}

	func fetchUsers() -> [User] {
		let managedUsers = fetchManagedUsers()
		var users: [User] = []

		for managedUser in managedUsers {
			guard
				let login = managedUser.value(forKey: UserEntityKeys.login.rawValue) as? String,
				let password = managedUser.value(forKey: UserEntityKeys.password.rawValue) as? String
			else {
				continue
			}

			let user = User(login: login, password: password)
			users.append(user)
		}

		return users
	}

	func deleteUser(_ user: User) {
		let managedUsers = fetchManagedUsers()

		for managedUser in managedUsers {
			guard
				let login = managedUser.value(forKey: UserEntityKeys.login.rawValue) as? String,
				let password = managedUser.value(forKey: UserEntityKeys.password.rawValue) as? String,
				login == user.login,
				password == user.password
			else {
				continue
			}

			deleteUser(managedUser)
			break
		}
	}

	func deleteAllUsers() {
		let managedUsers = fetchManagedUsers()
		for managedUser in managedUsers {
			deleteUser(managedUser)
		}
	}
}
