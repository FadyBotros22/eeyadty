import 'package:flutter/material.dart';
import '../data/preferences/user_preferences.dart';
import '../domain/di/dependency_injection.dart';
import 'feature_client/client_home_screen.dart';
import 'feature_home/persona_selection_screen.dart';
import 'splash/splash_screen.dart';

class AppInitializerScreen extends StatefulWidget {
  static const route = '/';

  const AppInitializerScreen({super.key});

  @override
  State<AppInitializerScreen> createState() => _AppInitializerScreenState();
}

class _AppInitializerScreenState extends State<AppInitializerScreen> {
  @override
  void initState() {
    super.initState();
    _checkState();
  }

  Future<void> _checkState() async {
    final loginState =
        await getIt<UserPreferences>().checkUserIfLoggedIn();
    if (!mounted) return;

    switch (loginState) {
      case UserLoggingState.loggedIn:
        _navigate(ClientHomeScreen.route);
        break;
      case UserLoggingState.firstLaunch:
      case UserLoggingState.notRegistered:
        _navigate(PersonaSelectionScreen.route);
        break;
    }
  }

  void _navigate(String route) {
    Navigator.of(context).pushNamedAndRemoveUntil(route, (_) => false);
  }

  @override
  Widget build(BuildContext context) => const SplashScreen();
}
