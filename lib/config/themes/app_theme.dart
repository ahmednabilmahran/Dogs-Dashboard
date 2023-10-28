import 'package:dogs_dashboard/core/utils/app_strings.dart';
import 'package:dogs_dashboard/core/utils/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/// A class that provides a light theme configuration for the application.
class AppTheme {
  /// Returns a [ThemeData] object representing the light theme of the app.
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

      // Select the font family based on the language setting.
      fontFamily: lang == AppStrings.arabicCode
          ? AppStrings.arabicFontFamily
          : AppStrings.englishFontFamily,

      // Various color configurations.
      primaryColor: ThemeHelper.appColors.lipstickRed,
      dividerColor: ThemeHelper.appColors.woodSmoke,
      hintColor: ThemeHelper.appColors.woodSmoke.withOpacity(0.5),

      // Set the brightness level.
      brightness: Brightness.light,

      // Additional color configurations.
      splashColor: ThemeHelper.appColors.woodSmoke,
      hoverColor: ThemeHelper.appColors.greenWhite,
      cardColor: ThemeHelper.appColors.grey,
      shadowColor: ThemeHelper.appColors.woodSmoke,
      scaffoldBackgroundColor: ThemeHelper.appColors.white,

      // Configure the AppBar theme.
      appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(
          color: ThemeHelper.appColors.greenWhite,
        ),
        centerTitle: true,
        color: ThemeHelper.appColors.woodSmoke,
      ),

      // Define text styles for different use-cases.
      textTheme: TextTheme(
        /// Used for very large headlines, often at the top of the screen.
        headlineLarge: TextStyle(
          fontSize: 126.sp,
          fontWeight: FontWeight.w700,
        ),

        /// Used for labels on upgrader components.
        labelLarge: TextStyle(
          fontSize: 13.sp,
          fontWeight: FontWeight.w700,
        ),

        /// Used for scrolling text effects like marquee.
        labelMedium: TextStyle(
          fontSize: 108.sp,
          fontWeight: FontWeight.w700,
        ),

        /// Used for main headers.
        displayLarge: TextStyle(
          fontSize: 29.sp,
          fontWeight: FontWeight.w700,
        ),

        /// Used for sub-headers.
        displayMedium: TextStyle(
          fontSize: 21.sp,
          fontWeight: FontWeight.w600,
        ),

        /// Used for smaller headers.
        displaySmall: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.w600,
        ),

        /// Used for prominent titles.
        titleLarge: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.w700,
        ),

        /// Used for subtitles and secondary titles.
        titleMedium: TextStyle(
          fontSize: 13.sp,
          fontWeight: FontWeight.w600,
        ),

        /// Used for less prominent titles.
        titleSmall: TextStyle(
          fontSize: 11.sp,
          fontWeight: FontWeight.w600,
        ),

        /// Used for main body text.
        bodyLarge: TextStyle(
          fontSize: 13.sp,
          fontWeight: FontWeight.w600,
        ),

        /// Used for secondary body text.
        headlineMedium: TextStyle(
          fontSize: 13.sp,
          fontWeight: FontWeight.w400,
        ),

        /// Used for tertiary body text.
        headlineSmall: TextStyle(
          fontSize: 11.sp,
          fontWeight: FontWeight.w400,
        ),

        /// Used for standard body text.
        bodyMedium: TextStyle(
          fontSize: 11.sp,
          fontWeight: FontWeight.w500,
        ),

        /// Used for smaller body text or footnotes.
        bodySmall: TextStyle(
          fontSize: 9.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
