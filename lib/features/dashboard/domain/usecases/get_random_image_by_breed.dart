import 'package:dartz/dartz.dart';
import 'package:dogs_dashboard/core/base_usecase.dart';
import 'package:dogs_dashboard/core/errors/failures.dart';
import 'package:dogs_dashboard/features/dashboard/domain/repositories/dashboard_repo.dart';
import 'package:injectable/injectable.dart';

/// Implements the [BaseUseCase]
/// for fetching a random dog image for a given breed.
///
/// This use case is a part of the dashboard feature
/// and is used to interact with the [DashboardRepo].
/// It returns a `Future` that will complete with either a [Failure]
/// or a [String] containing the URL of a random dog image.
@lazySingleton
class GetRandomImageByBreedUseCase
    implements BaseUseCase<Failure, String, GetRandomImageByBreedParameters> {
  /// Creates an instance of [GetRandomImageByBreedUseCase],
  /// requiring [dashboardRepo] as a parameter.
  GetRandomImageByBreedUseCase({required this.dashboardRepo});

  /// The repository used to fetch data.
  final DashboardRepo dashboardRepo;

  @override

  /// Executes the use case, calling the [dashboardRepo]
  /// to fetch the random dog image.
  ///
  /// Takes [GetRandomImageByBreedParameters] as a parameter,
  /// specifically the breed of dog,
  /// and returns a `Future` that will complete with either a [Failure]
  /// or a [String] containing the URL of a random dog image.
  Future<Either<Failure, String>> call(
    GetRandomImageByBreedParameters parameters,
  ) async {
    return dashboardRepo.getRandomImageByBreed(parameters.breed);
  }
}

/// Holds the parameters required for [GetRandomImageByBreedUseCase].
///
/// Specifically holds the [breed] of the dog for which a random image.
class GetRandomImageByBreedParameters {
  /// Creates an instance of [GetRandomImageByBreedParameters],
  /// requiring [breed] as a parameter.
  GetRandomImageByBreedParameters({required this.breed});

  /// The breed of the dog for which a random image is to be fetched.
  final String breed;
}
