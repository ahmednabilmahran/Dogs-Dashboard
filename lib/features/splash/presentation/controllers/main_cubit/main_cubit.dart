import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dogs_dashboard/core/base_usecase.dart';
import 'package:dogs_dashboard/core/utils/app_strings.dart';
import 'package:dogs_dashboard/core/utils/theme_helper.dart';
import 'package:dogs_dashboard/features/splash/domain/usecases/change_lang.dart';
import 'package:dogs_dashboard/features/splash/domain/usecases/change_theme_mode.dart';
import 'package:dogs_dashboard/features/splash/domain/usecases/get_saved_lang.dart';
import 'package:dogs_dashboard/features/splash/domain/usecases/get_saved_theme_mode.dart';
import 'package:dogs_dashboard/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_state.dart';

/// An enumeration of the available theme modes.
enum ThemeModeX {
  /// The light theme mode.
  light,

  /// The dark theme mode.
  dark,

  /// The system theme mode.
  system
}

/// The [MainCubit] class manages the main functionality of the app,
/// including handling language and theme changes.
class MainCubit extends Cubit<MainState> {
  /// Constructor
  MainCubit(
    this._getSavedLangUseCase,
    this._changeLangUseCase,
    this._getSavedThemeModeUseCase,
    this._changeThemeModeUseCase,
  ) : super(MainInitialState());

  /// Public method to retrieve the MainCubit instance from the BuildContext.
  static MainCubit get(BuildContext context) => BlocProvider.of(context);

  // Private members
  final GetSavedLangUseCase _getSavedLangUseCase;
  final ChangeLangUseCase _changeLangUseCase;
  final GetSavedThemeModeUseCase _getSavedThemeModeUseCase;
  final ChangeThemeModeUseCase _changeThemeModeUseCase;

  /// The current language code.
  String currentLangCode = AppStrings.englishCode;

  /// The current theme mode.
  ThemeMode currentThemeMode = ThemeMode.system;

  /// Changes the app's current theme.
  Future<void> changeTheme({
    required String themeMode,
    required BuildContext context,
  }) async {
    final response = await _changeThemeModeUseCase.call(themeMode);
    response.fold(
      (failure) => currentThemeMode = ThemeMode.system,
      (value) {
        if (themeMode == ThemeMode.dark.name) {
          currentThemeMode = ThemeMode.dark;
        } else if (themeMode == ThemeMode.light.name) {
          currentThemeMode = ThemeMode.light;
        } else {
          currentThemeMode = ThemeMode.system;
        }
        ThemeHelper.changeSystemUiOverlayStyle(context);

        emit(MainChangeThemeState());
      },
    );
  }

  /// Retrieves and applies the saved theme mode.
  Future<void> getSavedThemeMode() async {
    final response = await _getSavedThemeModeUseCase.call(NoParameters());
    response.fold(
      (failure) => currentThemeMode = ThemeMode.system,
      (value) {
        if (value == ThemeMode.dark.name) {
          currentThemeMode = ThemeMode.dark;
        } else if (value == ThemeMode.light.name) {
          currentThemeMode = ThemeMode.light;
        } else {
          currentThemeMode = ThemeMode.system;
        }
        emit(MainGetThemeModeState());
      },
    );
  }

  /// Retrieves and applies the saved language.
  Future<void> getSavedLang() async {
    final response = await _getSavedLangUseCase.call(NoParameters());
    response.fold(
      (failure) => currentLangCode = AppStrings.englishCode,
      (value) {
        currentLangCode = value;
        emit(MainGetLocaleState());
      },
    );
  }

  /// Changes the app's current language.
  Future<void> changeLang(String code) async {
    final response = await _changeLangUseCase.call(AppStrings.arabicCode);
    response.fold(
      (failure) {},
      (value) {
        currentLangCode = code;
        S.load(Locale(currentLangCode));
        emit(MainChangeLocaleState());
      },
    );
  }

  /// Connectivity related members.
  final Connectivity connectivity = Connectivity();

  /// Subscription
  StreamSubscription<dynamic>? connectivityStreamSubscription;

  /// Checks the device's current internet connectivity.
  Future<void> checkConnectivity() async {
    connectivityStreamSubscription = connectivity.onConnectivityChanged.listen(
      (ConnectivityResult result) {
        // Update connectivity state based on the result.
        if (result == ConnectivityResult.wifi ||
            result == ConnectivityResult.mobile) {
          emit(MainInternetConnectedState());
        } else {
          emit(MainNoInternetConnectionState());
        }
      },
    );
  }

  @override
  Future<void> close() {
    // Cleanup
    connectivityStreamSubscription?.cancel();
    return super.close();
  }
}
