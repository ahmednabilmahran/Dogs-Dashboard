import 'package:dartz/dartz.dart';
import 'package:dogs_dashboard/core/base_usecase.dart';
import 'package:dogs_dashboard/core/errors/failures.dart';
import 'package:dogs_dashboard/features/splash/domain/repositories/splash_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetAllBreedsUseCase
    implements BaseUseCase<Failure, Map<String, List<String>>, NoParameters> {
  /// Creates an instance of [GetAllBreedsUseCase],
  /// requiring [splashRepo] as a parameter.
  GetAllBreedsUseCase({required this.splashRepo});

  /// The repository used to fetch data.
  final SplashRepo splashRepo;

  @override
  Future<Either<Failure, Map<String, List<String>>>> call(
    NoParameters parameters,
  ) async {
    return splashRepo.getAllBreeds();
  }
}
