import 'package:eeyadty/domain/repositories/doctors_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/preferences/user_preferences.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/repositories/appointment_repository.dart';
import '../../domain/repositories/profile_repository.dart';
import '../../../presentation/feature_auth/bloc/auth_bloc.dart';
import '../../../presentation/feature_client/bloc/client_home_bloc.dart';
import '../repositories/doctor_repository.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  // SharedPreferences
  final prefs = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(prefs);
  getIt.registerSingleton<UserPreferences>(UserPreferences(prefs));

  // Repositories
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepository());
  getIt.registerLazySingleton<DoctorsRepository>(() => DoctorsRepository());
  getIt.registerLazySingleton<AppointmentRepository>(
      () => AppointmentRepository());
  getIt.registerLazySingleton<ProfileRepository>(() => ProfileRepository());
  getIt.registerLazySingleton<DoctorRepository>(
        () => DoctorRepository(),
  );
  // Blocs (singletons so they survive navigation)
  getIt.registerLazySingleton<AuthBloc>(
      () => AuthBloc(getIt<AuthRepository>(), getIt<UserPreferences>()));
  getIt.registerLazySingleton<ClientHomeBloc>(() => ClientHomeBloc());
}
