import 'package:flutter/material.dart';
import '../../../../domain/utils/app_constants.dart';
import '../../domain/models/doctor_list_item/doctor_list_item.dart';
import 'booking_screen.dart';

class DoctorDetailScreenArguments {
  final DoctorListItem doctor;

  DoctorDetailScreenArguments({required this.doctor});
}

class DoctorDetailScreen extends StatelessWidget {
  static const route = '/doctor-detail';

  final DoctorListItem doctor;

  const DoctorDetailScreen({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          _DoctorAppBar(doctor: doctor),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(AppDimens.paddingLG),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _StatsRow(doctor: doctor),
                  const SizedBox(height: 24),
                  if (doctor.bio != null && doctor.bio!.isNotEmpty) ...[
                    Text('About', style: AppTextStyles.h3),
                    const SizedBox(height: 8),
                    Text(doctor.bio!,
                        style: AppTextStyles.body.copyWith(
                            color: AppColors.textSecondary, height: 1.6)),
                    const SizedBox(height: 24),
                  ],
                  Text('Specialty', style: AppTextStyles.h3),
                  const SizedBox(height: 8),
                  _SpecialtyChip(label: doctor.specialty),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _BookingBar(doctor: doctor),
    );
  }
}

// ─── App bar ──────────────────────────────────────────────────────────────────

class _DoctorAppBar extends StatelessWidget {
  final DoctorListItem doctor;

  const _DoctorAppBar({required this.doctor});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 260,
      pinned: true,
      backgroundColor: AppColors.surface,
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.9),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.arrow_back_ios_new_rounded,
              size: 18, color: AppColors.textPrimary),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            // Background color
            Container(color: AppColors.primary.withOpacity(0.08)),
            // Avatar centered
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 40),
                  _LargeAvatar(doctor: doctor),
                  const SizedBox(height: 12),
                  Text(doctor.name,
                      style: AppTextStyles.h2,
                      textAlign: TextAlign.center),
                  const SizedBox(height: 4),
                  Text(doctor.specialty,
                      style: AppTextStyles.body
                          .copyWith(color: AppColors.primary)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LargeAvatar extends StatelessWidget {
  final DoctorListItem doctor;

  const _LargeAvatar({required this.doctor});

  String get _initials {
    final parts = doctor.name.trim().split(' ');
    if (parts.length == 1) return parts[0][0].toUpperCase();
    return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    if (doctor.avatarUrl != null) {
      return CircleAvatar(
        radius: 52,
        backgroundImage: NetworkImage(doctor.avatarUrl!),
        onBackgroundImageError: (_, __) {},
      );
    }
    return CircleAvatar(
      radius: 52,
      backgroundColor: AppColors.primary.withOpacity(0.15),
      child: Text(_initials,
          style: AppTextStyles.h1.copyWith(color: AppColors.primary)),
    );
  }
}

// ─── Stats row ────────────────────────────────────────────────────────────────

class _StatsRow extends StatelessWidget {
  final DoctorListItem doctor;

  const _StatsRow({required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _StatCard(
          icon: Icons.payments_outlined,
          label: 'Consultation',
          value: 'EGP ${doctor.consultationPrice.toStringAsFixed(0)}',
        ),
        const SizedBox(width: 12),
        _StatCard(
          icon: Icons.category_outlined,
          label: 'Specialty',
          value: doctor.specialty,
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _StatCard(
      {required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(AppDimens.paddingMD),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppDimens.radiusLG),
          border: Border.all(color: AppColors.divider),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.08),
                borderRadius: BorderRadius.circular(AppDimens.radiusMD),
              ),
              child:
              Icon(icon, color: AppColors.primary, size: 18),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label,
                      style: AppTextStyles.label,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                  Text(value,
                      style: AppTextStyles.body.copyWith(
                          fontWeight: FontWeight.w600),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SpecialtyChip extends StatelessWidget {
  final String label;

  const _SpecialtyChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
      const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.08),
        borderRadius: BorderRadius.circular(AppDimens.radiusFull),
      ),
      child: Text(label,
          style: AppTextStyles.body
              .copyWith(color: AppColors.primary, fontWeight: FontWeight.w500)),
    );
  }
}

// ─── Bottom booking bar ───────────────────────────────────────────────────────

class _BookingBar extends StatelessWidget {
  final DoctorListItem doctor;

  const _BookingBar({required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        AppDimens.paddingLG,
        AppDimens.paddingMD,
        AppDimens.paddingLG,
        AppDimens.paddingMD +
            MediaQuery.of(context).padding.bottom,
      ),
      decoration: BoxDecoration(
        color: AppColors.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Consultation fee',
                  style: AppTextStyles.label),
              Text(
                'EGP ${doctor.consultationPrice.toStringAsFixed(0) }',
                style: AppTextStyles.h3
                    .copyWith(color: AppColors.primary),
              ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                    BookAppointmentScreen.route, arguments: DoctorDetailScreenArguments(doctor: doctor));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding:
                const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(AppDimens.radiusMD),
                ),
              ),
              child: const Text('Book Appointment',
                  style: AppTextStyles.button),
            ),
          ),
        ],
      ),
    );
  }
}