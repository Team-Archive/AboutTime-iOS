// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  internal enum InfoPlist {
    /// PhotoArchive(임시)
    internal static let cfBundleDisplayName = L10n.tr("InfoPlist", "CFBundleDisplayName")
    /// 위젯에 등록할 사진을 찍기위해 필요합니다.
    internal static let nsCameraUsageDescription = L10n.tr("InfoPlist", "NSCameraUsageDescription")
  }
  internal enum Localizable {
    /// 메시지1
    internal static let msg1 = L10n.tr("Localizable", "msg_1")
    /// 메시지2
    internal static let msg2 = L10n.tr("Localizable", "msg_2")
    /// 타이틀!
    internal static let myTitle = L10n.tr("Localizable", "myTitle")
  }
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
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type