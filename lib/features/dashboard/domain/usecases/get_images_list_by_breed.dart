import 'package:dartz/dartz.dart';
import 'package:dogs_dashboard/core/base_usecase.dart';
import 'package:dogs_dashboard/core/errors/failures.dart';
import 'package:dogs_dashboard/features/dashboard/domain/repositories/dashboard_repo.dart';
import 'package:injectable/injectable.dart';

/// Implements the [BaseUseCase]
/// for fetching a list of dog images for a given breed.
///
/// This use case is part of the dashboard feature
/// and is used to interact with the [DashboardRepo].
/// It returns a `Future` that will complete with either a [Failure]
/// or a [List<String>] containing URLs of dog images for the specified breed.
@lazySingleton
class GetImagesListByBreedUseCase
    implements
        BaseUseCase<Failure, List<String>, GetImagesListByBreedParameters> {
  /// Creates an instance of [GetImagesListByBreedUseCase],
  /// requiring [dashboardRepo] as a parameter.
  GetImagesListByBreedUseCase({required this.dashboardRepo});

  /// The repository used to fetch data.
  final DashboardRepo dashboardRepo;

  @override

  /// Executes the use case, calling the [dashboardRepo]
  /// to fetch a list of dog images for a specific breed.
  ///
  /// Takes [GetImagesListByBreedParameters] as a parameter,
  /// specifically the breed of the dog,
  /// and returns a `Future` that will complete with either a [Failure]
  /// or a [List<String>] containing URLs of dog images.
  Future<Either<Failure, List<String>>> call(
    GetImagesListByBreedParameters parameters,
  ) async {
    return dashboardRepo.getImagesListByBreed(
      parameters.breed,
    );
  }
}

/// Holds the parameters required for [GetImagesListByBreedUseCase].
///
/// Specifically holds the [breed] of the dog
/// for which the list of images is to be fetched.
class GetImagesListByBreedParameters {
  /// Creates an instance of [GetImagesListByBreedParameters],
  /// requiring [breed] as a parameter.
  GetImagesListByBreedParameters({
    required this.breed,
  });

  /// The breed of the dog for which a list of images is to be fetched.
  final String breed;
}
