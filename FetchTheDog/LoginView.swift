//
//  LoginView.swift
//  FetchTheDog
//
//  Created by Alexey Barinov on 12.05.2023.
//  Copyright (c) 2023 ABSoftware. All rights reserved.
//
//

import UIKit

class LoginView: UIView {

	var loginTextField: UITextField = {
		let textField = UITextField()
		textField.translatesAutoresizingMaskIntoConstraints = false
		textField.backgroundColor = .gray
		textField.placeholder = L10n.Login.loginTextfield
		textField.borderStyle = .roundedRect
		return textField
	}()

	var passwordTextField: UITextField = {
		let textField = UITextField()
		textField.translatesAutoresizingMaskIntoConstraints = false
		textField.backgroundColor = .gray
		textField.placeholder = L10n.Login.passwordTextField
		textField.borderStyle = .roundedRect
		return textField
	}()

	var loginButton: UIButton = {
		let button = UIButton()
		button.setTitleColor(.blue, for: .normal)
		button.setTitle(L10n.Login.loginButton, for: .normal)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()

	var registerButton: UIButton = {
		let button = UIButton()
		button.tintColor = .blue
		button.setTitleColor(.blue, for: .normal)
		button.setTitle(L10n.Login.registerButton, for: .normal)
		button.translatesAutoresizingMaskIntoConstraints = false
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
		addSubview(loginTextField)
		addSubview(passwordTextField)
		addSubview(loginButton)
		addSubview(registerButton)

		NSLayoutConstraint.activate([
			loginTextField.centerYAnchor.constraint(equalTo: centerYAnchor),
			loginTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
			loginTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),

			passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 8),
			passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
			passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),

			loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
			loginButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
			loginButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
			loginButton.heightAnchor.constraint(equalToConstant: 36),

			registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 8),
			registerButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
			registerButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
			registerButton.heightAnchor.constraint(equalToConstant: 36)
		])
	}

	private func setupButtonsTargets() {
		loginButton.addTarget(
			nil,
			action: #selector(LoginViewController.loginButtonTapped),
			for: .touchUpInside)
		registerButton.addTarget(
			nil,
			action: #selector(LoginViewController.registerButtonTapped),
			for: .touchUpInside)
	}
}
