import 'package:dartz/dartz.dart';
import 'package:dogs_dashboard/core/errors/failures.dart';

/// An abstract interface for the Splash repository.
///
/// This interface defines the contract for implementations
/// that will handle saving and retrieving application settings
/// like language and theme mode.
abstract class SplashRepo {
  /// Changes the application's language and saves the new language code.
  ///
  /// Returns [Either] a [Failure]
  ///  or a [bool] indicating the operation's success.
  Future<Either<Failure, bool>> changeLang({required String langCode});

  /// Retrieves the saved language code from storage.
  ///
  /// Returns [Either] a [Failure] or the saved language code as a [String].
  Future<Either<Failure, String>> getSavedLang();

  /// Changes the application's theme mode and saves the new theme mode.
  ///
  /// Returns [Either] a [Failure]
  /// or a [bool] indicating the operation's success.
  Future<Either<Failure, bool>> changeThemeMode({required String themeMode});

  /// Retrieves the saved theme mode from storage.
  ///
  /// Returns [Either] a [Failure] or the saved theme mode as a [String].
  Future<Either<Failure, String>> getSavedThemeMode();

  /// Retrieves all breeds.
  ///
  /// Returns [Either] a [Failure] or [Map<String, List<String>>].
  Future<Either<Failure, Map<String, List<String>>>> getAllBreeds();
}
