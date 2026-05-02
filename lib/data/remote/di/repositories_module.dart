import 'package:injectable/injectable.dart';

import '../../../domain/repositories/auth_repository.dart';
import '../../preferences/user_preferences.dart';
import '../repositories/auth_repository_impl.dart';
import '../services/auth_service/auth_service.dart';

@module
abstract class RepositoriesModule {
  @lazySingleton
  AuthRepository getAuthRepository(
          UserPreferences userPreferences, AuthService authService) =>
      AuthRepositoryImpl(userPreferences, authService);
}
