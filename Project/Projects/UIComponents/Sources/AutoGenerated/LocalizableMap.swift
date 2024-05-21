// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum L10n {
  public enum InfoPlist {
    /// About Time
    public static let cfBundleDisplayName = L10n.tr("InfoPlist", "CFBundleDisplayName")
    /// 사진을 게시하기위해 카메라 권한이 필요합니다.
    public static let nsCameraUsageDescription = L10n.tr("InfoPlist", "NSCameraUsageDescription")
    /// 사진을 게시하기위해 사진 보관함 권한이 필요합니다.
    public static let nsPhotoLibraryUsageDescription = L10n.tr("InfoPlist", "NSPhotoLibraryUsageDescription")
  }
  public enum Localizable {
    /// 접근권한 허용
    public static let albumNotPermittedAllowButtonTitle = L10n.tr("Localizable", "Album_Not_Permitted_Allow_Button_Title")
    /// About Time을 이용해 사진을 친구들과 공유하기 위해 사진첩 접근권한이 필요해요
    public static let albumNotPermittedContents = L10n.tr("Localizable", "Album_Not_Permitted_Contents")
    /// 앱 설정에서 언제든지 변경할 수 있어요.
    public static let albumNotPermittedHelp = L10n.tr("Localizable", "Album_Not_Permitted_Help")
    /// 사진첩 접근권한 허용
    public static let albumNotPermittedTitle = L10n.tr("Localizable", "Album_Not_Permitted_Title")
    /// 업로드
    public static let albumPhotoSelectCompleteButtonTitle = L10n.tr("Localizable", "Album_Photo_Select_Complete_Button_Title")
    /// 최근
    public static let albumRecentAlbum = L10n.tr("Localizable", "Album_Recent_Album")
    /// 예상하지 못한 오류가 발생하였습니다.
    public static let commonErrorMessage = L10n.tr("Localizable", "Common_Error_Message")
    /// 오류
    public static let commonErrorTitle = L10n.tr("Localizable", "Common_Error_Title")
    /// 네트워크오류
    public static let commonErrorTitleFromNetwork = L10n.tr("Localizable", "Common_Error_Title_From_Network")
    /// 서버오류
    public static let commonErrorTitleFromServer = L10n.tr("Localizable", "Common_Error_Title_From_Server")
    /// Login with Apple
    public static let signInApple = L10n.tr("Localizable", "Sign_In_Apple")
    /// Login with Facebook
    public static let signInFacebook = L10n.tr("Localizable", "Sign_In_Facebook")
    /// Login with Google
    public static let signInGoogle = L10n.tr("Localizable", "Sign_In_Google")
    /// 보내기
    public static let takePhotoEditCompleteButtonTitle = L10n.tr("Localizable", "Take_Photo_Edit_Complete_Button_Title")
    /// 텍스트 입력하기
    public static let takePhotoEditTextInputPlaceholder = L10n.tr("Localizable", "Take_Photo_Edit_Text_Input_Placeholder")
    /// 새로운 사진
    public static let takePhotoNaviTitle = L10n.tr("Localizable", "Take_Photo_Navi_Title")
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
