import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dogs_dashboard/config/routes/app_routes.dart';
import 'package:dogs_dashboard/core/utils/app_strings.dart';
import 'package:dogs_dashboard/generated/l10n.dart';
import 'package:dogs_dashboard/main.dart';
import 'package:flutter/material.dart';

/// A base [Failure] class for managing errors.
///
/// Contains a [String] error message to be used throughout the application.
abstract class Failure {
  /// Default constructor takes an error message.
  const Failure(this.errMessage);

  /// The error message.
  final String errMessage;
}

/// A [ServerFailure] class extending [Failure] for server-related errors.
///
/// Handles errors that are coming from Dio.
class ServerFailure extends Failure {
  /// Constructor that takes an error message.
  ServerFailure(super.errMessage);

  /// Factory constructor to create a [ServerFailure] from [DioException].
  ///
  /// Based on the type of [DioException]
  /// Or a relevant [ServerFailure] is returned.
  factory ServerFailure.fromDioError(DioException dioException) {
    // Switch through different DioException types
    switch (dioException.type) {
      case DioExceptionType.badCertificate:
      case DioExceptionType.connectionTimeout:
        return ServerFailure(AppStrings.connectionTimeout);

      case DioExceptionType.sendTimeout:
        return ServerFailure(AppStrings.sendTimeout);

      case DioExceptionType.receiveTimeout:
        return ServerFailure(AppStrings.receiveTimeout);

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioException.response!.statusCode,
          // Safely decode response data
          // ignore: avoid_dynamic_calls
          dioException.response!.data.runtimeType == String
              ? jsonDecode(dioException.response!.data.toString())
              : dioException.response!.data,
        );

      case DioExceptionType.cancel:
        return ServerFailure(AppStrings.requestWasCanceled);

      case DioExceptionType.connectionError:
        if (dioException.message!.contains(AppStrings.socketException)) {
          return ServerFailure(S.current.noInternetConnection);
        }
        return ServerFailure(AppStrings.unexpectedError);

      case DioExceptionType.unknown:
        return ServerFailure(AppStrings.thereWasUnknownError);
    }
  }

  /// Factory constructor to create a [ServerFailure] from response data.
  ///
  /// If the response contains any known error status codes
  /// Or a relevant [ServerFailure] is returned.
  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if ([400, 401, 403, 422, 404].contains(statusCode)) {
      final responseMap = response as Map<String, dynamic>;
      log(
        '${AppStrings.responseMap} $responseMap',
        name: AppStrings.serverFailure,
      );

      // Handle unauthorized status
      if (statusCode == 401) {
        Navigator.pushNamedAndRemoveUntil(
          navigatorKey.currentContext!,
          Routes.initialRoute,
          (route) => false,
        );
        return ServerFailure(AppStrings.pleaseLoginAgain);
      }

      // Handle other known error status codes
      return ServerFailure(
        (responseMap['message'] as String?) == null
            ? AppStrings.unexpectedError
            : responseMap['message'] as String,
      );
    } else if (statusCode == 500) {
      return ServerFailure(AppStrings.internalServerError);
    } else {
      return ServerFailure(AppStrings.pleaseTryAgain);
    }
  }
}
