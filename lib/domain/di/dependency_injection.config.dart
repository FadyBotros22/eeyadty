// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:dio_smart_retry/dio_smart_retry.dart' as _i318;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../data/preferences/user_preferences.dart' as _i442;
import '../../data/remote/di/network_module.dart' as _i611;
import '../../data/remote/di/preferences_module.dart' as _i29;
import '../../data/remote/di/repositories_module.dart' as _i344;
import '../../data/remote/di/services_module.dart' as _i761;
import '../../data/remote/network/failure/failure_bloc.dart' as _i527;
import '../../data/remote/services/admin_employee_service/admin_employee_service.dart'
    as _i189;
import '../../data/remote/services/auth_service/auth_service.dart' as _i167;
import '../../data/remote/services/bookings_service/bookings_service.dart'
    as _i855;
import '../../data/remote/services/branch_service/branch_service.dart' as _i320;
import '../../data/remote/services/calendar_service/calendar_service.dart'
    as _i509;
import '../../data/remote/services/employee_service/employee_service.dart'
    as _i481;
import '../../data/remote/services/notification_service/notification_service.dart'
    as _i307;
import '../../presentation/feature_appointments/bloc/appointments_bloc.dart'
    as _i424;
import '../../presentation/feature_auth/bloc/auth_bloc.dart' as _i537;
import '../../presentation/feature_booking_details/bloc/booking_details_bloc.dart'
    as _i145;
import '../../presentation/feature_client_details/bloc/client_details_bloc.dart'
    as _i780;
import '../../presentation/feature_create_booking/bloc/create_booking_bloc.dart'
    as _i1037;
import '../../presentation/feature_notification/bloc/notification_list_bloc.dart'
    as _i16;
import '../../presentation/feature_profile/bloc/profile_bloc.dart' as _i216;
import '../../presentation/unread_notification_bloc/unread_notification_bloc.dart'
    as _i871;
import '../repositories/admin_employee_repository.dart' as _i148;
import '../repositories/auth_repository.dart' as _i1002;
import '../repositories/bookings_repository.dart' as _i244;
import '../repositories/branch_repository.dart' as _i376;
import '../repositories/calendar_repository.dart' as _i570;
import '../repositories/employee_repository.dart' as _i946;
import '../repositories/notification_repository.dart' as _i800;
import 'bloc_module.dart' as _i29;
import 'registered_modules.dart' as _i1015;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i174.GetIt> $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final dioNetwork = _$DioNetwork();
  final registerModule = _$RegisterModule();
  final blocModule = _$BlocModule();
  final preferencesModule = _$PreferencesModule();
  final servicesModule = _$ServicesModule();
  final repositoriesModule = _$RepositoriesModule();
  gh.factory<_i361.BaseOptions>(() => dioNetwork.baseOptions());
  gh.factory<_i528.PrettyDioLogger>(() => dioNetwork.prettyDioLogger());
  await gh.singletonAsync<_i460.SharedPreferences>(
    () => registerModule.prefs(),
    preResolve: true,
  );
  gh.lazySingleton<_i361.Dio>(() => dioNetwork.dio());
  gh.lazySingleton<_i527.FailureBloc>(() => blocModule.getFailureBloc());
  gh.lazySingleton<_i442.UserPreferences>(() =>
      preferencesModule.getUserPreferences(gh<_i460.SharedPreferences>()));
  gh.lazySingleton<_i167.AuthService>(
      () => servicesModule.getAuthService(gh<_i361.Dio>()));
  gh.lazySingleton<_i481.EmployeeService>(
      () => servicesModule.getEmployeeService(gh<_i361.Dio>()));
  gh.lazySingleton<_i189.AdminEmployeeService>(
      () => servicesModule.getAdminEmployeeService(gh<_i361.Dio>()));
  gh.lazySingleton<_i307.NotificationService>(
      () => servicesModule.getNotificationService(gh<_i361.Dio>()));
  gh.lazySingleton<_i855.BookingsService>(
      () => servicesModule.getBookingsService(gh<_i361.Dio>()));
  gh.lazySingleton<_i509.CalendarService>(
      () => servicesModule.getCalendarService(gh<_i361.Dio>()));
  gh.lazySingleton<_i320.BranchService>(
      () => servicesModule.getBranchService(gh<_i361.Dio>()));
  gh.factory<_i318.RetryInterceptor>(
      () => dioNetwork.retryInterceptor(gh<_i361.Dio>()));
  gh.lazySingleton<_i244.BookingsRepository>(() =>
      repositoriesModule.getBookingsRepository(gh<_i855.BookingsService>()));
  gh.lazySingleton<_i145.BookingDetailsBloc>(
      () => blocModule.getABookingDetailsBloc(
            gh<_i244.BookingsRepository>(),
            gh<_i527.FailureBloc>(),
          ));
  gh.lazySingleton<_i780.ClientDetailsBloc>(
      () => blocModule.getClientDetailsBloc(
            gh<_i244.BookingsRepository>(),
            gh<_i527.FailureBloc>(),
          ));
  gh.lazySingleton<_i1002.AuthRepository>(
      () => repositoriesModule.getAuthRepository(
            gh<_i442.UserPreferences>(),
            gh<_i167.AuthService>(),
          ));
  gh.lazySingleton<_i148.AdminEmployeeRepository>(() => repositoriesModule
      .getAdminEmployeeRepository(gh<_i189.AdminEmployeeService>()));
  gh.lazySingleton<_i376.BranchRepository>(
      () => repositoriesModule.getBranchRepository(gh<_i320.BranchService>()));
  gh.lazySingleton<_i800.NotificationRepository>(() => repositoriesModule
      .getNotificationRepository(gh<_i307.NotificationService>()));
  gh.lazySingleton<_i946.EmployeeRepository>(() =>
      repositoriesModule.getEmployeeRepository(gh<_i481.EmployeeService>()));
  gh.lazySingleton<_i570.CalendarRepository>(() =>
      repositoriesModule.getCalendarRepository(gh<_i509.CalendarService>()));
  gh.lazySingleton<_i1037.CreateBookingBloc>(
      () => blocModule.getCreateBookingBloc(
            gh<_i244.BookingsRepository>(),
            gh<_i570.CalendarRepository>(),
            gh<_i946.EmployeeRepository>(),
            gh<_i148.AdminEmployeeRepository>(),
            gh<_i527.FailureBloc>(),
          ));
  gh.lazySingleton<_i424.AppointmentsBloc>(() => blocModule.getAppointmentsBloc(
        gh<_i570.CalendarRepository>(),
        gh<_i148.AdminEmployeeRepository>(),
        gh<_i527.FailureBloc>(),
      ));
  gh.lazySingleton<_i216.ProfileBloc>(() => blocModule.getProfileBloc(
        gh<_i527.FailureBloc>(),
        gh<_i946.EmployeeRepository>(),
        gh<_i148.AdminEmployeeRepository>(),
        gh<_i376.BranchRepository>(),
        gh<_i442.UserPreferences>(),
      ));
  gh.lazySingleton<_i871.UnreadNotificationBloc>(
      () => blocModule.getUnreadNotificationsBloc(
            gh<_i946.EmployeeRepository>(),
            gh<_i527.FailureBloc>(),
          ));
  gh.lazySingleton<_i16.NotificationListBloc>(
      () => blocModule.getNotificationListBloc(
            gh<_i800.NotificationRepository>(),
            gh<_i527.FailureBloc>(),
          ));
  gh.lazySingleton<_i537.AuthBloc>(() => blocModule.getLoginBloc(
        gh<_i527.FailureBloc>(),
        gh<_i1002.AuthRepository>(),
        gh<_i946.EmployeeRepository>(),
        gh<_i442.UserPreferences>(),
      ));
  return getIt;
}

class _$DioNetwork extends _i611.DioNetwork {}

class _$RegisterModule extends _i1015.RegisterModule {}

class _$BlocModule extends _i29.BlocModule {}

class _$PreferencesModule extends _i29.PreferencesModule {}

class _$ServicesModule extends _i761.ServicesModule {}

class _$RepositoriesModule extends _i344.RepositoriesModule {}
