import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../data/remote/network/failure/failure_bloc.dart';
import '../domain/di/app_context.dart';
import '../domain/di/dependency_injection.dart';
import '../domain/utils/locale_helper.dart';
import '../domain/utils/ui_constants.dart';
import 'feature_auth/bloc/auth_bloc.dart';
import 'merchant_initializer_screen.dart';
import 'navigation/router_generator.dart';

class Eeyadty extends StatefulWidget {
  const Eeyadty({super.key});

  @override
  State<Eeyadty> createState() => _EeyadtyState();
}

class _EeyadtyState extends State<Eeyadty> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: MultiProvider(
        providers: [
          BlocProvider(create: (create) => getIt<FailureBloc>()),
          BlocProvider(create: (create) => getIt<AuthBloc>()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: NavigationService.navigatorKey, // set property
          initialRoute: MerchantInitializerScreen.route,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: getThemeData(),
          themeMode: ThemeMode.dark,
          onGenerateRoute: RouterGenerator.generateRoute,
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaler: TextScaler.noScaling,
              ),
              child: child ?? Container(),
            );
          },
        ),
      ),
    );
  }
}

ThemeData getThemeData() {
  return ThemeData(
    primaryColor: ColorConstants.primaryAppColor,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: ColorConstants.darkBlue,
      selectionColor: ColorConstants.lightOrange,
      selectionHandleColor: ColorConstants.primaryAppColor,
    ),
    canvasColor: Colors.white,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    colorScheme: ColorScheme.light(
      surface: Colors.white,
      surfaceTint: ColorConstants.primaryAppColor,
    ),
    fontFamily: getLocaleString() == 'en' ? 'Outfit' : 'Noto',
    sliderTheme: SliderThemeData(
      overlayShape: SliderComponentShape.noOverlay,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      surfaceTintColor: Colors.white,
    ),
    timePickerTheme: TimePickerThemeData(
      backgroundColor: Colors.white,
      helpTextStyle: TextStyle(
        fontSize: 14,
        color: ColorConstants.darkBlue,
      ),
      dialTextStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w800,
        color: ColorConstants.white,
      ),
      dialBackgroundColor: ColorConstants.darkBlue,
      dialHandColor: ColorConstants.primaryAppColor,
      dialTextColor: ColorConstants.white,
      hourMinuteColor: ColorConstants.primaryAppColor,
      hourMinuteTextColor: ColorConstants.darkBlue,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(color: Colors.black),
      titleMedium: TextStyle(color: Colors.black),
      bodyLarge: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black),
    ),
  );
}
