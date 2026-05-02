import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' as easy;

import '../di/app_context.dart';

String getLocaleString() {
  return NavigationService.navigatorKey.currentContext?.locale.languageCode ??
      'ar';
}

TextDirection getTextDirection() {
  return getLocaleString() == 'ar' ? TextDirection.rtl : TextDirection.ltr;
}

bool isArabic(){
  return getLocaleString() == 'ar';
}

bool isEnglish(){
  return getLocaleString() == 'en';
}

