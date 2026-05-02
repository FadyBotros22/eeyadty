import 'package:beautisry_merchant/data/remote/network/failure/failure_bloc.dart';
import 'package:beautisry_merchant/domain/di/dependency_injection.dart';
import 'package:beautisry_merchant/domain/repositories/auth_repository.dart';
import 'package:beautisry_merchant/presentation/feature_auth/bloc/auth_bloc.dart';
import 'package:beautisry_merchant/presentation/feature_clients/clients_screen.dart';
import 'package:beautisry_merchant/presentation/feature_home/widgets/minimum_app_version_dialog.dart';
import 'package:beautisry_merchant/presentation/feature_profile/bloc/profile_bloc.dart';
import 'package:beautisry_merchant/presentation/feature_profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../data/preferences/user_preferences.dart';
import '../../domain/notifications/notification_manager.dart';
import '../feature_appointments/appointments_screen.dart';
import '../feature_auth/bloc/auth_event.dart';
import '../feature_profile/bloc/profile_event.dart';
import '../widgets/bottom_bar.dart';
import 'bloc/home_bloc.dart';
import 'bloc/home_event.dart';
import 'bloc/home_state.dart';

var versionAppIsLoaded = false;

class HomeScreen extends StatefulWidget {
  static const route = '/home-screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeBloc(getIt<AuthRepository>(), getIt<FailureBloc>()),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  @override
  void initState() {
    getIt<ProfileBloc>().add(const ProfileEvent.getProfile());
    getIt<ProfileBloc>().add(const ProfileEvent.getBranchData());
    NotificationManager.requestNotificationsPermission();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      NotificationManager().handleTappingOnMessage(context);
      NotificationManager().listenToNotificationWhenAppIsTerminated(context);
    });

    if (!getIt<UserPreferences>().isDeviceIdUpdated) {
      getIt<AuthBloc>().add(const AuthEvent.updateDeviceId());
    }

    if (versionAppIsLoaded == false) {
      BlocProvider.of<HomeBloc>(context).add(
        const HomeEvent.getMinimumAppVersion(),
      );
    }

    super.initState();
  }

  static final List<Widget> _screens = <Widget>[
    const AppointmentsScreen(),
    const ClientsScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  bool isVersionAccepted(String currentVersion, String minimumAcceptedVersion) {
    List<String> currentVersionCells = currentVersion.split('.');
    List<String> minimumVersionCells = minimumAcceptedVersion.split('.');
    for (int i = 0; i < 3; i++) {
      if (int.parse(currentVersionCells[i]) > int.parse(minimumVersionCells[i])) {
        return true;
      }
      if (int.parse(currentVersionCells[i]) < int.parse(minimumVersionCells[i])) {
        return false;
      }
    }
    // versions are identical
    return true;
  }

  Future<String> checkVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state.isLoadingMinimumAppVersion == false &&
            versionAppIsLoaded == false &&
            state.minimumAcceptedVersion != null) {
          versionAppIsLoaded = true;
          checkVersion().then((currentVersion) {
            if (!isVersionAccepted(
              currentVersion,
              state.minimumAcceptedVersion ?? '0.0.0',
            ) ||
                !isVersionAccepted(
                  currentVersion,
                  state.currentStoreVersion ?? '0.0.0',
                )) {
              if (context.mounted) {
                showMinimumAppVersionDialog(
                  buildContext: context,
                  isDismiss: false,
                  message: state.message,
                );
              }
            }
          });
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _screens.elementAt(_selectedIndex),
            ],
          ),
          bottomNavigationBar: BottomNavbar(
            activePage: _selectedIndex,
            onChange: _onItemTapped,
          ),
        );
      },
    );
  }
}
