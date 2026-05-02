import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/di/dependency_injection.dart';
import '../../domain/repositories/doctor_repository.dart';
import '../feature_auth/login_screen.dart';
import '../feature_auth/signup_screen.dart';
import '../feature_client/client_home_screen.dart';
import '../feature_doctor/bloc/doctor_home_bloc.dart';
import '../feature_doctor/doctor_home_screen.dart';
import '../feature_home/persona_selection_screen.dart';

class RouterGenerator {
  static const String splashRoute = '/splash';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    Widget child;

    switch (settings.name) {
      case PersonaSelectionScreen.route:
        child = const PersonaSelectionScreen();
        break;

      case LoginScreen.route:
        var args = settings.arguments as LoginScreenArguments;
        child = LoginScreen(role: args.role,);
        break;

      case SignUpScreen.route:
        var args = settings.arguments as LoginScreenArguments;
        child = SignUpScreen(role: args.role);
        break;

      case ClientHomeScreen.route:
        child = const ClientHomeScreen();
        break;

      case DoctorHomeScreen.route:
        child = child = BlocProvider(
          create: (_) =>
              DoctorHomeBloc(getIt<DoctorRepository>()),
          child: DoctorHomeScreen(),
        );
        break;


      default:
        child = const PersonaSelectionScreen();
    }

    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (_, animation, __) => child,
      transitionsBuilder: (_, animation, __, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 250),
    );
  }
}
