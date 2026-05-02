import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/models/appointment/appointment.dart';
import '../../../../domain/utils/app_constants.dart';
import '../../../widgets/app_widgets.dart';
import '../../client_home_screen.dart';
import 'bloc/appointments_bloc.dart';
import 'bloc/appointments_event.dart';
import 'bloc/appointments_state.dart';
import '../../../../domain/di/dependency_injection.dart';
import '../../../../data/preferences/user_preferences.dart';

class AppointmentsTab extends StatefulWidget {
  const AppointmentsTab({super.key});

  @override
  State<AppointmentsTab> createState() => _AppointmentsTabState();
}

class _AppointmentsTabState extends State<AppointmentsTab>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    final userId = getIt<UserPreferences>().currentUser.id;
    if (userId != null) {
      context
          .read<AppointmentsBloc>()
          .add(AppointmentsEvent.load(userId));
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentsBloc, AppointmentsState>(
      builder: (context, state) {
        final upcoming = state.appointments
            .where((a) =>
                a.status == AppointmentStatus.pending ||
                a.status == AppointmentStatus.confirmed)
            .toList();
        final past = state.appointments
            .where((a) =>
                a.status == AppointmentStatus.completed ||
                a.status == AppointmentStatus.cancelled)
            .toList();

        return Scaffold(
          backgroundColor: AppColors.background,
          body: SafeArea(
            child: Column(
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    AppDimens.paddingMD,
                    AppDimens.paddingMD,
                    AppDimens.paddingMD,
                    0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Appointments', style: AppTextStyles.h2),
                          Text(
                            'Manage your bookings',
                            style: AppTextStyles.body
                                .copyWith(color: AppColors.textSecondary),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                // Tab bar
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: AppDimens.paddingMD),
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius:
                        BorderRadius.circular(AppDimens.radiusMD),
                    border: Border.all(color: AppColors.divider),
                  ),
                  child: TabBar(
                    controller: _tabController,
                    indicator: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius:
                          BorderRadius.circular(AppDimens.radiusSM),
                    ),
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelColor: Colors.white,
                    unselectedLabelColor: AppColors.textSecondary,
                    dividerColor: Colors.transparent,
                    labelStyle: AppTextStyles.body
                        .copyWith(fontWeight: FontWeight.w600),
                    tabs: [
                      Tab(text: 'Upcoming (${upcoming.length})'),
                      Tab(text: 'Past (${past.length})'),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                // Tab views
                Expanded(
                  child: state.isLoading
                      ? const AppLoadingWidget()
                      : TabBarView(
                          controller: _tabController,
                          children: [
                            _AppointmentList(
                              appointments: upcoming,
                              emptyMessage: 'No upcoming appointments.\nBook a service to get started!',
                              showCancel: true,
                            ),
                            _AppointmentList(
                              appointments: past,
                              emptyMessage: 'No past appointments yet.',
                              showCancel: false,
                            ),
                          ],
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _AppointmentList extends StatelessWidget {
  final List<Appointment> appointments;
  final String emptyMessage;
  final bool showCancel;

  const _AppointmentList({
    required this.appointments,
    required this.emptyMessage,
    required this.showCancel,
  });

  @override
  Widget build(BuildContext context) {
    if (appointments.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(AppDimens.paddingLG),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.calendar_today_outlined,
                  size: 56, color: AppColors.textHint),
              const SizedBox(height: 16),
              Text(
                emptyMessage,
                style: AppTextStyles.body
                    .copyWith(color: AppColors.textSecondary),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.paddingMD, vertical: 4),
      itemCount: appointments.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (_, i) => _AppointmentCard(
        appointment: appointments[i],
        showCancel: showCancel,
      ),
    );
  }
}

class _AppointmentCard extends StatelessWidget {
  final Appointment appointment;
  final bool showCancel;

  const _AppointmentCard(
      {required this.appointment, required this.showCancel});

  Color get _statusColor {
    switch (appointment.status) {
      case AppointmentStatus.confirmed:
        return AppColors.success;
      case AppointmentStatus.pending:
        return AppColors.warning;
      case AppointmentStatus.cancelled:
        return AppColors.error;
      case AppointmentStatus.completed:
        return AppColors.textSecondary;
      default:
        return AppColors.textSecondary;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimens.paddingMD),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDimens.radiusLG),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius:
                      BorderRadius.circular(AppDimens.radiusMD),
                ),
                child: const Icon(Icons.medical_services_rounded,
                    color: AppColors.primary, size: 22),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      appointment.service?.name ?? 'Service',
                      style: AppTextStyles.body
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      appointment.service?.category ?? '',
                      style: AppTextStyles.bodySmall,
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: _statusColor.withOpacity(0.1),
                  borderRadius:
                      BorderRadius.circular(AppDimens.radiusFull),
                ),
                child: Text(
                  appointment.status?.label ?? '',
                  style: AppTextStyles.label
                      .copyWith(color: _statusColor),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(color: AppColors.divider, height: 1),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.calendar_today_outlined,
                  size: 16, color: AppColors.textSecondary),
              const SizedBox(width: 6),
              Text(
                appointment.appointmentDate ?? '—',
                style: AppTextStyles.bodySmall,
              ),
              const SizedBox(width: 16),
              const Icon(Icons.access_time,
                  size: 16, color: AppColors.textSecondary),
              const SizedBox(width: 6),
              Text(
                appointment.appointmentTime ?? '—',
                style: AppTextStyles.bodySmall,
              ),
            ],
          ),
          if (showCancel &&
              appointment.status == AppointmentStatus.pending) ...[
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () {
                if (appointment.id != null) {
                  context.read<AppointmentsBloc>().add(
                      AppointmentsEvent.cancel(appointment.id!));
                }
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.error),
                  borderRadius:
                      BorderRadius.circular(AppDimens.radiusMD),
                ),
                child: Text(
                  'Cancel Appointment',
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.error,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
