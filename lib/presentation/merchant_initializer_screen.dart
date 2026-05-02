import 'package:eeyadty/presentation/splash/intro_splash.dart';
import 'package:flutter/material.dart';

import '../data/preferences/user_preferences.dart';
import '../domain/di/dependency_injection.dart';
import 'feature_auth/login_screen.dart';
import 'feature_auth/registration/registration_screen.dart';
import 'feature_home/home_screen.dart';

class MerchantInitializerScreen extends StatefulWidget {
  static const route = '/';

  const MerchantInitializerScreen({super.key});

  @override
  State<MerchantInitializerScreen> createState() =>
      _MerchantInitializerScreenState();
}

class _MerchantInitializerScreenState extends State<MerchantInitializerScreen> {
  @override
  void initState() {
    getIt<UserPreferences>()
        .checkUserIfLoggedIn()
        .then((loginState) {
      switch (loginState) {
        case UserLoggingState.loggedIn:
          _pushRoute(HomeScreen.route);
          break;
        case UserLoggingState.firstLaunch:
          _pushRoute(LoginScreen.route);
          break;
        case UserLoggingState.notRegistered:
          _pushRoute(RegistrationScreen.route);
      }
    });
    super.initState();
  }

  void _pushRoute(String route) {
    Navigator.of(context).pushNamedAndRemoveUntil(route, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return const IntroSplash();
  }
}
