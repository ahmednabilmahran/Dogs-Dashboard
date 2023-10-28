import 'package:dartz/dartz.dart';
import 'package:dogs_dashboard/core/base_usecase.dart';
import 'package:dogs_dashboard/core/errors/failures.dart';
import 'package:dogs_dashboard/features/splash/domain/repositories/splash_repo.dart';
import 'package:injectable/injectable.dart';

/// A use case responsible for changing the language of the app.
///
/// [ChangeLangUseCase] takes a [SplashRepo] instance and
/// implements [BaseUseCase] with return type of [Failure] or `bool`
/// based on the language change operation.
@lazySingleton
class ChangeLangUseCase implements BaseUseCase<Failure, bool, String> {
  /// Creates a [ChangeLangUseCase] instance, requiring a [SplashRepo] as input.
  ///
  /// The [splashRepo] will be used for the language change operation.
  ChangeLangUseCase({required this.splashRepo});

  /// An instance of [SplashRepo] for language-related functionalities.
  final SplashRepo splashRepo;

  /// Executes the use case operation for changing the language based on
  /// the given language code [langCode].
  ///
  /// Returns an [Either] object containing a [Failure] or a `bool` indicating
  /// the success or failure of the operation.
  @override
  Future<Either<Failure, bool>> call(String langCode) =>
      splashRepo.changeLang(langCode: langCode);
}
