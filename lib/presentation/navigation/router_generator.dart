
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/remote/network/failure/failure_bloc.dart';
import '../../domain/utils/utils.dart';
import '../feature_auth/login_screen.dart';
import '../feature_auth/registration/registration_screen.dart';

import '../feature_home/home_screen.dart';
import '../merchant_initializer_screen.dart';
import 'navigation_transitions.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    late Widget child;

    switch (routeSettings.name) {
      case MerchantInitializerScreen.route:
        child = const MerchantInitializerScreen();
        break;

      case LoginScreen.route:
        child = const LoginScreen();
        break;



      case RegistrationScreen.route:
        child = const RegistrationScreen();
        break;

      case HomeScreen.route:
        child = const HomeScreen();
        break;

      default:
        throw Exception();
    }

    Widget childWithErrorWrapper = BlocListener<FailureBloc, FailureState>(
      listener: (context, state) {
        if (state.failure != null && state.failure!.shouldShowToast) {
          showBottomFlash(context,
              message: (state.failure?.userMessage).toString(), isError: true);
        }
      },
      child: child,
    );

    switch (routeSettings.name) {
      default:
        return FadePageRoute(
          builder: (context) {
            return childWithErrorWrapper;
          },
        );
    }
  }
}
