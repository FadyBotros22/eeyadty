import 'package:beautisry_merchant/domain/di/dependency_injection.dart';
import 'package:beautisry_merchant/presentation/feature_auth/bloc/auth_bloc.dart';
import 'package:beautisry_merchant/presentation/feature_auth/registration/registration_steps/add_image_screen.dart';
import 'package:beautisry_merchant/presentation/feature_auth/registration/registration_steps/select_business_hours/select_business_hours_screen.dart';
import 'package:beautisry_merchant/presentation/feature_auth/registration/registration_steps/select_service/select_services_screen.dart';
import 'package:beautisry_merchant/presentation/widgets/dimmed_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../gen/locale_keys.g.dart';
import '../../widgets/custom_app_bar.dart';

class RegistrationScreen extends StatefulWidget {
  static const route = '/registration-screen';

  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<AuthBloc>(),
      child: const RegistrationView(),
    );
  }
}

class RegistrationView extends StatefulWidget {
  const RegistrationView({super.key});

  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  List<String> _navBarTitles = [];
  int _currentIndex = 0;
  List<Widget> pages = [];
  bool isLoading = false;

  @override
  void initState() {
    _initPages();
    super.initState();
  }

  void _initPages() {
    setState(() {
      _navBarTitles = [
        LocaleKeys.registrationScreenUploadProfilePicture,
        LocaleKeys.registrationScreenSelectService,
        LocaleKeys.registrationScreenSelectBusinessHours,
      ];

      pages = [
        AddImageScreen(
          onNextTap: () {
            setState(() => _currentIndex += 1);
          },
          onLoading: () {
            setState(() {
              isLoading = !isLoading;
            });
          },
        ),
        SelectServicesScreen(
          onNextTap: () {
            setState(() => _currentIndex += 1);
          },
        ),
        const SelectBusinessHoursScreen()
      ];
    });
  }

  void _goToPreviousStep() {
    if (_currentIndex > 0) {
      setState(() => _currentIndex -= 1);
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return DimmedLoader(
      showLoader: isLoading,
      child: Scaffold(
        appBar: CustomAppBar(
          progressValue: _currentIndex + 1,
          totalLength: _navBarTitles.length,
          onBackPressed: _goToPreviousStep,
          title: _navBarTitles[_currentIndex],
          isBackButtonVisible: _currentIndex > 0,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(child: pages[_currentIndex]),
          ],
        ),
      ),
    );
  }
}
