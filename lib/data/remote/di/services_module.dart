import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../services/auth_service/auth_service.dart';

@module
abstract class ServicesModule {
  @lazySingleton
  AuthService getAuthService(Dio dio) => AuthService(dio);
}
