/// A utility class for centralized management of app strings.
///
/// Contains string constants that can be used throughout the application.
class AppStrings {
  /// Application name.
  static const String appName = 'Dogs';

  /// Font family for English text.
  static const String englishFontFamily = 'Trap';

  /// Font family for Arabic text.
  static const String arabicFontFamily = 'IBM Plex Sans Arabic';

  /// Message for 'No Route Found'.
  static const String noRouteFound = 'No Route Found';

  /// The 'Content-Type' HTTP header.
  static const String contentType = 'Content-Type';

  /// The 'application/json' content type.
  static const String applicationJson = 'application/json';

  /// The 'Accept' HTTP header.
  static const String accept = 'Accept';

  /// Message for connection timeout.
  static const String connectionTimeout = 'Connection timeout with ApiServer.';

  /// Message for send timeout.
  static const String sendTimeout = 'Send timeout with ApiServer.';

  /// Message for receive timeout.
  static const String receiveTimeout = 'Receive timeout with ApiServer.';

  /// Message when the request was canceled.
  static const String requestWasCanceled = 'Request to ApiServer was canceled.';

  /// 'SocketException' string.
  static const String socketException = 'SocketException';

  /// 'ServerFailure' string.
  static const String serverFailure = 'ServerFailure';

  /// 'Cache Failure' string.
  static const String cacheFailure = 'Cache Failure';

  /// Message for unexpected errors.
  static const String unexpectedError = 'Unexpected Error, Please try again!';

  /// Message for unknown errors.
  static const String thereWasUnknownError = 'Opps There was unknown Error.';

  /// Message for internal server errors.
  static const String internalServerError =
      'Internal Server error, Please try later.';

  /// Generic error message.
  static const String pleaseTryAgain =
      'Opps There was an Error, Please try again.';

  /// Message for login errors.
  static const String pleaseLoginAgain =
      'Opps There was an Error, Please Login again';

  /// For logging the response map.
  static const String responseMap = 'responseMap';

  /// Code for the English language.
  static const String englishCode = 'en';

  /// Code for the Arabic language.
  static const String arabicCode = 'ar';

  /// Locale string.
  static const String locale = 'locale';
}
