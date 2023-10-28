import 'package:dartz/dartz.dart';
import 'package:dogs_dashboard/core/base_usecase.dart';
import 'package:dogs_dashboard/core/errors/failures.dart';
import 'package:dogs_dashboard/features/splash/domain/repositories/splash_repo.dart';
import 'package:injectable/injectable.dart';

/// A use case responsible for changing the theme mode of the app.
///
/// [ChangeThemeModeUseCase] takes a [SplashRepo] instance and
/// implements [BaseUseCase] with a return type of [Failure] or `bool`
/// based on the theme change operation.
@lazySingleton
class ChangeThemeModeUseCase implements BaseUseCase<Failure, bool, String> {
  /// Creates a [ChangeThemeModeUseCase] instance,
  /// requiring a [SplashRepo] as input.
  ///
  /// The [splashRepo] will be used for the theme mode change operation.
  ChangeThemeModeUseCase({required this.splashRepo});

  /// An instance of [SplashRepo] for theme mode-related functionalities.
  final SplashRepo splashRepo;

  /// Executes the use case operation for changing the theme mode based on
  /// the given theme mode [themeMode].
  ///
  /// Returns an [Either] object containing a [Failure] or a `bool` indicating
  /// the success or failure of the operation.
  @override
  Future<Either<Failure, bool>> call(String themeMode) =>
      splashRepo.changeThemeMode(themeMode: themeMode);
}
