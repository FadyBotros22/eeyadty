import 'package:flutter/material.dart';
import '../feature_auth/login_screen.dart';
import '../feature_auth/signup_screen.dart';
import '../feature_client/client_home_screen.dart';
import '../feature_home/persona_selection_screen.dart';
import '../splash/splash_screen.dart';

class RouterGenerator {
  static const String splashRoute = '/splash';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    Widget child;

    switch (settings.name) {
      case PersonaSelectionScreen.route:
        child = const PersonaSelectionScreen();
        break;

      case LoginScreen.route:
        child = const LoginScreen();
        break;

      case SignUpScreen.route:
        child = const SignUpScreen();
        break;

      case ClientHomeScreen.route:
        child = const ClientHomeScreen();
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
