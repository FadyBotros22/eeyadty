import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:eeyadty/presentation/app_setter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_config.dart';
import 'data/preferences/user_preferences.dart';
import 'data/remote/network/interceptors/headers_interceptor.dart';
import 'domain/di/dependency_injection.dart';
import 'domain/utils/app_logger.dart';

Future<void> main() async {
  AppConfig.create(
      baseUrl: 'https://admin.bazz.app/v1',
      flavor: Flavor.production,
      bundleId: 'com.beautisry.merchant',
      appleAppId: '6673881223');
  WidgetsFlutterBinding.ensureInitialized();

  initRootLogger();

  appTimeZone = await getTimezone();

  await EasyLocalization.ensureInitialized();

  EasyLocalization.logger.enableBuildModes = [];
  EasyLocalization.logger.enableLevels = [];

  /// if you have local notifications, init here.
  configureDependencies(environment: 'prod');


  var startLocale = const Locale('ar');

  if (Platform.isIOS && !getIt<UserPreferences>().isFirstAppOpen) {
    final systemLocale = WidgetsBinding.instance.platformDispatcher.locale;
    startLocale = ['ar', 'en'].contains(systemLocale.languageCode)
        ? Locale(systemLocale.languageCode)
        : const Locale('ar');
  }

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(
      EasyLocalization(
        supportedLocales: const [Locale('ar'), Locale('en')],
        path: 'assets/translations',
        fallbackLocale: const Locale('ar'),
        startLocale: startLocale,
        child: const Eeyadty(),
      ),
    );
  });
}
