import 'package:dartz/dartz.dart';
import 'package:dogs_dashboard/core/base_usecase.dart';
import 'package:dogs_dashboard/core/errors/failures.dart';
import 'package:dogs_dashboard/features/splash/domain/repositories/splash_repo.dart';
import 'package:injectable/injectable.dart';

/// A use case responsible for retrieving the saved language of the app.
///
/// [GetSavedLangUseCase] takes a [SplashRepo] instance and
/// implements [BaseUseCase] with a return type of [Failure] or `String`
/// based on the language retrieval operation.
@lazySingleton
class GetSavedLangUseCase
    implements BaseUseCase<Failure, String, NoParameters> {
  /// Creates a [GetSavedLangUseCase] instance,
  /// requiring a [SplashRepo] as input.
  ///
  /// The [splashRepo] will be used for retrieving the saved language.
  GetSavedLangUseCase({required this.splashRepo});

  /// An instance of [SplashRepo] for language-related functionalities.
  final SplashRepo splashRepo;

  /// Executes the use case operation for retrieving the saved language.
  ///
  /// Returns an [Either] object containing a [Failure] or a `String` indicating
  /// the saved language or failure of the operation.
  ///
  /// No parameters are required for this operation.
  @override
  Future<Either<Failure, String>> call(NoParameters params) =>
      splashRepo.getSavedLang();
}
