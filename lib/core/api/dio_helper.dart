import 'package:dio/dio.dart';
import 'package:dogs_dashboard/core/api/endpoints.dart';
import 'package:dogs_dashboard/core/utils/app_strings.dart';

/// A utility class for handling Dio-based HTTP operations.
class DioHelper {
  /// Singleton instance of the [Dio] client with predefined options.
  static Dio dio = Dio(
    BaseOptions(
      baseUrl: EndPoints.baseUrl,
      receiveDataWhenStatusError: true,
      receiveTimeout: const Duration(seconds: 15),
      connectTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
      headers: {
        AppStrings.contentType: AppStrings.applicationJson,
        AppStrings.accept: AppStrings.applicationJson,
      },
    ),
  );

  /// Fetch data from the given [url].
  ///
  /// Additional options like [token],
  /// [queryParameters],
  /// [headers]
  /// and [onReceiveProgress] can be provided.
  static Future<Response<dynamic>> getData({
    required String url,
    String? token,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    void Function(int, int)? onReceiveProgress,
  }) {
    dio.options.headers = headers ?? {};
    return dio.get(
      url,
      queryParameters: queryParameters,
      onReceiveProgress: onReceiveProgress,
    );
  }

  /// Deletes data at the given [url].
  ///
  /// Additional options like [token] and [headers] can be provided.
  static Future<Response<dynamic>> deleteData({
    required String url,
    String? token,
    Map<String, dynamic>? headers,
  }) {
    dio.options.headers = headers ?? {};
    return dio.delete(
      url,
    );
  }

  /// Update data at the given [url] with the provided [data].
  ///
  /// Additional options like [token],
  /// [headers], and [queryParameters] can be provided.
  static Future<Response<dynamic>> putData({
    required String? url,
    required Map<String, dynamic> data,
    required String? token,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    dio.options.headers = headers ?? {};
    return dio.put(
      url!,
      data: data,
      queryParameters: queryParameters,
    );
  }

  /// Create data at the given [url] with the provided [data].
  ///
  /// Additional options like [token],
  /// [options], [headers], and [queryParameters] can be provided.
  static Future<Response<dynamic>> postData({
    required String? url,
    dynamic data,
    String? token,
    Options? options,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) {
    dio.options.headers = headers ?? {};
    return dio.post(
      url!,
      data: data,
      options: options,
      queryParameters: queryParameters,
    );
  }

  /// Download a file from the given [url] and save it at [savePath].
  ///
  /// The [onReceiveProgress] callback can be provided to track the progress.
  static Future<Response<dynamic>> downloadFile({
    required String? url,
    required String? savePath,
    void Function(int, int)? onReceiveProgress,
  }) {
    return dio.download(
      url!,
      savePath,
      onReceiveProgress: onReceiveProgress,
    );
  }
}
