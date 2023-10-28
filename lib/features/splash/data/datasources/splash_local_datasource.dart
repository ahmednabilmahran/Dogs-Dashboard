import 'package:dogs_dashboard/core/injection_container.dart';
import 'package:dogs_dashboard/core/utils/database_manager.dart';
import 'package:injectable/injectable.dart';

/// The [SplashLocalDataSource] abstract class defines methods for saving
/// and fetching language codes and theme modes.
abstract class SplashLocalDataSource {
  /// Saves the provided language code to the database.
  ///
  /// The [langCode] parameter specifies the language code to save.
  ///
  /// Returns a [Future] that will be `true` if the operation is successful.
  Future<bool> changeLang({required String langCode});

  /// Retrieves the saved language code from the database.
  ///
  /// Returns a [Future] that completes to the saved language code.
  Future<String> getSavedLang();

  /// Saves the provided theme mode to the local storage.
  ///
  /// The [themeMode] parameter specifies the theme mode to save.
  ///
  /// Returns a [Future] that will be `true` if the operation is successful.
  Future<bool> changeThemeMode({required String themeMode});

  /// Retrieves the saved theme mode from the local storage.
  ///
  /// Returns a [Future] that completes to the saved theme mode.
  Future<String> getSavedThemeMode();
}

/// A concrete implementation of the [SplashLocalDataSource] abstract class.
///
/// This class is responsible for handling the actual logic of saving and
/// fetching language codes and theme modes.
@LazySingleton(as: SplashLocalDataSource)
class SplashLocalDataSourceImpl implements SplashLocalDataSource {
  /// Default constructor for [SplashLocalDataSourceImpl].
  SplashLocalDataSourceImpl();

  @override
  Future<bool> changeLang({required String langCode}) async {
    try {
      getIt<DatabaseManager>().setLanguage(langCode);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<String> getSavedLang() async {
    // Access the static method using the class name.
    return getIt<DatabaseManager>().getLanguage();
  }

  @override
  Future<bool> changeThemeMode({required String themeMode}) async {
    try {
      getIt<DatabaseManager>().setThemeMode(themeMode);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<String> getSavedThemeMode() async {
    // Access the static method using the class name.
    return getIt<DatabaseManager>().getThemeMode();
  }
}
