import 'package:eeyadty/domain/models/doctor/doctor_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../domain/utils/app_constants.dart';
import '../../../presentation/widgets/app_widgets.dart';
import '../bloc/doctor_home_bloc.dart';

class DoctorProfileTab extends StatefulWidget {
  const DoctorProfileTab({super.key});

  @override
  State<DoctorProfileTab> createState() => _DoctorProfileTabState();
}

class _DoctorProfileTabState extends State<DoctorProfileTab> {
  final _nameCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _specialtyCtrl = TextEditingController();
  final _bioCtrl = TextEditingController();
  final _priceCtrl = TextEditingController();

  bool _editing = false;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _phoneCtrl.dispose();
    _specialtyCtrl.dispose();
    _bioCtrl.dispose();
    _priceCtrl.dispose();
    super.dispose();
  }

  void _startEditing(DoctorHomeLoaded state) {
    setState(() => _editing = true);
    _nameCtrl.text = state.doctor.fullName;
    _phoneCtrl.text = state.doctor.phoneNumber ?? '';
    _specialtyCtrl.text = state.doctor.specialty ?? '';
    _bioCtrl.text = state.doctor.bio ?? '';
    _priceCtrl.text =
        state.doctor.consultationPrice?.toStringAsFixed(0) ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorHomeBloc, DoctorHomeState>(
      listener: (context, state) {
        if (state is DoctorHomeLoaded) {
          if (state.profileUpdateSuccess) {
            setState(() => _editing = false);
            showAppSnackBar(context, 'Profile updated successfully!');
          }
          if (state.profileUpdateError != null) {
            showAppSnackBar(context, state.profileUpdateError!, isError: true);
          }
        }
      },
      builder: (context, state) {
        if (state is! DoctorHomeLoaded) return const SizedBox.shrink();
        final doctor = state.doctor;

        return Scaffold(
          backgroundColor: AppColors.background,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // ── Blue header card ──────────────────────────────────
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(28),
                        bottomRight: Radius.circular(28),
                      ),
                    ),
                    padding:
                    const EdgeInsets.fromLTRB(24, 48, 24, 36),
                    child: Column(
                      children: [
                        // Avatar
                        Stack(
                          children: [
                            GestureDetector(
                              onTap: _editing ? _pickImage : null,
                              child: CircleAvatar(
                                radius: 44,
                                backgroundColor:
                                Colors.white.withValues(alpha: 0.25),
                                backgroundImage:
                                doctor.avatarUrl != null
                                    ? NetworkImage(doctor.avatarUrl!)
                                    : null,
                                child: doctor.avatarUrl == null
                                    ? Text(
                                  doctor.initials,
                                  style: const TextStyle(
                                    fontFamily: 'Outfit',
                                    fontSize: 32,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                )
                                    : null,
                              ),
                            ),
                            if (_editing)
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: GestureDetector(
                                  onTap: _pickImage,
                                  child: Container(
                                    width: 28,
                                    height: 28,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: AppColors.primary,
                                          width: 2),
                                    ),
                                    child: const Icon(
                                        Icons.camera_alt_rounded,
                                        size: 14,
                                        color: AppColors.primary),
                                  ),
                                ),
                              ),
                            if (state.isProfileUpdating)
                              Positioned.fill(
                                child: Container(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black26,
                                  ),
                                  child: const Center(
                                    child: CircularProgressIndicator(
                                        color: Colors.white, strokeWidth: 2),
                                  ),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          doctor.fullName,
                          style: const TextStyle(
                            fontFamily: 'Outfit',
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        if (doctor.specialty != null &&
                            doctor.specialty!.isNotEmpty) ...[
                          const SizedBox(height: 6),
                          Text(
                            doctor.specialty!,
                            style: const TextStyle(
                              fontFamily: 'Outfit',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                        const SizedBox(height: 10),
                        // Doctor badge + consultationPrice badge
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _HeaderBadge(label: 'Doctor'),
                            if (doctor.consultationPrice != null) ...[
                              const SizedBox(width: 8),
                              _HeaderBadge(
                                label:
                                'EGP ${doctor.consultationPrice!.toStringAsFixed(0)}',
                                icon: Icons.attach_money_rounded,
                              ),
                            ],
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ── Edit / Cancel controls ────────────────────────
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('My Profile', style: AppTextStyles.h2),
                            if (!_editing)
                              GestureDetector(
                                onTap: () => _startEditing(state),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: AppColors.primary
                                        .withValues(alpha: 0.1),
                                    borderRadius: BorderRadius.circular(
                                        AppDimens.radiusFull),
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.edit_outlined,
                                          size: 16,
                                          color: AppColors.primary),
                                      const SizedBox(width: 4),
                                      Text(
                                        'Edit',
                                        style: AppTextStyles.label
                                            .copyWith(
                                            color: AppColors.primary,
                                            fontWeight:
                                            FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 20),

                        if (_editing)
                          _EditForm(
                            nameCtrl: _nameCtrl,
                            phoneCtrl: _phoneCtrl,
                            specialtyCtrl: _specialtyCtrl,
                            bioCtrl: _bioCtrl,
                            priceCtrl: _priceCtrl,
                            isLoading: state.isProfileUpdating,
                            onCancel: () => setState(() => _editing = false),
                            onSave: () {
                              context
                                  .read<DoctorHomeBloc>()
                                  .add(DoctorProfileUpdateRequested(
                                fullName: _nameCtrl.text.trim(),
                                phoneNumber:
                                _phoneCtrl.text.trim().isNotEmpty
                                    ? _phoneCtrl.text.trim()
                                    : null,
                                specialty: _specialtyCtrl.text
                                    .trim()
                                    .isNotEmpty
                                    ? _specialtyCtrl.text.trim()
                                    : null,
                                bio: _bioCtrl.text.trim().isNotEmpty
                                    ? _bioCtrl.text.trim()
                                    : null,
                                consultationPrice: double.tryParse(
                                    _priceCtrl.text.trim()),
                              ));
                            },
                          )
                        else
                          _InfoList(doctor: doctor),

                        const SizedBox(height: 32),
                        const Divider(color: AppColors.divider),
                        const SizedBox(height: 16),
                        // Sign out
                        _LogoutButton(
                          onTap: () => _confirmSignOut(context),
                        ),
                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(
        source: ImageSource.gallery, imageQuality: 80);
    if (picked != null && mounted) {
    }
  }

  void _confirmSignOut(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Sign Out'),
        content: const Text('Are you sure you want to sign out?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              context
                  .read<DoctorHomeBloc>()
                  .add(DoctorHomeLogoutRequested());
            },
            child: const Text('Sign Out',
                style: TextStyle(color: AppColors.error)),
          ),
        ],
      ),
    );
  }
}

// ── Header Badge ────────────────────────────────────────────────────────────

class _HeaderBadge extends StatelessWidget {
  final String label;
  final IconData? icon;

  const _HeaderBadge({required this.label, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(AppDimens.radiusMD),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 13, color: Colors.white),
            const SizedBox(width: 4),
          ],
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'Outfit',
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Info List (view mode) ───────────────────────────────────────────────────

class _InfoList extends StatelessWidget {
  final DoctorUser doctor;

  const _InfoList({required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _InfoTile(
            icon: Icons.email_outlined,
            label: 'Email',
            value: doctor.email.isEmpty ? '—' : doctor.email),
        if (doctor.phoneNumber != null && doctor.phoneNumber!.isNotEmpty)
          _InfoTile(
              icon: Icons.phone_outlined,
              label: 'Phone',
              value: doctor.phoneNumber!),
        if (doctor.specialty != null && doctor.specialty!.isNotEmpty)
          _InfoTile(
              icon: Icons.local_hospital_outlined,
              label: 'Specialty',
              value: doctor.specialty!),
        if (doctor.consultationPrice != null)
          _InfoTile(
              icon: Icons.attach_money_outlined,
              label: 'Consultation Price',
              value: 'EGP ${doctor.consultationPrice!.toStringAsFixed(0)}'),
        if (doctor.bio != null && doctor.bio!.isNotEmpty) ...[
          const SizedBox(height: 4),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppDimens.paddingMD),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius:
              BorderRadius.circular(AppDimens.radiusMD),
              border: Border.all(color: AppColors.divider),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.info_outline,
                        color: AppColors.primary, size: 20),
                    const SizedBox(width: 10),
                    Text('Bio', style: AppTextStyles.label),
                  ],
                ),
                const SizedBox(height: 8),
                Text(doctor.bio!, style: AppTextStyles.body),
              ],
            ),
          ),
        ],
      ],
    );
  }
}

class _InfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoTile(
      {required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(AppDimens.paddingMD),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDimens.radiusMD),
        border: Border.all(color: AppColors.divider),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: AppTextStyles.label),
                const SizedBox(height: 2),
                Text(value,
                    style: AppTextStyles.body
                        .copyWith(fontWeight: FontWeight.w500)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Edit Form (edit mode) ───────────────────────────────────────────────────

class _EditForm extends StatelessWidget {
  final TextEditingController nameCtrl;
  final TextEditingController phoneCtrl;
  final TextEditingController specialtyCtrl;
  final TextEditingController bioCtrl;
  final TextEditingController priceCtrl;
  final bool isLoading;
  final VoidCallback onCancel;
  final VoidCallback onSave;

  const _EditForm({
    required this.nameCtrl,
    required this.phoneCtrl,
    required this.specialtyCtrl,
    required this.bioCtrl,
    required this.priceCtrl,
    required this.isLoading,
    required this.onCancel,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextField(
          label: 'Full Name',
          controller: nameCtrl,
          prefixIcon: const Icon(Icons.person_outline,
              color: AppColors.textSecondary, size: 20),
        ),
        const SizedBox(height: 16),
        AppTextField(
          label: 'Phone Number',
          controller: phoneCtrl,
          keyboardType: TextInputType.phone,
          prefixIcon: const Icon(Icons.phone_outlined,
              color: AppColors.textSecondary, size: 20),
        ),
        const SizedBox(height: 16),
        AppTextField(
          label: 'Specialty',
          controller: specialtyCtrl,
          prefixIcon: const Icon(Icons.local_hospital_outlined,
              color: AppColors.textSecondary, size: 20),
        ),
        const SizedBox(height: 16),
        AppTextField(
          label: 'Consultation Price (EGP)',
          controller: priceCtrl,
          keyboardType:
          const TextInputType.numberWithOptions(decimal: true),
          prefixIcon: const Icon(Icons.attach_money_outlined,
              color: AppColors.textSecondary, size: 20),
        ),
        const SizedBox(height: 16),
        // Bio — multi-line
        Text('Bio', style: AppTextStyles.label),
        const SizedBox(height: 6),
        TextFormField(
          controller: bioCtrl,
          maxLines: 4,
          style: AppTextStyles.body,
          decoration: InputDecoration(
            hintText: 'Write a short description about yourself...',
            hintStyle:
            AppTextStyles.body.copyWith(color: AppColors.textHint),
            filled: true,
            fillColor: AppColors.surface,
            contentPadding: const EdgeInsets.all(16),
            border: OutlineInputBorder(
              borderRadius:
              BorderRadius.circular(AppDimens.radiusMD),
              borderSide:
              const BorderSide(color: AppColors.inputBorder),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius:
              BorderRadius.circular(AppDimens.radiusMD),
              borderSide:
              const BorderSide(color: AppColors.inputBorder),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius:
              BorderRadius.circular(AppDimens.radiusMD),
              borderSide: const BorderSide(
                  color: AppColors.primary, width: 1.5),
            ),
          ),
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: onCancel,
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.textSecondary,
                  side: const BorderSide(color: AppColors.inputBorder),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(AppDimens.radiusMD),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text('Cancel'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: AppPrimaryButton(
                label: 'Save',
                isLoading: isLoading,
                onPressed: onSave,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// ── Logout Button ────────────────────────────────────────────────────────────

class _LogoutButton extends StatelessWidget {
  final VoidCallback onTap;

  const _LogoutButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.error.withValues(alpha: 0.06),
          borderRadius:
          BorderRadius.circular(AppDimens.radiusLG),
          border: Border.all(
              color: AppColors.error.withValues(alpha: 0.2)),
        ),
        child: Row(
          children: const [
            Icon(Icons.logout_rounded,
                color: AppColors.error, size: 22),
            SizedBox(width: 12),
            Text(
              'Sign Out',
              style: TextStyle(
                fontFamily: 'Outfit',
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AppColors.error,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
