import 'package:dartz/dartz.dart';
import 'package:dogs_dashboard/core/base_usecase.dart';
import 'package:dogs_dashboard/core/errors/failures.dart';
import 'package:dogs_dashboard/features/splash/domain/repositories/splash_repo.dart';
import 'package:injectable/injectable.dart';

/// A use case responsible for retrieving the saved theme mode of the app.
///
/// [GetSavedThemeModeUseCase] takes a [SplashRepo] instance and
/// implements [BaseUseCase] with a return type of [Failure] or `String`
/// based on the theme mode retrieval operation.
@lazySingleton
class GetSavedThemeModeUseCase
    implements BaseUseCase<Failure, String, NoParameters> {
  /// Creates a [GetSavedThemeModeUseCase] instance,
  /// requiring a [SplashRepo] as input.
  ///
  /// The [splashRepo] will be used for retrieving the saved theme mode.
  GetSavedThemeModeUseCase({required this.splashRepo});

  /// An instance of [SplashRepo] for theme mode-related functionalities.
  final SplashRepo splashRepo;

  /// Executes the use case operation for retrieving the saved theme mode.
  ///
  /// Returns an [Either] object containing a [Failure] or a `String` indicating
  /// the saved theme mode or failure of the operation.
  ///
  /// No parameters are required for this operation.
  @override
  Future<Either<Failure, String>> call(NoParameters params) =>
      splashRepo.getSavedThemeMode();
}
