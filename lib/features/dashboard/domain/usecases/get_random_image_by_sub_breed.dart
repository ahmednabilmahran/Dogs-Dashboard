import 'package:dartz/dartz.dart';
import 'package:dogs_dashboard/core/base_usecase.dart';
import 'package:dogs_dashboard/core/errors/failures.dart';
import 'package:dogs_dashboard/features/dashboard/domain/repositories/dashboard_repo.dart';
import 'package:injectable/injectable.dart';

/// Implements the [BaseUseCase]
/// for fetching a random dog image for a given sub-breed.
///
/// This use case is part of the dashboard feature
/// and is used to interact with the [DashboardRepo].
/// It returns a `Future` that will complete with either a [Failure]
/// or a [String] containing the URL of a random dog image of the sub-breed.
@lazySingleton
class GetRandomImageBySubBreedUseCase
    implements
        BaseUseCase<Failure, String, GetRandomImageBySubBreedParameters> {
  /// Creates an instance of [GetRandomImageBySubBreedUseCase],
  /// requiring [dashboardRepo] as a parameter.
  GetRandomImageBySubBreedUseCase({required this.dashboardRepo});

  /// The repository used to fetch data.
  final DashboardRepo dashboardRepo;

  @override

  /// Executes the use case, calling the [dashboardRepo]
  /// to fetch a random dog image of a sub-breed.
  ///
  /// Takes [GetRandomImageBySubBreedParameters] as a parameter,
  /// specifically the breed and sub-breed of the dog,
  /// and returns a `Future` that will complete with either a [Failure]
  /// or a [String] containing the URL of a random dog image.
  Future<Either<Failure, String>> call(
    GetRandomImageBySubBreedParameters parameters,
  ) async {
    return dashboardRepo.getRandomImageBySubBreed(
      parameters.breed,
      parameters.subBreed,
    );
  }
}

/// Holds the parameters required for [GetRandomImageBySubBreedUseCase].
///
/// Specifically holds the [breed]
/// and [subBreed] of the dog for which a random image is to be fetched.
class GetRandomImageBySubBreedParameters {
  /// Creates an instance of [GetRandomImageBySubBreedParameters],
  /// requiring [breed] and [subBreed] as parameters.
  GetRandomImageBySubBreedParameters({
    required this.breed,
    required this.subBreed,
  });

  /// The main breed of the dog for which a random image is to be fetched.
  final String breed;

  /// The sub-breed of the dog for which a random image is to be fetched.
  final String subBreed;
}
