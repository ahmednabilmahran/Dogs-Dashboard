import 'package:dartz/dartz.dart';
import 'package:dogs_dashboard/core/errors/failures.dart';
import 'package:dogs_dashboard/features/splash/data/datasources/splash_local_datasource.dart';
import 'package:dogs_dashboard/features/splash/domain/repositories/splash_repo.dart';
import 'package:injectable/injectable.dart';

/// [SplashRepoImpl] is the concrete implementation
/// of the [SplashRepo] interface.
///
/// It interacts with a local data source
/// to get and set language and theme settings.
@LazySingleton(as: SplashRepo)
class SplashRepoImpl implements SplashRepo {
  /// Constructor that initializes the local data source for splash settings.
  SplashRepoImpl({
    required this.splashLocalDataSource,
  });

  /// Local data source for interacting with splash settings.
  final SplashLocalDataSource splashLocalDataSource;

  /// Changes the application's language.
  ///
  /// Returns a [Failure] if there's an exception, otherwise returns true.
  @override
  Future<Either<Failure, bool>> changeLang({required String langCode}) async {
    try {
      final langIsChanged =
          await splashLocalDataSource.changeLang(langCode: langCode);
      return Right(langIsChanged);
    } catch (e) {
      return Left(ServerFailure('CacheFailure'));
    }
  }

  /// Retrieves the saved application language from local storage.
  ///
  /// Returns a [Failure] if there's an exception,
  /// otherwise returns the language code.
  @override
  Future<Either<Failure, String>> getSavedLang() async {
    try {
      final langCode = await splashLocalDataSource.getSavedLang();
      return Right(langCode);
    } catch (e) {
      return Left(ServerFailure('CacheFailure'));
    }
  }

  /// Changes the application's theme mode.
  ///
  /// Returns a [Failure] if there's an exception, otherwise returns true.
  @override
  Future<Either<Failure, bool>> changeThemeMode({
    required String themeMode,
  }) async {
    try {
      final themeModeIsChanged =
          await splashLocalDataSource.changeThemeMode(themeMode: themeMode);
      return Right(themeModeIsChanged);
    } catch (e) {
      return Left(ServerFailure('CacheFailure'));
    }
  }

  /// Retrieves the saved application theme mode from local storage.
  ///
  /// Returns a [Failure] if there's an exception,
  /// otherwise returns the theme mode.
  @override
  Future<Either<Failure, String>> getSavedThemeMode() async {
    try {
      final themeMode = await splashLocalDataSource.getSavedThemeMode();
      return Right(themeMode);
    } catch (e) {
      return Left(ServerFailure('CacheFailure'));
    }
  }
}
