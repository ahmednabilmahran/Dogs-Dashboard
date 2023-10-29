import 'package:dogs_dashboard/core/api/dio_helper.dart';
import 'package:dogs_dashboard/core/api/endpoints.dart';
import 'package:injectable/injectable.dart';

/// The [SplashRemoteDataSource] abstract class provides an interface
/// for the remote data operations related to the dashboard.
// ignore: one_member_abstracts
abstract class SplashRemoteDataSource {
  /// Get All Breeds
  Future<Map<String, List<String>>> getAllBreeds();
}

/// The [SplashRemoteDataSourceImpl] class implements the
/// [SplashRemoteDataSource] and is responsible for fetching
/// the dashboard-related data from the remote source.
@LazySingleton(as: SplashRemoteDataSource)
class SplashRemoteDataSourceImpl implements SplashRemoteDataSource {
  @override
  Future<Map<String, List<String>>> getAllBreeds() async {
    final data = await DioHelper.getData(
      url: '${EndPoints.breedsEndPoint}/${EndPoints.listAllBreedsEndPoint}',
    );
    if (data.statusCode == 200 &&
        (data.data as Map<String, dynamic>)['status'] as String == 'success') {
      final rawMap = (data.data as Map<String, dynamic>)['message']
          as Map<String, dynamic>;

      final convertedMap = <String, List<String>>{};
      for (final key in rawMap.keys) {
        if (rawMap[key] is List) {
          convertedMap[key] = List<String>.from(rawMap[key] as List);
        } else {
          convertedMap[key] = [];
        }
      }
      return convertedMap;
    } else {
      throw Exception('Something went wrong');
    }
  }
}
