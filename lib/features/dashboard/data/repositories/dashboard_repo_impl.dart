import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dogs_dashboard/core/errors/failures.dart';
import 'package:dogs_dashboard/features/dashboard/data/datasources/dashboard_remote_datasource.dart';
import 'package:dogs_dashboard/features/dashboard/domain/repositories/dashboard_repo.dart';
import 'package:injectable/injectable.dart';

/// Implements the [DashboardRepo] interface,
/// providing concrete implementations for its methods.
///
/// This class interacts with a remote data source
/// to fetch dog images and information.
/// It handles errors and exceptions,
/// converting them to domain-specific failures.
@LazySingleton(as: DashboardRepo)
class DashboardRepoImpl implements DashboardRepo {
  /// Creates an instance of [DashboardRepoImpl],
  /// requiring [dashboardRemoteDataSource] as a parameter.
  DashboardRepoImpl({required this.dashboardRemoteDataSource});

  /// The remote data source used to fetch data.
  final DashboardRemoteDataSource dashboardRemoteDataSource;

  @override

  /// Fetches a random dog image URL for a specific breed.
  ///
  /// Takes a [breed] as a string parameter,
  /// and returns a `Future` that will complete
  /// with either a [Failure]
  /// or a [String] containing the URL of a random dog image.
  Future<Either<Failure, String>> getRandomImageByBreed(String breed) async {
    try {
      final result =
          await dashboardRemoteDataSource.getRandomImageByBreed(breed);
      return right(result);
    } catch (e) {
      return _handleFailure(e);
    }
  }

  @override

  /// Fetches a list of dog image URLs for a specific breed.
  ///
  /// Takes a [breed] as a string parameter,
  /// and returns a `Future` that will complete
  /// with either a [Failure]
  /// or a [List<String>] containing URLs of dog images for the given breed.
  Future<Either<Failure, List<String>>> getImagesListByBreed(
    String breed,
  ) async {
    try {
      final result =
          await dashboardRemoteDataSource.getImagesListByBreed(breed);
      return right(result);
    } catch (e) {
      return _handleFailure(e);
    }
  }

  @override

  /// Fetches a random dog image URL for a specific sub-breed of a breed.
  ///
  /// Takes a [breed] and a [subBreed] as string parameters,
  /// and returns a `Future` that will complete
  /// with either a [Failure]
  /// or a [String] containing the URL of a random dog image for the sub-breed.
  Future<Either<Failure, String>> getRandomImageBySubBreed(
    String breed,
    String subBreed,
  ) async {
    try {
      final result = await dashboardRemoteDataSource.getRandomImageBySubBreed(
        breed,
        subBreed,
      );
      return right(result);
    } catch (e) {
      return _handleFailure(e);
    }
  }

  @override

  /// Fetches a list of dog image URLs for a specific sub-breed of a breed.
  ///
  /// Takes a [breed] and a [subBreed] as string parameters,
  /// and returns a `Future` that will complete
  /// with either a [Failure]
  /// or a [List<String>] containing URLs of dog images for the given sub-breed.
  Future<Either<Failure, List<String>>> getImagesListBySubBreed(
    String breed,
    String subBreed,
  ) async {
    try {
      final result = await dashboardRemoteDataSource.getImagesListBySubBreed(
        breed,
        subBreed,
      );
      return right(result);
    } catch (e) {
      return _handleFailure(e);
    }
  }

  /// [_handleFailure],
  /// converting exceptions to domain-specific [Failure] instances.
  ///
  /// Takes an exception [e] as a parameter
  /// and returns an [Either] with a [Failure] on the left side.
  Either<Failure, T> _handleFailure<T>(dynamic e) {
    if (e is DioException) {
      return left(ServerFailure.fromDioError(e));
    }
    return left(ServerFailure(e.toString()));
  }
}
