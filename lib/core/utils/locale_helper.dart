import 'package:dogs_dashboard/core/utils/app_strings.dart';
import 'package:intl/intl.dart';

/// A utility class for managing application locale.
///
/// Provides functionality to check if the current locale is Arabic.
class LocaleHelper {
  /// Determines whether the current locale is Arabic.
  ///
  /// Returns `true` if the current locale is Arabic, otherwise `false`.
  /// It uses the [Intl] package to get the current locale and compares it
  /// with the Arabic code defined in [AppStrings].
  static bool get isArabic => Intl.getCurrentLocale() == AppStrings.arabicCode;
}
