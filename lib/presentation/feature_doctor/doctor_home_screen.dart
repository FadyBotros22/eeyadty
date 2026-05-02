import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/di/dependency_injection.dart';
import '../../domain/repositories/doctor_repository.dart';
import '../../domain/utils/app_constants.dart';
import '../feature_home/persona_selection_screen.dart';
import 'bloc/doctor_home_bloc.dart';
import 'tabs/doctor_patients_tab.dart';
import 'tabs/doctor_profile_tab.dart';
import 'tabs/doctor_schedule_tab.dart';

class DoctorHomeScreen extends StatefulWidget {
  static const route = '/doctor-home';

  const DoctorHomeScreen({super.key});

  @override
  State<DoctorHomeScreen> createState() => _DoctorHomeScreenState();
}

class _DoctorHomeScreenState extends State<DoctorHomeScreen> {
  int _currentIndex = 0;

  final _tabs = const [
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
            context
                .read<DoctorHomeBloc>()
                .add(DoctorHomeTabChanged(i));
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
        color: Colors.white,
        border: Border(
          top: BorderSide(color: AppColors.inputBorder, width: 1),
        ),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 64,
          child: Row(
            children: [
              _NavItem(
                icon: Icons.calendar_today_outlined,
                label: 'Schedule',
                isSelected: currentIndex == 0,
                onTap: () => onTap(0),
              ),
              _NavItem(
                icon: Icons.assignment_outlined,
                label: 'Patients',
                isSelected: currentIndex == 1,
                onTap: () => onTap(1),
              ),
              _NavItem(
                icon: Icons.person_outline,
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
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color =
        isSelected ? AppColors.primary : AppColors.textSecondary;

    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 24),
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
