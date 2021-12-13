// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Already have an account?
  internal static let alreadyHaveAnAccountQuestion = L10n.tr("Localizable", "alreadyHaveAnAccountQuestion")
  /// Continue with Apple
  internal static let continueWithApple = L10n.tr("Localizable", "continueWithApple")
  /// Continue with Facebook
  internal static let continueWithFacebook = L10n.tr("Localizable", "continueWithFacebook")
  /// Continue with Google
  internal static let continueWithGoogle = L10n.tr("Localizable", "continueWithGoogle")
  /// Create an account
  internal static let createAnAccount = L10n.tr("Localizable", "createAnAccount")
  /// Create an Account
  internal static let createAnAccountButton = L10n.tr("Localizable", "createAnAccountButton")
  /// Email Address
  internal static let emailAddress = L10n.tr("Localizable", "emailAddress")
  /// Error
  internal static let error = L10n.tr("Localizable", "error")
  /// Please input correct email address
  internal static let inputCorrectEmail = L10n.tr("Localizable", "inputCorrectEmail")
  /// Later
  internal static let later = L10n.tr("Localizable", "later")
  /// OK
  internal static let ok = L10n.tr("Localizable", "ok")
  /// Password
  internal static let password = L10n.tr("Localizable", "password")
  /// Unknown error
  internal static let unknownError = L10n.tr("Localizable", "unknownError")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle = Bundle(for: BundleToken.self)
}
// swiftlint:enable convenience_type
