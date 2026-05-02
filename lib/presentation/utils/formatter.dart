import 'package:easy_localization/easy_localization.dart';
import 'package:eeyadty/presentation/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

import '../../domain/di/app_context.dart';
import '../../domain/utils/locale_helper.dart';
import '../../gen/locale_keys.g.dart';

class Formatter {
  static String getServiceString(int numberOfServices) {
    String serviceString = '';
    if (numberOfServices == 1) {
      serviceString = LocaleKeys.service.tr();
      if (getLocaleString() == 'ar') {
        return serviceString;
      }
    } else if (numberOfServices == 2) {
      serviceString = LocaleKeys.service2.tr();
      if (getLocaleString() == 'ar') {
        return serviceString;
      }
    } else if (numberOfServices > 2 && numberOfServices < 11) {
      serviceString = LocaleKeys.services310.tr();
    } else {
      serviceString = LocaleKeys.services.tr();
    }
    return '${Formatter.convertToArabicNumbers(numberOfServices.toString())} $serviceString';
  }

  static String convertStringToTitleCase(String? title) {
    return title
            ?.split(' ')
            .map((word) => word.isNotEmpty
                ? '${word[0].toUpperCase()}${word.substring(1)}'
                : '')
            .join(' ') ??
        '';
  }

  static String formatDate(DateTime? date, bool localized) {
    if (date == null) return ('null date');
    final format =
        DateFormat('MM/dd/yyyy', localized ? getLocaleString() : 'en');
    return format.format(date);
  }

  static String formatHour(DateTime? date, bool localized) {
    if (date == null) return ('null date');
    final format = DateFormat('hh:mm a', localized ? getLocaleString() : 'en');
    return format.format(date);
  }

  static String formatServerDate(DateTime? date, bool localized) {
    if (date == null) return ('null date');
    final format =
        DateFormat('yyyy-MM-ddThh:mm:ss', localized ? getLocaleString() : 'en');
    return format.format(date);
  }

  static String formatDateYYYYMMDD(DateTime? date, bool localized) {
    if (date == null) return ('null date');
    final format =
        DateFormat('yyyy-MM-dd', localized ? getLocaleString() : 'en');
    return format.format(date);
  }

  static String formatDateYYYYMMDDSlashed(DateTime? date, bool localized) {
    if (date == null) return ('null date');
    final format =
        DateFormat('yyyy/MM/dd', localized ? getLocaleString() : 'en');
    return format.format(date);
  }

  static String formatDateMonthYear(DateTime? date, bool localized) {
    if (date == null) return ('null date');
    final format =
        DateFormat('MMMM, yyyy', localized ? getLocaleString() : 'en');
    return format.format(date);
  }

  static String formatDateReversed(DateTime? date, bool localized) {
    if (date == null) return ('null date');
    final format =
        DateFormat('yyyy/MM/dd', localized ? getLocaleString() : 'en');
    return format.format(date);
  }

  static String formatDateDetailedDay(DateTime? date, bool localized) {
    if (date == null) return 'null date';

    final locale = localized ? getLocaleString() : 'en';

    final formatted = DateFormat('EEE, dd MMM yyyy', locale).format(date);

    return formatted;
  }

  static String formatDateDMMMy(DateTime? date, bool localized) {
    if (date == null) return ('null date');
    final format = DateFormat('d MMM y', localized ? getLocaleString() : 'en');
    return format.format(date);
  }

  static String formatDateDayName(DateTime? date, bool localized) {
    if (date == null) return ('null date');
    final format = DateFormat('EEE', localized ? getLocaleString() : 'en');
    return format.format(date);
  }

  static String formatDateDayDate(DateTime? date, bool localized) {
    if (date == null) return ('null date');
    final format = DateFormat('dd', localized ? getLocaleString() : 'en');
    return format.format(date);
  }

  static String formatDetailedDateTime(DateTime? date, bool localized) {
    if (date == null) return ('null date');
    final format =
        DateFormat('d MMM yyyy, h:mma', localized ? getLocaleString() : 'en');

    return format.format(date);
  }

  static String formattedTime12SingleDigit(TimeOfDay? time) {
    if (time == null) {
      return '';
    }
    int hour = time.hour;
    if (time.hour > 12) hour -= 12;
    return '${hour.toString()}:${time.minute.toString().padLeft(2, '0')}';
  }

  // user to format time in for 12 hour system
  static String formattedTime12AndDayPeriod(TimeOfDay? time) {
    if (time == null) {
      debugPrint('time is null');
      return '';
    }

    // Get localized AM/PM
    String dayPeriod =
        time.period == DayPeriod.am ? LocaleKeys.am.tr() : LocaleKeys.pm.tr();

    // Format the hour and adjust for 12-hour format
    int hour = time.hour;
    if (hour == 0) {
      hour = 12; // Midnight
    } else if (hour > 12) {
      hour -= 12;
    }

    // Localized time components (e.g., Arabic numerals)
    String? hourStr = convertToArabicNumbers(hour.toString().padLeft(2, '0'));

    String? minuteStr =
        convertToArabicNumbers(time.minute.toString().padLeft(2, '0'));

    // Construct the final string
    return '$hourStr:$minuteStr   $dayPeriod';
  }

  // full date and time en
  static String formatDateTime(DateTime? dt, bool localized) {
    if (dt == null) {
      debugPrint('date is null ');
      return '';
    }
    return DateFormat(
            'MMM dd, yyyy \'at\' h:mma',
            localized
                ? NavigationService
                    .navigatorKey.currentContext?.locale.languageCode
                : null)
        .format(dt);
  }

  // user to format time in for 24 hour system
  static String formattedTime(TimeOfDay? time) {
    if (time == null) {
      debugPrint('time is null ');
      return '';
    }
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }

  // user to format time in for 12 hour system
  static String formattedTime12(TimeOfDay? time) {
    if (time == null) {
      debugPrint('time is null ');
      return '';
    }
    // Format the hour and adjust for 12-hour format
    int hour = time.hour;
    if (hour == 0) {
      hour = 12; // Midnight
    } else if (hour > 12) {
      hour -= 12;
    }

    // Localized time components (e.g., Arabic numerals)
    String? hourStr = convertToArabicNumbers(hour.toString().padLeft(2, '0'));

    String? minuteStr =
        convertToArabicNumbers(time.minute.toString().padLeft(2, '0'));

    return '$hourStr:$minuteStr';
  }

  // set an allowed digits number for doubles
  static String doubleToString(double? doubleValue, {int? maxDigits = 0}) {
    double value = doubleValue ?? 0.0;
    if (doubleValue!.round() == doubleValue) {
      return doubleValue.round().toString();
    } else {
      if (maxDigits == null) {
        return value.toString().replaceAll(RegExp(r'([.]*0)(?!.*\d)'), "");
      } else {
        return value
            .toStringAsFixed(maxDigits)
            .replaceAll(RegExp(r'([.]*0)(?!.*\d)'), "");
      }
    }
  }

  static String hideDigits(String cardNumber) {
    if (cardNumber.length <= 4) {
      return cardNumber;
    }
    String lastFourDigits = cardNumber.substring(cardNumber.length - 4);
    String hiddenDigits = '*' * (cardNumber.length - 4);
    String formattedNumber = hiddenDigits + lastFourDigits;

    // Format the number into groups of four characters
    String formattedNumberWithSpaces = '';
    for (int i = 0; i < formattedNumber.length; i++) {
      if (i % 4 == 0 && i != 0) {
        formattedNumberWithSpaces += ' ';
      }
      formattedNumberWithSpaces += formattedNumber[i];
    }

    return formattedNumberWithSpaces;
  }

  static String displayPrice(String? input, String? currency) {
    return '${currency?.tr(args: [
          Formatter.convertToArabicNumbers(input) ?? ''
        ])}';
  }

  // Helper function to convert numbers to Arabic numerals
  static String? convertToArabicNumbers(String? input) {
    if (input == null) return '';

    if (getLocaleString() == 'ar') {
      const arabicNumbers = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
      bool hasPlus = input.contains('+');
      String cleanedInput = input.replaceAll('+', '');

      String converted = cleanedInput.split('').map((char) {
        int? digit = int.tryParse(char);
        return digit != null ? arabicNumbers[digit] : char;
      }).join('');

      return hasPlus ? '$converted+' : converted;
    }
    return input;
  }
}

String getAbbrDays(String fullDay) {
  Map<String, String> daysAbbr = {
    "Monday": "Mon",
    "Tuesday": "Tue",
    "Wednesday": "Wed",
    "Thursday": "Thu",
    "Friday": "Fri",
    "Saturday": "Sat",
    "Sunday": "Sun"
  };
  return daysAbbr[fullDay] ?? '';
}

extension DateTimeExtension on DateTime {
  DateTime fromTimeOfDay(TimeOfDay timeOfDay) {
    DateTime now = DateTime.now();
    return DateTime(
        now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
  }

  int fromTimeOfDayToMilliSeconds(TimeOfDay timeOfDay) {
    return fromTimeOfDay(timeOfDay).millisecondsSinceEpoch;
  }

  String formatDateTimeDayNumberMon() {
    getLocaleString() == 'ar' ? Jiffy.setLocale('ar') : Jiffy.setLocale('en');
    return Jiffy.parseFromDateTime(this).format(pattern: 'do MMM');
  }
}

extension TimeOfDayExtension on TimeOfDay {
  TimeOfDay plusMinutes(int minutes) {
    if (minutes == 0) {
      return this;
    } else {
      int totalDayMinutes = 1440;
      int totalMinFromDayStart = hour * 60 + minute;
      int newTotalMinFromDayStart = ((minutes % totalDayMinutes) +
              totalMinFromDayStart +
              totalDayMinutes) %
          totalDayMinutes;
      if (totalMinFromDayStart == newTotalMinFromDayStart) {
        return this;
      } else {
        int newHour = newTotalMinFromDayStart ~/ 60;
        int newMinute = newTotalMinFromDayStart % 60;
        return TimeOfDay(hour: newHour, minute: newMinute);
      }
    }
  }

  DateTime toDateTime() {
    DateTime now = DateTime.now();
    return DateTime(now.year, now.month, now.day, hour, minute);
  }

  int toMilliSeconds() {
    return toDateTime().millisecondsSinceEpoch;
  }

  int toMinutes() {
    int hours = hour * 60;
    return hours + minute;
  }

  TimeOfDay fromMilliseconds(int milliseconds) {
    int totalMinutes = milliseconds ~/ (1000 * 60);
    int hours = totalMinutes ~/ 60;
    int minutes = totalMinutes % 60;

    // Make sure hours are within 0-23 range
    hours = hours % 24;

    return TimeOfDay(hour: hours, minute: minutes);
  }

  TimeOfDay fromMinutes(int startMinutes) {
    int hours = startMinutes ~/ 60;
    int minutes = startMinutes % 60;

    // Make sure hours are within 0-23 range
    hours = hours % 24;

    return TimeOfDay(hour: hours, minute: minutes);
  }
}

extension Clock on int {
  String minutesToTime({bool shouldAddAbb = true}) {
    final int hours24 = this ~/ 60;
    final int minutes = this % 60;

    final bool isAm = hours24 < 12;
    int hours12 = hours24 % 12;
    if (hours12 == 0) hours12 = 12;

    final String hourStr = hours12.toString().padLeft(2, '0');
    final String minuteStr = minutes.toString().padLeft(2, '0');
    final String period = isAm ? 'AM' : 'PM';
    String fullTime = '$hourStr:$minuteStr${shouldAddAbb ? ' $period' : ''}';
    if(isArabic()){
      fullTime = fullTime.convertEnglishToArabicNumerals();
    }
    return fullTime;
  }

  String period() {
    final int hours24 = this ~/ 60;
    final bool isAm = hours24 < 12;
    int hours12 = hours24 % 12;
    if (hours12 == 0) hours12 = 12;
    final String period = isAm
        ? isArabic()
            ? 'ص'
            : 'AM'
        : isArabic()
            ? 'م'
            : 'PM';
    return period;
  }
}
