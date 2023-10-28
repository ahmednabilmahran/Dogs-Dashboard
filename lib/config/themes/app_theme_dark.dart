import 'package:dogs_dashboard/core/utils/app_strings.dart';
import 'package:dogs_dashboard/core/utils/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/// A class that defines a dark theme for the application.
class AppThemeDark {
  /// Returns a [ThemeData] object representing the dark theme of the app.
  ///
  /// The `lang` argument specifies the language for which the font family
  /// should be selected.
  ///
  /// The returned theme has its various properties configured, such as
  /// text styles, colors, etc.
  static ThemeData theme(String lang) {
    return ThemeData(
      // Define the primary color swatch.
      primarySwatch: ThemeHelper.appColors.primarySwatchColor,

      // Choose the font family based on the selected language.
      fontFamily: lang == AppStrings.arabicCode
          ? AppStrings.arabicFontFamily
          : AppStrings.englishFontFamily,

      // Various color configurations.
      primaryColor: ThemeHelper.appColors.lipstickRed,
      dividerColor: ThemeHelper.appColors.white,
      hintColor: ThemeHelper.appColors.white.withOpacity(0.5),

      // Define the theme's brightness.
      brightness: Brightness.dark,

      // Other color configurations.
      splashColor: ThemeHelper.appColors.woodSmoke,
      hoverColor: ThemeHelper.appColors.greenWhite,
      cardColor: ThemeHelper.appColors.darkGrey,
      scaffoldBackgroundColor: ThemeHelper.appColors.woodSmoke,
      shadowColor: ThemeHelper.appColors.white,

      // App bar theme configuration.
      appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(
          color: ThemeHelper.appColors.woodSmoke,
        ),
        centerTitle: true,
        color: ThemeHelper.appColors.greenWhite,
      ),

      // Text theme configuration with various text styles.
      textTheme: TextTheme(
        // Text styles are configured with specific font size and weight.

        // E.g., "headlineLarge" is used for very large headlines.
        headlineLarge: TextStyle(
          fontSize: 126.sp,
          fontWeight: FontWeight.w700,
        ),

        /// Label Large for special upgrader components.
        labelLarge: TextStyle(
          fontSize: 13.sp,
          fontWeight: FontWeight.w700,
        ),

        /// Label Medium for Marquee text.
        labelMedium: TextStyle(
          fontSize: 108.sp,
          fontWeight: FontWeight.w700,
        ),

        /// Display Large text style for primary headings.
        displayLarge: TextStyle(
          fontSize: 29.sp,
          fontWeight: FontWeight.w700,
        ),

        /// Display Medium text style for sub-headings.
        displayMedium: TextStyle(
          fontSize: 21.sp,
          fontWeight: FontWeight.w600,
        ),

        /// Display Small text style for tertiary headings.
        displaySmall: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.w600,
        ),

        /// Title Large text style for main titles.
        titleLarge: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.w700,
        ),

        /// Title Medium text style for sub-titles.
        titleMedium: TextStyle(
          fontSize: 13.sp,
          fontWeight: FontWeight.w600,
        ),

        /// Title Small text style for smaller titles or headers.
        titleSmall: TextStyle(
          fontSize: 11.sp,
          fontWeight: FontWeight.w600,
        ),

        /// Body Large text style for main body text.
        bodyLarge: TextStyle(
          fontSize: 13.sp,
          fontWeight: FontWeight.w600,
        ),

        /// Headline Medium for secondary body text.
        headlineMedium: TextStyle(
          fontSize: 13.sp,
          fontWeight: FontWeight.w400,
        ),

        /// Headline Small for tertiary body text.
        headlineSmall: TextStyle(
          fontSize: 11.sp,
          fontWeight: FontWeight.w400,
        ),

        /// Body Medium text style for standard body text.
        bodyMedium: TextStyle(
          fontSize: 11.sp,
          fontWeight: FontWeight.w500,
        ),

        /// Body Small text style for smaller body text.
        bodySmall: TextStyle(
          fontSize: 9.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
