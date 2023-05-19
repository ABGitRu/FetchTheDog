// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  internal enum DogFetcher {
    /// Fetch the dog image
    internal static let fetchDogButtonTitle = L10n.tr("Localizable", "DogFetcher.FetchDogButtonTitle", fallback: "Fetch the dog image")
    /// Ok
    internal static let fetchFailureAlertButtonTittle = L10n.tr("Localizable", "DogFetcher.FetchFailureAlertButtonTittle", fallback: "Ok")
    internal enum FetchFailureAlert {
      /// It seems that the data is missed or broken
      internal static let noDogsDataMessage = L10n.tr("Localizable", "DogFetcher.FetchFailureAlert.NoDogsDataMessage", fallback: "It seems that the data is missed or broken")
      /// The dogs data is broken
      internal static let noDogsDataTitle = L10n.tr("Localizable", "DogFetcher.FetchFailureAlert.NoDogsDataTitle", fallback: "The dogs data is broken")
      /// Please try again and load new image
      internal static let noImageDataMessage = L10n.tr("Localizable", "DogFetcher.FetchFailureAlert.NoImageDataMessage", fallback: "Please try again and load new image")
      /// No image
      internal static let noImageDataTitle = L10n.tr("Localizable", "DogFetcher.FetchFailureAlert.NoImageDataTitle", fallback: "No image")
      /// It seems that the link no longer exists
      internal static let сanNotCreateURLMessage = L10n.tr("Localizable", "DogFetcher.FetchFailureAlert.СanNotCreateURLMessage", fallback: "It seems that the link no longer exists")
      /// URL is Broken
      internal static let сanNotCreateURLTitle = L10n.tr("Localizable", "DogFetcher.FetchFailureAlert.СanNotCreateURLTitle", fallback: "URL is Broken")
    }
  }
  internal enum Login {
    /// Log in
    internal static let loginButton = L10n.tr("Localizable", "Login.LoginButton", fallback: "Log in")
    /// Try again
    internal static let loginFailAlertButtonTitle = L10n.tr("Localizable", "Login.LoginFailAlertButtonTitle", fallback: "Try again")
    /// Try again, or register instead of that
    internal static let loginFailAlertMessage = L10n.tr("Localizable", "Login.LoginFailAlertMessage", fallback: "Try again, or register instead of that")
    /// Wrong login or password
    internal static let loginFailAlertTitle = L10n.tr("Localizable", "Login.LoginFailAlertTitle", fallback: "Wrong login or password")
    /// Enter your login
    internal static let loginTextfield = L10n.tr("Localizable", "Login.LoginTextfield", fallback: "Enter your login")
    /// Enter your password
    internal static let passwordTextField = L10n.tr("Localizable", "Login.PasswordTextField", fallback: "Enter your password")
    /// Register
    internal static let registerButton = L10n.tr("Localizable", "Login.RegisterButton", fallback: "Register")
    /// Try again
    internal static let registrationFailAlertButtonTitle = L10n.tr("Localizable", "Login.RegistrationFailAlertButtonTitle", fallback: "Try again")
    /// Please try again, your login and password must contain more than 4 characters
    internal static let registrationFailAlertMessage = L10n.tr("Localizable", "Login.RegistrationFailAlertMessage", fallback: "Please try again, your login and password must contain more than 4 characters")
    /// Registration failed
    internal static let registrationFailAlertTitle = L10n.tr("Localizable", "Login.RegistrationFailAlertTitle", fallback: "Registration failed")
    /// Ok
    internal static let registrationSuccessAlertButtonTitle = L10n.tr("Localizable", "Login.RegistrationSuccessAlertButtonTitle", fallback: "Ok")
    /// You can use your login and password to enter the app
    internal static let registrationSuccessAlertMessage = L10n.tr("Localizable", "Login.RegistrationSuccessAlertMessage", fallback: "You can use your login and password to enter the app")
    /// Registration complete
    internal static let registrationSuccessAlertTitle = L10n.tr("Localizable", "Login.RegistrationSuccessAlertTitle", fallback: "Registration complete")
  }
  internal enum Onboarding {
    internal enum FirstPage {
      /// Localizable.strings
      ///   FetchTheDog
      /// 
      ///   Created by Mac on 11.05.2023.
      internal static let welcome = L10n.tr("Localizable", "Onboarding.FirstPage.Welcome", fallback: "Hello, welcome to the app that fetches photos of random dogs everytime you want")
    }
    internal enum SecondPage {
      /// Our app has a login form, when you login first, there will no any need to do that again
      internal static let about = L10n.tr("Localizable", "Onboarding.SecondPage.About", fallback: "Our app has a login form, when you login first, there will no any need to do that again")
    }
    internal enum ThirdPage {
      /// Without further ado, let's dive in!
      internal static let letsDive = L10n.tr("Localizable", "Onboarding.ThirdPage.LetsDive", fallback: "Without further ado, let's dive in!")
      /// Log in Form
      internal static let loginFormButton = L10n.tr("Localizable", "Onboarding.ThirdPage.loginFormButton", fallback: "Log in Form")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
