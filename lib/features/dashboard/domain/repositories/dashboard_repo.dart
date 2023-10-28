import 'package:dartz/dartz.dart';
import 'package:dogs_dashboard/core/errors/failures.dart';

/// Provides an abstract interface for dashboard repository operations.
///
/// This interface defines the methods related to the dashboard,
/// including fetching random images
/// and image lists for both breeds and sub-breeds of dogs.
abstract class DashboardRepo {
  /// Fetches a random dog image URL for a specific breed.
  ///
  /// Takes a [breed] as a string parameter,
  /// and returns a `Future` that will complete
  /// with either a [Failure] or a [String]
  /// containing the URL of a random dog image.
  Future<Either<Failure, String>> getRandomImageByBreed(String breed);

  /// Fetches a list of dog image URLs for a specific breed.
  ///
  /// Takes a [breed] as a string parameter,
  /// and returns a `Future` that will complete
  /// with either a [Failure] or a [List<String>]
  /// containing URLs of dog images for the given breed.
  Future<Either<Failure, List<String>>> getImagesListByBreed(String breed);

  /// Fetches a random dog image URL for a specific sub-breed of a breed.
  ///
  /// Takes a [breed] and a [subBreed] as string parameters,
  /// and returns a `Future` that will complete
  /// with either a [Failure] or a [String]
  /// containing the URL of a random dog image for the sub-breed.
  Future<Either<Failure, String>> getRandomImageBySubBreed(
    String breed,
    String subBreed,
  );

  /// Fetches a list of dog image URLs for a specific sub-breed of a breed.
  ///
  /// Takes a [breed] and a [subBreed] as string parameters,
  /// and returns a `Future` that will complete
  /// with either a [Failure] or a [List<String>]
  /// containing URLs of dog images for the given sub-breed.
  Future<Either<Failure, List<String>>> getImagesListBySubBreed(
    String breed,
    String subBreed,
  );
}
