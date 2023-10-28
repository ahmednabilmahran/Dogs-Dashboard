import 'package:dartz/dartz.dart';
import 'package:dogs_dashboard/core/base_usecase.dart';
import 'package:dogs_dashboard/core/errors/failures.dart';
import 'package:dogs_dashboard/features/dashboard/domain/repositories/dashboard_repo.dart';
import 'package:injectable/injectable.dart';

/// Implements the [BaseUseCase]
/// for fetching a list of dog images for a given sub-breed.
///
/// This use case is part of the dashboard feature
/// and interacts with the [DashboardRepo].
/// It returns a `Future` that will complete with either a [Failure]
/// or a [List<String>] containing URLs of dog images for the sub-breed.
@lazySingleton
class GetImagesListBySubBreedUseCase
    implements
        BaseUseCase<Failure, List<String>, GetImagesListBySubBreedParameters> {
  /// Creates an instance of [GetImagesListBySubBreedUseCase],
  /// requiring [dashboardRepo] as a parameter.
  GetImagesListBySubBreedUseCase({required this.dashboardRepo});

  /// The repository used to fetch data.
  final DashboardRepo dashboardRepo;

  @override

  /// Executes the use case, calling the [dashboardRepo]
  /// to fetch a list of dog images for a specific sub-breed.
  ///
  /// Takes [GetImagesListBySubBreedParameters] as parameters,
  /// specifically the breed and sub-breed of the dog,
  /// and returns a `Future` that will complete with either a [Failure]
  /// or a [List<String>] containing URLs of dog images.
  Future<Either<Failure, List<String>>> call(
    GetImagesListBySubBreedParameters parameters,
  ) async {
    return dashboardRepo.getImagesListBySubBreed(
      parameters.breed,
      parameters.subBreed,
    );
  }
}

/// Holds the parameters required for [GetImagesListBySubBreedUseCase].
///
/// Specifically holds the [breed]
/// and [subBreed] of the dog for which the list of images is to be fetched.
class GetImagesListBySubBreedParameters {
  /// Creates an instance of [GetImagesListBySubBreedParameters],
  /// requiring [breed] and [subBreed] as parameters.
  GetImagesListBySubBreedParameters({
    required this.breed,
    required this.subBreed,
  });

  /// The main breed of the dog for which a list of images is to be fetched.
  final String breed;

  /// The sub-breed of the dog for which a list of images is to be fetched.
  final String subBreed;
}
