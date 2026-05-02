import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../domain/di/dependency_injection.dart';
import '../domain/utils/app_constants.dart';
import 'app_initializer_screen.dart';
import 'feature_auth/bloc/auth_bloc.dart';
import 'navigation/router_generator.dart';

class Eeyadty extends StatelessWidget {
  const Eeyadty({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: getIt<AuthBloc>()),
      ],
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          final focus = FocusScope.of(context);
          if (!focus.hasPrimaryFocus && focus.focusedChild != null) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'eeyadty',
          initialRoute: AppInitializerScreen.route,
          onGenerateRoute: RouterGenerator.generateRoute,
          theme: _buildTheme(),
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context)
                  .copyWith(textScaler: TextScaler.noScaling),
              child: child ?? const SizedBox.shrink(),
            );
          },
        ),
      ),
    );
  }

  ThemeData _buildTheme() {
    return ThemeData(
      useMaterial3: false,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
      fontFamily: 'Outfit',
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.accent,
        surface: AppColors.surface,
        error: AppColors.error,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.surface,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.textPrimary),
        titleTextStyle: AppTextStyles.h3,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.radiusMD),
          ),
        ),
      ),
      textTheme: const TextTheme(
        titleLarge: AppTextStyles.h2,
        titleMedium: AppTextStyles.h3,
        bodyLarge: AppTextStyles.body,
        bodyMedium: AppTextStyles.bodySmall,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.background,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimens.radiusMD),
          borderSide: const BorderSide(color: AppColors.inputBorder),
        ),
      ),
      tabBarTheme: const TabBarThemeData(  // <-- Changed from TabBarTheme
        labelColor: Colors.white,
        unselectedLabelColor: AppColors.textSecondary,
        indicatorColor: AppColors.primary,
      ),
    );
  }
}
