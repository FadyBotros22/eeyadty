import 'package:beautisry_merchant/domain/models/enums/service_type.dart';
import 'package:beautisry_merchant/presentation/feature_auth/bloc/auth_event.dart';
import 'package:beautisry_merchant/presentation/feature_auth/registration/registration_steps/select_service/service_item_select.dart';
import 'package:beautisry_merchant/presentation/feature_profile/bloc/profile_bloc.dart';
import 'package:beautisry_merchant/presentation/feature_profile/bloc/profile_event.dart';
import 'package:beautisry_merchant/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/preferences/user_preferences.dart';
import '../../../../../domain/di/dependency_injection.dart';
import '../../../../../domain/models/enums/worker_type.dart';
import '../../../../../domain/utils/text_helper.dart';
import '../../../../../domain/utils/ui_helper.dart';
import '../../../../../gen/locale_keys.g.dart';
import '../../../../widgets/buttons/app_elevated_button.dart';
import '../../../bloc/auth_bloc.dart';
import '../../../bloc/auth_state.dart';

class SelectServicesScreenArguments {
  final String? employeeId;
  final String? employeeName;

  SelectServicesScreenArguments({this.employeeId, this.employeeName});
}

class SelectServicesScreen extends StatefulWidget {
  final Function? onNextTap;
  final String? employeeId;
  final String? employeeName;
  static const route = '/select-services-screen';

  const SelectServicesScreen(
      {super.key, this.onNextTap, this.employeeId, this.employeeName});

  @override
  State<SelectServicesScreen> createState() => _SelectServicesScreenState();
}

class _SelectServicesScreenState extends State<SelectServicesScreen> {
  @override
  void initState() {
    getIt<AuthBloc>().add(AuthEvent.getServices(
        employeeId: widget.employeeId, serviceType: ServiceType.SERVICE));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<AuthBloc>(),
      child: SelectServicesView(
        onNextTap: widget.onNextTap,
        employeeId: widget.employeeId,
        employeeName: widget.employeeName,
      ),
    );
  }
}

class SelectServicesView extends StatefulWidget {
  final Function? onNextTap;
  final String? employeeId;
  final String? employeeName;

  const SelectServicesView(
      {super.key, this.onNextTap, this.employeeId, this.employeeName});

  @override
  State<SelectServicesView> createState() => _SelectServicesViewState();
}

class _SelectServicesViewState extends State<SelectServicesView> {
  Set<String> selectedServicesIds = {};

  void _onChecked(String id) {
    setState(() {
      selectedServicesIds.contains(id)
          ? selectedServicesIds.remove(id)
          : selectedServicesIds.add(id);
    });
  }

  @override
  void initState() {
    setState(() {
      selectedServicesIds = {};
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        for (var service in state.services) {
          if (service.selected == true) {
            selectedServicesIds.add(service.id!);
          } else {
            selectedServicesIds
                .removeWhere((serviceId) => serviceId == service.id);
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: _appBar(state, context),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (getIt<UserPreferences>().currentUser.workerType ==
                  WorkerType.EMPLOYEE)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Height(doublePadding),
                    AppText(
                      LocaleKeys.registrationScreenSelectServiceTitle,
                      textStyle: Styles.subTitle(),
                    ),
                    const Height(halfPadding),
                    AppText(
                      LocaleKeys.registrationScreenSelectServiceSubTitle,
                      textStyle: Styles.subBody(),
                    ),
                    const Height(quadPadding),
                  ],
                ),
              _servicesList(state),
              const Height(40),
              AppElevatedButton(
                onTap: () {
                  _onSave(context);
                },
                text: state.inRegistrationSteps
                    ? LocaleKeys.next
                    : LocaleKeys.selectServicesScreenSaveChanges,
              ),
              const Height(bottomSafeMargin),
            ],
          ).respectBodyMargin(),
        );
      },
    );
  }

  CustomAppBar? _appBar(AuthState state, BuildContext context) {
    return !state.inRegistrationSteps
        ? CustomAppBar(
            title: (getIt<UserPreferences>().currentUser.workerType ==
                    WorkerType.ADMIN)
                ? (widget.employeeName ?? '')
                : LocaleKeys.selectServicesScreenToolbarTitle,
            showProgressLine: false,
            onBackPressed: () {
              Navigator.of(context).pop();
            },
          )
        : null;
  }

  Widget _servicesList(AuthState state) {
    return state.services.isEmpty
        ? Container()
        : state.isLoading
            ? const Center(child: CupertinoActivityIndicator())
            : Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color(0xffF3F3F3),
                      borderRadius: BorderRadius.circular(20)),
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 24),
                    itemCount: state.services.length,
                    separatorBuilder: (context, index) {
                      return const Height(triplePadding);
                    },
                    itemBuilder: (ctx, i) {
                      var item = state.services[i];
                      return ServiceItemSelect(
                        checked: selectedServicesIds.contains(item.id),
                        description: item.description ?? '',
                        name: item.name ?? '',
                        onChange: () => _onChecked(item.id ?? ''),
                      );
                    },
                  ),
                ),
              );
  }

  void _onSave(BuildContext context) {
    if (widget.onNextTap != null) {
      getIt<AuthBloc>().add(
        AuthEvent.postServices(serviceIds: selectedServicesIds.toList()),
      );
      widget.onNextTap!();
    } else {
      getIt<ProfileBloc>().add(
        ProfileEvent.postServices(
            serviceIds: selectedServicesIds.toList(),
            employeeId: widget.employeeId),
      );
      Navigator.of(context).pop();
    }
  }
}
