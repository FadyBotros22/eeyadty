import 'package:flutter/material.dart';
import '../../domain/utils/app_constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo / icon
            Container(
              width: 88,
              height: 88,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: const Icon(
                Icons.medical_services_rounded,
                color: AppColors.primary,
                size: 48,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'eeyadty',
              style: AppTextStyles.h1.copyWith(
                color: Colors.white,
                fontSize: 32,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Your Health, Your Schedule',
              style: AppTextStyles.body.copyWith(
                color: Colors.white.withOpacity(0.8),
              ),
            ),
            const SizedBox(height: 48),
            const CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 2,
            ),
          ],
        ),
      ),
    );
  }
}
