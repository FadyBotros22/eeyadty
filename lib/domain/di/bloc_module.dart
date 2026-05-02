import 'package:injectable/injectable.dart';

import '../../data/preferences/user_preferences.dart';
import '../../data/remote/network/failure/failure_bloc.dart';
import '../../presentation/feature_auth/bloc/auth_bloc.dart';
import '../repositories/auth_repository.dart';
import '../repositories/employee_repository.dart';

@module
abstract class BlocModule {
  @lazySingleton
  FailureBloc getFailureBloc() => FailureBloc();

  @lazySingleton
  AuthBloc getLoginBloc(
          FailureBloc failureBloc,
          AuthRepository authRepository,
          EmployeeRepository employeeRepository,
          UserPreferences userPreferences) =>
      AuthBloc(
          failureBloc, authRepository, employeeRepository, userPreferences);

}
