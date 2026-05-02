import 'package:flutter/material.dart';
import '../../domain/models/enums/user_role.dart';
import '../../domain/utils/app_constants.dart';
import '../feature_auth/login_screen.dart';

class PersonaSelectionScreen extends StatelessWidget {
  static const route = '/persona-selection';

  const PersonaSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppDimens.paddingLG),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              // Header
              Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(AppDimens.radiusMD),
                    ),
                    child: const Icon(
                      Icons.medical_services_rounded,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'eeyadty',
                    style: AppTextStyles.h2.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 48),
              Text(
                'Welcome!',
                style: AppTextStyles.h1,
              ),
              const SizedBox(height: 8),
              Text(
                'How would you like to continue?',
                style:
                    AppTextStyles.body.copyWith(color: AppColors.textSecondary),
              ),
              const SizedBox(height: 40),
              // Client card
              _PersonaCard(
                icon: Icons.person_rounded,
                title: 'I\'m a Patient',
                subtitle:
                    'Book appointments, browse services, and manage your health journey.',
                color: AppColors.primary,
                onTap: () {
                  Navigator.of(context).pushNamed(
                    LoginScreen.route,
                   arguments: LoginScreenArguments(role: UserRole.patient),
                  );
                },
              ),
              const SizedBox(height: 16),
              // Doctor card (placeholder)
              _PersonaCard(
                icon: Icons.local_hospital_rounded,
                title: 'I\'m a Doctor',
                subtitle:
                    'Manage your schedule, view patient appointments, and clinic settings.',
                color: AppColors.accent,
                onTap: () {
                  Navigator.of(context).pushNamed(
                    LoginScreen.route,
                    arguments: LoginScreenArguments(role: UserRole.doctor),
                  );
                },
              ),
              const Spacer(),
              Center(
                child: Text(
                  'By continuing you agree to our Terms & Privacy Policy',
                  style: AppTextStyles.bodySmall,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}

class _PersonaCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  const _PersonaCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppDimens.paddingLG),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppDimens.radiusLG),
          border: Border.all(color: AppColors.divider),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadow,
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(AppDimens.radiusMD),
              ),
              child: Icon(icon, color: color, size: 28),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyles.h3),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: AppTextStyles.bodySmall,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppColors.textHint,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
