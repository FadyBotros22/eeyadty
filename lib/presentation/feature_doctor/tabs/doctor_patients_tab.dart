import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/utils/app_constants.dart';
import '../../widgets/appointment_status_badge.dart';
import '../bloc/doctor_home_bloc.dart';

class DoctorPatientsTab extends StatelessWidget {
  const DoctorPatientsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorHomeBloc, DoctorHomeState>(
      builder: (context, state) {
        if (state is! DoctorHomeLoaded) return const SizedBox.shrink();

        final patients = state.recentPatients;

        return CustomScrollView(
          slivers: [
            // ── Header ──────────────────────────────────────────────
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Recent Patients', style: AppTextStyles.h1),
                    const SizedBox(height: 4),
                    Text('Your last 5 bookings',
                        style: AppTextStyles.bodySmall),
                  ],
                ),
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 20)),
            const SliverToBoxAdapter(child: Divider(height: 1)),
            const SliverToBoxAdapter(child: SizedBox(height: 20)),

            if (patients.isEmpty)
              SliverToBoxAdapter(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(40),
                    child: Text('No recent patients found.',
                        style: AppTextStyles.bodySmall),
                  ),
                ),
              )
            else
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (ctx, i) {
                    final p = patients[i];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 6),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(AppDimens.radiusLG),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            // Avatar
                            Container(
                              width: 46,
                              height: 46,
                              decoration: const BoxDecoration(
                                color: AppColors.primaryLight,
                                shape: BoxShape.circle,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                p.patientName.isNotEmpty
                                    ? p.patientName[0].toUpperCase()
                                    : '?',
                                style: const TextStyle(
                                  fontFamily: 'Outfit',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                            const SizedBox(width: 14),
                            // Name + date
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    p.patientName,
                                    style: AppTextStyles.body.copyWith(
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    p.formattedDateTime,
                                    style: AppTextStyles.bodySmall,
                                  ),
                                ],
                              ),
                            ),
                            // Status
                            AppointmentStatusBadge(status: p.status),
                          ],
                        ),
                      ),
                    );
                  },
                  childCount: patients.length,
                ),
              ),

            const SliverToBoxAdapter(child: SizedBox(height: 32)),
          ],
        );
      },
    );
  }
}
