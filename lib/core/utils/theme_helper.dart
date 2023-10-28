import 'package:dogs_dashboard/core/utils/app_colors.dart';
import 'package:dogs_dashboard/features/splash/presentation/controllers/main_cubit/main_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A utility class for managing theme-related functionalities.
class ThemeHelper {
  /// Checks if the current theme is dark.
  ///
  /// This method fetches the current [ThemeMode] from [MainCubit]
  /// and uses it to determine
  /// whether the app is currently in dark mode or not.
  static bool isDarkTheme(BuildContext context) {
    if (MainCubit.get(context).currentThemeMode == ThemeMode.system) {
      return MediaQuery.of(context).platformBrightness == Brightness.dark;
    }
    return MainCubit.get(context).currentThemeMode == ThemeMode.dark;
  }

  /// Holds the AppColors object which may contain the color scheme for the app.
  static AppColors appColors = AppColors();

  /// Changes the System UI overlay style based on the current theme.
  ///
  /// This method changes the status bar and system navigation appearance.
  /// If the current theme is dark,
  /// it sets a darker status bar with lighter icons,
  /// and vice-versa for the light theme.
  static void changeSystemUiOverlayStyle(BuildContext context) {
    if (isDarkTheme(context)) {
      SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: SystemUiOverlay.values,
      );
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarColor: appColors.woodSmoke,
          statusBarIconBrightness: Brightness.light,
        ),
      );
    } else {
      SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: SystemUiOverlay.values,
      );
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
      );
    }
  }
}
