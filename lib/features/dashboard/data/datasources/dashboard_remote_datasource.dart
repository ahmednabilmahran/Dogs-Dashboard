import 'package:dogs_dashboard/core/api/dio_helper.dart';
import 'package:dogs_dashboard/core/api/endpoints.dart';
import 'package:injectable/injectable.dart';

/// The [DashboardRemoteDataSource] abstract class provides an interface
/// for the remote data operations related to the dashboard.
abstract class DashboardRemoteDataSource {
  /// Fetches a random image URL of a given dog [breed].
  Future<String> getRandomImageByBreed(String breed);

  /// Fetches a list of image URLs of a given dog [breed].
  Future<List<String>> getImagesListByBreed(String breed);

  /// Fetches a random image URL of a given [subBreed] of a dog [breed].
  Future<String> getRandomImageBySubBreed(String breed, String subBreed);

  /// Fetches a list of image URLs of a given [subBreed] of a dog [breed].
  Future<List<String>> getImagesListBySubBreed(String breed, String subBreed);
}

/// The [DashboardRemoteDataSourceImpl] class implements the
/// [DashboardRemoteDataSource] and is responsible for fetching
/// the dashboard-related data from the remote source.
@LazySingleton(as: DashboardRemoteDataSource)
class DashboardRemoteDataSourceImpl implements DashboardRemoteDataSource {
  @override
  Future<String> getRandomImageByBreed(String breed) async {
    final data = await DioHelper.getData(
      url: '$breed/${EndPoints.randomImagesEndPoint}',
    );
    if (data.statusCode == 200 &&
        (data.data as Map<String, dynamic>)['status'] as String == 'success') {
      return (data.data as Map<String, dynamic>)['message'] as Future<String>;
    } else {
      throw Exception('Something went wrong');
    }
  }

  @override
  Future<List<String>> getImagesListByBreed(String breed) async {
    final data = await DioHelper.getData(
      url: '$breed/${EndPoints.imageEndPoint}',
    );
    if (data.statusCode == 200 &&
        (data.data as Map<String, dynamic>)['status'] as String == 'success') {
      return List<String>.from(
        (data.data as Map<String, dynamic>)['message'] as Iterable<dynamic>,
      ) as Future<List<String>>;
    } else {
      throw Exception('Something went wrong');
    }
  }

  @override
  Future<String> getRandomImageBySubBreed(String breed, String subBreed) async {
    final data = await DioHelper.getData(
      url: '$breed/$subBreed/${EndPoints.randomImagesEndPoint}',
    );
    if (data.statusCode == 200 &&
        (data.data as Map<String, dynamic>)['status'] as String == 'success') {
      return (data.data as Map<String, dynamic>)['message'] as Future<String>;
    } else {
      throw Exception('Something went wrong');
    }
  }

  @override
  Future<List<String>> getImagesListBySubBreed(
    String breed,
    String subBreed,
  ) async {
    final data = await DioHelper.getData(
      url: '$breed/$subBreed/${EndPoints.imageEndPoint}',
    );
    if (data.statusCode == 200 &&
        (data.data as Map<String, dynamic>)['status'] as String == 'success') {
      return List<String>.from(
        (data.data as Map<String, dynamic>)['message'] as Iterable<dynamic>,
      ) as Future<List<String>>;
    } else {
      throw Exception('Something went wrong');
    }
  }
}
