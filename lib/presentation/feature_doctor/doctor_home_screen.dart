import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/di/dependency_injection.dart';
import '../../domain/utils/app_constants.dart';
import '../feature_home/persona_selection_screen.dart';
import 'bloc/doctor_home_bloc.dart';
import 'tabs/doctor_patients_tab.dart';
import 'tabs/doctor_profile_tab.dart';
import 'tabs/doctor_schedule_tab.dart';

class DoctorHomeScreen extends StatelessWidget {
  static const route = '/doctor-home';

  const DoctorHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // registerFactory so every DoctorHomeScreen gets a fresh bloc
      create: (_) =>
      getIt<DoctorHomeBloc>()..add(DoctorHomeStarted()),
      child: const _DoctorHomeView(),
    );
  }
}

class _DoctorHomeView extends StatefulWidget {
  const _DoctorHomeView();

  @override
  State<_DoctorHomeView> createState() => _DoctorHomeViewState();
}

class _DoctorHomeViewState extends State<_DoctorHomeView> {
  int _currentIndex = 0;

  static const _tabs = [
    DoctorScheduleTab(),
    DoctorPatientsTab(),
    DoctorProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocListener<DoctorHomeBloc, DoctorHomeState>(
      listener: (context, state) {
        if (state is DoctorHomeLoggedOut) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            PersonaSelectionScreen.route,
                (_) => false,
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: BlocBuilder<DoctorHomeBloc, DoctorHomeState>(
            builder: (context, state) {
              if (state is DoctorHomeLoading) {
                return const Center(
                  child: CircularProgressIndicator(
                      color: AppColors.primary),
                );
              }
              if (state is DoctorHomeError) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Text(state.message,
                        style: AppTextStyles.body,
                        textAlign: TextAlign.center),
                  ),
                );
              }
              return IndexedStack(
                index: _currentIndex,
                children: _tabs,
              );
            },
          ),
        ),
        bottomNavigationBar: _DoctorBottomNav(
          currentIndex: _currentIndex,
          onTap: (i) {
            setState(() => _currentIndex = i);
            context.read<DoctorHomeBloc>().add(DoctorHomeTabChanged(i));
          },
        ),
      ),
    );
  }
}

// ── Bottom Navigation Bar ──────────────────────────────────────────────────

class _DoctorBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const _DoctorBottomNav({
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              _NavItem(
                icon: Icons.calendar_today_outlined,
                activeIcon: Icons.calendar_today_rounded,
                label: 'Schedule',
                isSelected: currentIndex == 0,
                onTap: () => onTap(0),
              ),
              _NavItem(
                icon: Icons.assignment_outlined,
                activeIcon: Icons.assignment_rounded,
                label: 'Patients',
                isSelected: currentIndex == 1,
                onTap: () => onTap(1),
              ),
              _NavItem(
                icon: Icons.person_outline_rounded,
                activeIcon: Icons.person_rounded,
                label: 'Profile',
                isSelected: currentIndex == 2,
                onTap: () => onTap(2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? AppColors.primary : AppColors.textSecondary;
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.primary.withValues(alpha: 0.1)
                    : Colors.transparent,
                borderRadius:
                BorderRadius.circular(AppDimens.radiusFull),
              ),
              child: Icon(isSelected ? activeIcon : icon,
                  color: color, size: 24),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontFamily: 'Outfit',
                fontSize: 11,
                fontWeight:
                isSelected ? FontWeight.w600 : FontWeight.w400,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
