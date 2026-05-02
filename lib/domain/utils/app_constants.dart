import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Primary palette – deep teal/medical
  static const Color primary = Color(0xFF0D6E8A);
  static const Color primaryLight = Color(0xFF1A8FAD);
  static const Color primaryDark = Color(0xFF095470);
  static const Color accent = Color(0xFF4ECDC4);

  // Backgrounds
  static const Color background = Color(0xFFF5F7FA);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color cardSurface = Color(0xFFFFFFFF);

  // Text
  static const Color textPrimary = Color(0xFF1A2332);
  static const Color textSecondary = Color(0xFF6B7A8D);
  static const Color textHint = Color(0xFFADB5C1);

  // Status
  static const Color success = Color(0xFF2ECC71);
  static const Color warning = Color(0xFFF39C12);
  static const Color error = Color(0xFFE74C3C);

  // Misc
  static const Color divider = Color(0xFFECEFF4);
  static const Color shadow = Color(0x14000000);
  static const Color inputBorder = Color(0xFFDDE1E8);
}

class AppTextStyles {
  AppTextStyles._();

  static const TextStyle h1 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    height: 1.2,
  );

  static const TextStyle h2 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    height: 1.3,
  );

  static const TextStyle h3 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const TextStyle body = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    height: 1.5,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.4,
  );

  static const TextStyle label = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    letterSpacing: 0.5,
  );

  static const TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    letterSpacing: 0.3,
  );
}

class AppDimens {
  AppDimens._();

  static const double paddingXS = 4;
  static const double paddingSM = 8;
  static const double paddingMD = 16;
  static const double paddingLG = 24;
  static const double paddingXL = 32;

  static const double radiusSM = 8;
  static const double radiusMD = 12;
  static const double radiusLG = 16;
  static const double radiusXL = 24;
  static const double radiusFull = 100;

  static const double cardElevation = 2;
}
