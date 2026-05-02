import 'package:flutter/cupertino.dart';

class ColorConstants {
  static Color white = const Color(0xffffffff);
  static Color whiteOpc20 = const Color(0x33ffffff);
  static Color lightOrange = const Color(0xffFFECE0);
  static Color darkBlue = const Color(0xff050A30);
  static Color grey = const Color(0xffC3C4CD);
  static Color mainTextColor = const Color(0xff696C83);
  static Color textSecondaryColor = const Color(0xff9B9DAC);
  static Color textThirdColor = const Color(0xff414562);
  static Color primaryAppColor = const Color(0xFFF76513);
  static Color secondaryAppColor = const Color(0xFFE0EDC3);

  static Color chipColor = const Color(0x52FFDECB);
  static Color oceanBlue = const Color(0xFF345484);
  static Color primaryColor8 = darkBlue.withValues(alpha: 0.08);
  static Color primaryColor4 = darkBlue.withValues(alpha: 0.04);

  static Color primaryColor03 = darkBlue.withValues(alpha: 0.03);
  static Color primaryColor05 = darkBlue.withValues(alpha: 0.05);
  static Color primaryColor10 = darkBlue.withValues(alpha: 0.1);
  static Color primaryColor20 = darkBlue.withValues(alpha: 0.2);
  static Color primaryColor24 = darkBlue.withValues(alpha: 0.24);
  static Color primaryColor32 = darkBlue.withValues(alpha: 0.32);
  static Color primaryColor40 = darkBlue.withValues(alpha: 0.4);
  static Color primaryColor60 = darkBlue.withValues(alpha: 0.6);
  static Color primaryColor72 = darkBlue.withValues(alpha: 0.72);
  static Color primaryColor76 = darkBlue.withValues(alpha: 0.76);
  static Color primaryColor80 = darkBlue.withValues(alpha: 0.8);

  static Color lightGrey = const Color.fromRGBO(3, 8, 26, 0.04);
  static Color borderColor = const Color(0xffEBEBEE);
  static Color selectBorderColor = const Color(0xffD0D0D0);
  static Color bookingDetailsBgColor = const Color(0xffF8F8F9);

  static Color redColor = const Color(0xFFDD5147);

  static Color errorBgColor = const Color(0xFFFFEBEB);
  static Color errorBorderColor = const Color(0xFFFF3434);

  static Color redShadeColor = const Color(0xffEB4335);
  static Color redShadeColorWithOpacity =
      primaryAppColor.withValues(alpha: 0.1);

  static Color transparent = const Color(0x00000000);

  static Color pinkGlow = const Color(0xffFFECE0);

  static Color lightGray = const Color(0xffC9C9C9);
  static Color veryLightGray = const Color(0xfff0f0f0);
  static Color gray700 = const Color(0xff1D2939);

  static Color green = const Color(0xFF00B707);
  static Color red = const Color(0xFFFF0000);

  static Color greenWithOpacityFive = green.withValues(alpha: 0.05);
  static Color redWithOpacityFive = red.withValues(alpha: 0.05);
  static Color vividYellow = const Color(0xFFFFBD03);

  static Color snackBarTextColor = const Color(0xff060a32);

  static Color submitButtonDisabledTex = const Color(0xffA3A3A3);

  static Color borderSideColor = const Color(0xffF8F8F8);

  static Color hintTextColor = const Color(0xff060A32).withValues(alpha: 0.4);

  static Color moneySavedBG = const Color(0xFFE8F8E6);

  static Color greyIconColor = const Color(0xFF9B9DAD);

  static Color calendarBorder = const Color(0xFFD4D6E3);
  static Color calendarSeparator = const Color(0xFFF2F2F2);
  static Color disabledTimeSlotColor = const Color(0xFFF2F2F2);

  static Color calendarCustomerNameColor = const Color(0xFF293E60);
  static Color calendarCompletedAppointmentColor = const Color(0xFFC2F5E9);
  static Color calendarCanceledAppointmentColor = const Color(0xFFFFDED1);
  static Color calendarAutoCanceledAppointmentColor = const Color(0xFFFCEDEE);
  static Color calendarPendingAppointmentColor = const Color(0xFFFDF3E0);
  static Color calendarScheduledAppointmentColor = const Color(0xFFD3E3F8);

  static Color redBgColor = primaryAppColor.withValues(alpha: 0.1);

  static Gradient buttonGradient = const LinearGradient(
    colors: [
      Color(0xFFF76513),
      Color(0xFFE5BF8A),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
