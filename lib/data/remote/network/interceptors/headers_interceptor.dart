import 'package:dio/dio.dart';
import 'package:flutter_timezone/flutter_timezone.dart';

import '../../../../app_config.dart';
import '../../../../domain/di/dependency_injection.dart';
import '../../../preferences/user_preferences.dart';

Future<String> getTimezone() async {
  var timeZone = await FlutterTimezone.getLocalTimezone();
  return timeZone.identifier;
}

String appTimeZone = '';

class HeadersInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.baseUrl = AppConfig.shared.baseUrl;
    options.headers['language'] = getIt<UserPreferences>().currentLocale;
    options.headers['branchId'] = getIt<UserPreferences>().selectedBranchId;

    super.onRequest(options, handler);
  }

  UserPreferences userPreferences;
  HeadersInterceptor(this.userPreferences);

  static Map<String, dynamic> getHeaders() {
    return {
      'Content-Type': 'application/json; charset=UTF-8',
      'timezone': appTimeZone,
    };
  }
}
