import 'package:dio/dio.dart';

import '../../../domain/utils/app_logger.dart';
import '../network/api_response/api_response.dart';
import '../network/failure/failure.dart';
import '../network/remote_result/remote_result.dart';


abstract class BaseRepository {
  Future<RemoteResult<T>> makeApiCall<T>(Future<T> Function() apiCall) async {
    try {
      return RemoteResult.successState(await apiCall());
    } catch (ex) {
      logPrint('makeApiCall ex: ${ex.toString()}');
      if (ex is DioException) {
        var response = ex.response;
        ApiResponse apiResponse;
        try {
          apiResponse = ApiResponse.fromJson(
            response?.data ?? {},
                (json) => response?.data.fromJson(json as Map<String, dynamic>),
          );
        } catch (jsonEx) {
          return RemoteResult.errorState(
            Failure(
              methodName: 'makeApiCall json',
              userMessage: jsonEx.toString(),
              exception: jsonEx,
            ),
          );
        }
        return RemoteResult.errorState(
          Failure(
            methodName: 'makeApiCall',
            userMessage: apiResponse.meta.message,
            exception: ex,
            statusCode: apiResponse.meta.status,
          ),
        );
      } else {
        return RemoteResult.errorState(
          Failure(methodName: '', userMessage: ex.toString(), exception: ex),
        );
      }
    }
  }
}

