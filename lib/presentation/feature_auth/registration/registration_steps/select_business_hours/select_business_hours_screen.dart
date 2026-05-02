import 'package:beautisry_merchant/domain/models/business_hour/business_hour.dart';
import 'package:beautisry_merchant/domain/models/time_range/time_range.dart';
import 'package:beautisry_merchant/presentation/feature_auth/registration/registration_steps/select_business_hours/work_day_item.dart';
import 'package:beautisry_merchant/presentation/feature_home/home_screen.dart';
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
import '../../../../widgets/custom_app_bar.dart';
import '../../../bloc/auth_bloc.dart';
import '../../../bloc/auth_event.dart';
import '../../../bloc/auth_state.dart';

class SelectBusinessHoursScreenArguments {
  final String? employeeId;
  final String? employeeName;
  SelectBusinessHoursScreenArguments({this.employeeId, this.employeeName});
}

class SelectBusinessHoursScreen extends StatefulWidget {
  static const route = '/select-business-hours-screen';
  final String? employeeId;
  final String? employeeName;

  const SelectBusinessHoursScreen(
      {super.key, this.employeeId, this.employeeName});

  @override
  State<SelectBusinessHoursScreen> createState() =>
      _SelectBusinessHoursScreenState();
}

class _SelectBusinessHoursScreenState extends State<SelectBusinessHoursScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<AuthBloc>(),
      child: SelectBusinessHoursView(
        employeeId: widget.employeeId,
        employeeName: widget.employeeName,
      ),
    );
  }
}

class SelectBusinessHoursView extends StatefulWidget {
  final String? employeeId;
  final String? employeeName;

  const SelectBusinessHoursView(
      {super.key, this.employeeId, this.employeeName});

  @override
  State<SelectBusinessHoursView> createState() =>
      _SelectBusinessHoursViewState();
}

class _SelectBusinessHoursViewState extends State<SelectBusinessHoursView> {
  List<BusinessHour> items = [];

  void _onIsAvailableChanged(int index, bool value) {
    setState(() => items[index] = items[index].copyWith(isAvailable: value));
  }

  void _onDeleteSlot(int index, int timeSlotIndex) {
    setState(() {
      List<TimeRange>? tempRanges = List.from(items[index].timeRanges ?? []);
      tempRanges.removeAt(timeSlotIndex);
      items[index] = items[index].copyWith(timeRanges: tempRanges);
    });
  }

  void _onTimeRangeChange(TimeRange timeRange, int dayIndex, int slotIndex) {
    setState(() {
      List<TimeRange>? tempRanges = List.from(items[dayIndex].timeRanges ?? []);
      tempRanges[slotIndex] = timeRange;
      items[dayIndex] = items[dayIndex].copyWith(timeRanges: tempRanges);
    });
  }

  void _onAddSlot(int index) {
    setState(() {
      List<TimeRange>? tempRanges = List.from(items[index].timeRanges ?? []);
      tempRanges.add(
        // 540 -> 9 am, 1,260 -> 9 pm
        const TimeRange(
          from: 540,
          to: 1260,
        ),
      );
      items[index] = items[index].copyWith(timeRanges: tempRanges);
    });
  }

  Widget _timeSlots() {
    return ListView.separated(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return BusinessHourItem(
          key: ValueKey(
              '${items[index].day}-${items[index].timeRanges?.length}'),
          item: items[index],
          onAddMoreTap: () => _onAddSlot(index),
          onDeleteSlot: (timeSlotIndex) => _onDeleteSlot(index, timeSlotIndex),
          onTimeRangeChange: (range, slotIndex) {
            _onTimeRangeChange(range, index, slotIndex);
          },
          onIsAvailableChanged: (v) => _onIsAvailableChanged(index, v),
        );
      },
      separatorBuilder: (context, index) {
        return const Height(10);
      },
    );
  }

  @override
  void initState() {
    getIt<AuthBloc>()
        .add(AuthEvent.getTimeSlots(employeeId: widget.employeeId));
    items.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        setState(() {
          items.clear();
          items.addAll(state.businessHours);
          for (BusinessHour day in items) {
            if (day.timeRanges?.isEmpty == true) {
              _onAddSlot(items.indexOf(day));
            }
          }
        });
      },
      builder: (context, state) {
        return Scaffold(
          appBar: _appBar(state, context),
          body: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Height(doublePadding),
              AppText(
                (getIt<UserPreferences>().currentUser.workerType ==
                        WorkerType.ADMIN)
                    ? LocaleKeys.scheduleScreenAdminTitle
                    : LocaleKeys.registrationScreenSelectWorkingHoursTitle,
                textStyle: Styles.subTitle(),
              ),
              const Height(halfPadding),
              AppText(
                (getIt<UserPreferences>().currentUser.workerType ==
                        WorkerType.ADMIN)
                    ? LocaleKeys.scheduleScreenAdminSubtitle
                    : LocaleKeys.registrationScreenSelectWorkingHoursSubTitle,
                textStyle: Styles.subBody(),
              ),
              const Height(normalPadding),
              state.isLoading
                  ? const Center(child: CupertinoActivityIndicator())
                  : Expanded(
                      child: _timeSlots(),
                    ),
              const Height(doublePadding),
              Align(
                alignment: Alignment.bottomCenter,
                child: AppElevatedButton(
                  text: state.inRegistrationSteps
                      ? LocaleKeys.signup
                      : LocaleKeys.selectBusinessHoursSaveChanges,
                  onTap: () {
                    _onSave(state, context);
                  },
                ),
              ),
              const Height(quadPadding),
            ],
          ).respectBodyMargin(),
        );
      },
    );
  }

  void _onSave(AuthState state, BuildContext context) {
    getIt<AuthBloc>().add(
      AuthEvent.postTimeSlots(
          businessHours: items, employeeId: widget.employeeId),
    );
    if (state.inRegistrationSteps) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(HomeScreen.route, (route) => false);
    } else {
      Navigator.of(context).pop();
    }
  }

  CustomAppBar? _appBar(AuthState state, BuildContext context) {
    return !state.inRegistrationSteps
        ? CustomAppBar(
            title: widget.employeeName ??
                LocaleKeys.selectBusinessHoursToolbarTitle,
            showProgressLine: false,
            onBackPressed: () {
              Navigator.of(context).pop();
            },
          )
        : null;
  }
}
