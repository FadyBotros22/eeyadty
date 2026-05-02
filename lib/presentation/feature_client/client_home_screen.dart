import 'package:eeyadty/presentation/feature_client/tabs/appointments/bloc/appointments_event.dart';
import 'package:eeyadty/presentation/feature_client/tabs/profile/bloc/profile_event.dart';
import 'package:eeyadty/presentation/feature_client/tabs/services/bloc/doctors_bloc.dart';
import 'package:eeyadty/presentation/feature_client/tabs/services/bloc/doctors_event.dart';
import 'package:eeyadty/presentation/feature_client/tabs/services/doctors_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/preferences/user_preferences.dart';
import '../../domain/di/dependency_injection.dart';
import '../../domain/models/enums/user_role.dart';
import '../../domain/repositories/doctors_repository.dart';
import '../../domain/repositories/appointment_repository.dart';
import '../../domain/repositories/profile_repository.dart';
import '../../domain/utils/app_constants.dart';
import 'bloc/client_home_bloc.dart';
import 'tabs/appointments/appointments_tab.dart';
import 'tabs/profile/profile_tab.dart';
import 'tabs/appointments/bloc/appointments_bloc.dart';
import 'tabs/profile/bloc/profile_bloc.dart';

class ClientHomeScreen extends StatelessWidget {
  static const route = '/client-home';

  const ClientHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => DoctorsBloc(getIt<DoctorsRepository>())
            ..add(const DoctorsEvent.load()),
        ),
        BlocProvider(
          create: (_) => AppointmentsBloc(getIt<AppointmentRepository>()),
        ),
        BlocProvider(
          create: (_) => ProfileBloc(getIt<ProfileRepository>()),
        ),
        BlocProvider.value(value: getIt<ClientHomeBloc>()),
      ],
      child: const _ClientHomeView(),
    );
  }
}

class _ClientHomeView extends StatefulWidget {
  const _ClientHomeView();

  static const _tabs = [
    DoctorsTab(),
    AppointmentsTab(),
    ProfileTab(),
  ];

  @override
  State<_ClientHomeView> createState() => _ClientHomeViewState();
}

class _ClientHomeViewState extends State<_ClientHomeView> {
  @override
  void initState() {
    context.read<ClientHomeBloc>().selectTab(0);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientHomeBloc, int>(
      builder: (context, selectedIndex) {
        return Scaffold(
          backgroundColor: AppColors.background,
          body: IndexedStack(
            index: selectedIndex,
            children: _ClientHomeView._tabs,
          ),
          bottomNavigationBar: _BottomNavBar(
            selectedIndex: selectedIndex,
            onTap: (i) {
              switch(i){
                case 0:
                  context.read<DoctorsBloc>().add(const DoctorsEvent.load());
                  break;
                  case 1:
                    context
                        .read<AppointmentsBloc>()
                        .add(AppointmentsEvent.load(getIt<UserPreferences>().currentUser.id ?? ''));
                    break;
                case 2:
                  context.read<ProfileBloc>().add(ProfileEvent.load(userId : getIt<UserPreferences>().currentUser.id ?? '', role: UserRole.patient));
                  break;
              }
              context.read<ClientHomeBloc>().selectTab(i);
            },
          ),
        );
      },
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;

  const _BottomNavBar({required this.selectedIndex, required this.onTap});

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
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.paddingMD,
            vertical: AppDimens.paddingSM,
          ),
          child: Row(
            children: [
              _NavItem(
                icon: Icons.people_outline_rounded,
                activeIcon: Icons.people_rounded,
                label: 'Doctors',
                isActive: selectedIndex == 0,
                onTap: () => onTap(0),
              ),
              _NavItem(
                icon: Icons.calendar_today_outlined,
                activeIcon: Icons.calendar_today_rounded,
                label: 'Appointments',
                isActive: selectedIndex == 1,
                onTap: () => onTap(1),
              ),
              _NavItem(
                icon: Icons.person_outline_rounded,
                activeIcon: Icons.person_rounded,
                label: 'Profile',
                isActive: selectedIndex == 2,
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
  final bool isActive;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 6),
                decoration: BoxDecoration(
                  color: isActive
                      ? AppColors.primary.withValues(alpha: 0.1)
                      : Colors.transparent,
                  borderRadius:
                      BorderRadius.circular(AppDimens.radiusFull),
                ),
                child: Icon(
                  isActive ? activeIcon : icon,
                  color: isActive
                      ? AppColors.primary
                      : AppColors.textSecondary,
                  size: 24,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: AppTextStyles.label.copyWith(
                  color: isActive
                      ? AppColors.primary
                      : AppColors.textSecondary,
                  fontWeight:
                      isActive ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
