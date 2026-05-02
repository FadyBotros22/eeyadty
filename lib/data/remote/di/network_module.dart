import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../domain/di/dependency_injection.dart';
import '../../preferences/user_preferences.dart';
import '../network/failure/failure_bloc.dart';
import '../network/interceptors/headers_interceptor.dart';
import '../network/interceptors/token_interceptor.dart';

@module
abstract class DioNetwork {
  @lazySingleton
  Dio dio() {
    var dio = Dio(baseOptions());
    dio.interceptors.addAll([
      HeadersInterceptor(getIt<UserPreferences>()),
      prettyDioLogger(),
      TokenInterceptor(getIt<UserPreferences>(), getIt<FailureBloc>()),
      retryInterceptor(dio),
    ]);
    return dio;
  }

  BaseOptions baseOptions() {
    return BaseOptions(
      headers: HeadersInterceptor.getHeaders(),
      receiveDataWhenStatusError: true,
      validateStatus: (s) {
        return s! < 300;
      },
      responseType: ResponseType.json,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
    );
  }

  RetryInterceptor retryInterceptor(Dio dio) {
    final retryStatuses = {status401Unauthorized};
    return RetryInterceptor(
      dio: dio,
      retries: 3,
      retryDelays: [
        const Duration(seconds: 1),
        const Duration(seconds: 2),
        const Duration(seconds: 3)
      ],
      retryEvaluator: DefaultRetryEvaluator(retryStatuses).evaluate,
    );
  }

  PrettyDioLogger prettyDioLogger() {
    return PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      error: true,
      compact: false,
    );
  }
}
