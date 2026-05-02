import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../domain/utils/app_constants.dart';
import '../../../../domain/models/doctor_list_item/doctor_list_item.dart';
import 'bloc/doctors_bloc.dart';
import 'bloc/doctors_event.dart';
import 'bloc/doctors_state.dart';

class DoctorsTab extends StatefulWidget {
  const DoctorsTab({super.key});

  @override
  State<DoctorsTab> createState() => _DoctorsTabState();
}

class _DoctorsTabState extends State<DoctorsTab> {
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<DoctorsBloc>().add(const DoctorsEvent.load());
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Header(),
            _SearchBar(controller: _searchController),
            _SpecialtyChips(),
            Expanded(child: _DoctorList()),
          ],
        ),
      ),
    );
  }
}

// ─── Header ───────────────────────────────────────────────────────────────────

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppDimens.paddingLG,
        AppDimens.paddingLG,
        AppDimens.paddingLG,
        AppDimens.paddingSM,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Find a Doctor', style: AppTextStyles.heading1),
          const SizedBox(height: 4),
          Text(
            'Book your next appointment',
            style: AppTextStyles.body.copyWith(color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }
}

// ─── Search bar ───────────────────────────────────────────────────────────────

class _SearchBar extends StatelessWidget {
  final TextEditingController controller;

  const _SearchBar({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimens.paddingLG,
        vertical: AppDimens.paddingSM,
      ),
      child: TextField(
        controller: controller,
        onChanged: (q) =>
            context.read<DoctorsBloc>().add(DoctorsEvent.search(q)),
        decoration: InputDecoration(
          hintText: 'Search by name...',
          hintStyle:
          AppTextStyles.body.copyWith(color: AppColors.textSecondary),
          prefixIcon: const Icon(Icons.search_rounded, size: 20),
          suffixIcon: ValueListenableBuilder(
            valueListenable: controller,
            builder: (_, value, __) => value.text.isEmpty
                ? const SizedBox.shrink()
                : IconButton(
              icon: const Icon(Icons.close_rounded, size: 18),
              onPressed: () {
                controller.clear();
                context
                    .read<DoctorsBloc>()
                    .add(const DoctorsEvent.search(''));
              },
            ),
          ),
          filled: true,
          fillColor: AppColors.surface,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppDimens.radiusFull),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 12),
        ),
      ),
    );
  }
}

// ─── Specialty chips ──────────────────────────────────────────────────────────

class _SpecialtyChips extends StatelessWidget {
  // Derive unique specialties from loaded doctors
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorsBloc, DoctorsState>(
      builder: (context, state) {
        final specialties = [
          null, // "All"
          ...{...state.doctors.map((d) => d.category)},
        ];

        return SizedBox(
          height: 40,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(
                horizontal: AppDimens.paddingLG),
            itemCount: specialties.length,
            separatorBuilder: (_, __) => const SizedBox(width: 8),
            itemBuilder: (_, i) {
              final specialty = specialties[i];
              final isSelected =
                  state.selectedSpecialty == specialty;
              return _Chip(
                label: specialty ?? 'All',
                isSelected: isSelected,
                onTap: () => context
                    .read<DoctorsBloc>()
                    .add(DoctorsEvent.selectSpecialty(specialty)),
              );
            },
          ),
        );
      },
    );
  }
}

class _Chip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _Chip(
      {required this.label,
        required this.isSelected,
        required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding:
        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.surface,
          borderRadius: BorderRadius.circular(AppDimens.radiusFull),
        ),
        child: Text(
          label,
          style: AppTextStyles.label.copyWith(
            color: isSelected ? Colors.white : AppColors.textSecondary,
            fontWeight:
            isSelected ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

// ─── Doctor list ──────────────────────────────────────────────────────────────

class _DoctorList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorsBloc, DoctorsState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
              child: CircularProgressIndicator());
        }

        if (state.errorMessage != null) {
          return _ErrorView(message: state.errorMessage!);
        }

        if (state.filteredDoctors.isEmpty) {
          return const _EmptyView();
        }

        return ListView.separated(
          padding: const EdgeInsets.all(AppDimens.paddingLG),
          itemCount: state.filteredDoctors.length,
          separatorBuilder: (_, __) =>
          const SizedBox(height: AppDimens.paddingMD),
          itemBuilder: (_, i) =>
              _DoctorCard(doctor: state.filteredDoctors[i]),
        );
      },
    );
  }
}

// ─── Doctor card ──────────────────────────────────────────────────────────────

class _DoctorCard extends StatelessWidget {
  final DoctorListItem doctor;

  const _DoctorCard({required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimens.paddingMD),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDimens.radiusLG),
      ),
      child: Row(
        children: [
          _Avatar(doctor: doctor),
          const SizedBox(width: AppDimens.paddingMD),
          Expanded(child: _DoctorInfo(doctor: doctor)),
          _BookButton(doctor: doctor),
        ],
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  final DoctorListItem doctor;

  const _Avatar({required this.doctor});

  @override
  Widget build(BuildContext context) {
    if (doctor.avatarUrl != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(AppDimens.radiusMD),
        child: Image.network(
          doctor.avatarUrl!,
          width: 64,
          height: 64,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => _InitialsAvatar(name: doctor.name),
        ),
      );
    }
    return _InitialsAvatar(name: doctor.name);
  }
}

class _InitialsAvatar extends StatelessWidget {
  final String name;

  const _InitialsAvatar({required this.name});

  String get _initials {
    final parts = name.trim().split(' ');
    if (parts.isEmpty) return 'D';
    if (parts.length == 1) return parts[0][0].toUpperCase();
    return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppDimens.radiusMD),
      ),
      alignment: Alignment.center,
      child: Text(
        _initials,
        style: AppTextStyles.heading2
            .copyWith(color: AppColors.primary),
      ),
    );
  }
}

class _DoctorInfo extends StatelessWidget {
  final DoctorListItem doctor;

  const _DoctorInfo({required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(doctor.name,
            style: AppTextStyles.body
                .copyWith(fontWeight: FontWeight.w600),
            maxLines: 1,
            overflow: TextOverflow.ellipsis),
        const SizedBox(height: 4),
        _SpecialtyBadge(label: doctor.category),
        const SizedBox(height: 6),
        if (doctor.bio != null)
          Text(
            doctor.bio!,
            style: AppTextStyles.caption
                .copyWith(color: AppColors.textSecondary),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        const SizedBox(height: 6),
        Text(
          'EGP ${doctor.price.toStringAsFixed(0)}',
          style: AppTextStyles.body.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _SpecialtyBadge extends StatelessWidget {
  final String label;

  const _SpecialtyBadge({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(AppDimens.radiusSM),
      ),
      child: Text(
        label,
        style: AppTextStyles.caption.copyWith(
          color: AppColors.primary,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _BookButton extends StatelessWidget {
  final DoctorListItem doctor;

  const _BookButton({required this.doctor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: push to booking screen with doctor.id
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(AppDimens.radiusMD),
        ),
        child: Text(
          'Book',
          style: AppTextStyles.label.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

// ─── Empty / Error states ─────────────────────────────────────────────────────

class _EmptyView extends StatelessWidget {
  const _EmptyView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.search_off_rounded,
              size: 48, color: AppColors.textSecondary),
          const SizedBox(height: 12),
          Text('No doctors found',
              style: AppTextStyles.body
                  .copyWith(color: AppColors.textSecondary)),
        ],
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  final String message;

  const _ErrorView({required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.error_outline_rounded,
              size: 48, color: AppColors.error),
          const SizedBox(height: 12),
          Text(message,
              style: AppTextStyles.body
                  .copyWith(color: AppColors.textSecondary)),
          const SizedBox(height: 16),
          TextButton(
            onPressed: () => context
                .read<DoctorsBloc>()
                .add(const DoctorsEvent.load()),
            child: const Text('Try again'),
          ),
        ],
      ),
    );
  }
}