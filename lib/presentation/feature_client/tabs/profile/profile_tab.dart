import 'dart:io';
import 'package:eeyadty/domain/models/enums/user_role.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../domain/utils/app_constants.dart';
import '../../../feature_auth/login_screen.dart';
import '../../../widgets/app_widgets.dart';
import 'bloc/profile_bloc.dart';
import 'bloc/profile_event.dart';
import 'bloc/profile_state.dart';
import '../../../../domain/di/dependency_injection.dart';
import '../../../../data/preferences/user_preferences.dart';
import '../../../feature_auth/bloc/auth_bloc.dart';
import '../../../feature_auth/bloc/auth_event.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  final _nameCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  bool _editing = false;

  @override
  void initState() {
    super.initState();
    final userId = getIt<UserPreferences>().currentUser.id;
    if (userId != null) {
      context.read<ProfileBloc>().add(ProfileEvent.load(userId : userId, role: UserRole.patient));
    }
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _phoneCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state.updateSuccess) {
          setState(() => _editing = false);
          showAppSnackBar(context, 'Profile updated successfully!');
        }
        if (state.errorMessage != null) {
          showAppSnackBar(context, state.errorMessage!, isError: true);
        }
        if (!_editing && state.user != null) {
          _nameCtrl.text = state.user!.fullName ?? '';
          _phoneCtrl.text = state.user!.phoneNumber ?? '';
        }
      },
      builder: (context, state) {
        final user = state.user ?? getIt<UserPreferences>().currentUser;
        return Scaffold(
          backgroundColor: AppColors.background,
          body: SafeArea(
            child: state.isLoading
                ? const AppLoadingWidget()
                : SingleChildScrollView(
                    padding: const EdgeInsets.all(AppDimens.paddingMD),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          children: [
                            Text('My Profile', style: AppTextStyles.h2),
                            if (!_editing)
                              GestureDetector(
                                onTap: () {
                                  setState(() => _editing = true);
                                  _nameCtrl.text =
                                      user.fullName ?? '';
                                  _phoneCtrl.text =
                                      user.phoneNumber ?? '';
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: AppColors.primary
                                        .withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(
                                        AppDimens.radiusFull),
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(
                                          Icons.edit_outlined,
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
                        const SizedBox(height: 24),
                        // Avatar
                        Center(
                          child: Stack(
                            children: [
                              GestureDetector(
                                onTap: _editing ? _pickImage : null,
                                child: CircleAvatar(
                                  radius: 48,
                                  backgroundColor:
                                      AppColors.primary.withOpacity(0.1),
                                  backgroundImage: user.avatarUrl != null
                                      ? NetworkImage(user.avatarUrl!)
                                      : null,
                                  child: user.avatarUrl == null
                                      ? Text(
                                          (user.fullName ?? 'U')
                                              .substring(0, 1)
                                              .toUpperCase(),
                                          style: AppTextStyles.h2.copyWith(
                                            color: AppColors.primary,
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
                                        color: AppColors.primary,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Colors.white,
                                            width: 2),
                                      ),
                                      child: const Icon(
                                        Icons.camera_alt_rounded,
                                        size: 14,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Center(
                          child: Text(
                            user.email ?? '',
                            style: AppTextStyles.bodySmall,
                          ),
                        ),
                        const SizedBox(height: 32),
                        // Fields
                        if (_editing) ...[
                          AppTextField(
                            label: 'Full Name',
                            controller: _nameCtrl,
                            prefixIcon: const Icon(Icons.person_outline,
                                color: AppColors.textSecondary, size: 20),
                          ),
                          const SizedBox(height: 20),
                          AppTextField(
                            label: 'Phone Number',
                            controller: _phoneCtrl,
                            keyboardType: TextInputType.phone,
                            prefixIcon: const Icon(Icons.phone_outlined,
                                color: AppColors.textSecondary, size: 20),
                          ),
                          const SizedBox(height: 24),
                          Row(
                            children: [
                              Expanded(
                                child: OutlinedButton(
                                  onPressed: () =>
                                      setState(() => _editing = false),
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor:
                                        AppColors.textSecondary,
                                    side: const BorderSide(
                                        color: AppColors.inputBorder),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          AppDimens.radiusMD),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 14),
                                  ),
                                  child: const Text('Cancel'),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: AppPrimaryButton(
                                  label: 'Save',
                                  isLoading: state.isUpdating,
                                  onPressed: () {
                                    final uid = user.id;
                                    if (uid != null) {
                                      context.read<ProfileBloc>().add(
                                            ProfileEvent.update(
                                              userId: uid,
                                              fullName: _nameCtrl.text
                                                  .trim(),
                                              phoneNumber: _phoneCtrl.text
                                                  .trim(), role: UserRole.patient,
                                            ),
                                          );
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ] else ...[
                          _InfoTile(
                              icon: Icons.person_outline,
                              label: 'Full Name',
                              value: user.fullName ?? '—'),
                          _InfoTile(
                              icon: Icons.phone_outlined,
                              label: 'Phone',
                              value: user.phoneNumber ?? '—'),
                        ],
                        const SizedBox(height: 32),
                        const Divider(color: AppColors.divider),
                        const SizedBox(height: 16),
                        // Sign out
                        GestureDetector(
                          onTap: () => _confirmSignOut(context),
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: AppColors.error.withOpacity(0.06),
                              borderRadius: BorderRadius.circular(
                                  AppDimens.radiusLG),
                              border: Border.all(
                                  color:
                                      AppColors.error.withOpacity(0.2)),
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.logout_rounded,
                                    color: AppColors.error, size: 22),
                                const SizedBox(width: 12),
                                Text(
                                  'Sign Out',
                                  style: AppTextStyles.body.copyWith(
                                    color: AppColors.error,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
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
    final picked =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    if (picked != null) {
      final userId = getIt<UserPreferences>().currentUser.id;
      if (userId != null && mounted) {
        context.read<ProfileBloc>().add(
              ProfileEvent.uploadAvatar(
                  userId: userId, file: File(picked.path)),
            );
      }
    }
  }

  void _confirmSignOut(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Sign Out'),
        content:
            const Text('Are you sure you want to sign out?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              getIt<AuthBloc>().add(const AuthEvent.signOut());
              Navigator.of(context).pushNamedAndRemoveUntil(
                  LoginScreen.route,arguments: LoginScreenArguments(role: UserRole.patient), (_) => false);
            },
            child: const Text('Sign Out',
                style: TextStyle(color: AppColors.error)),
          ),
        ],
      ),
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: AppTextStyles.label),
              const SizedBox(height: 2),
              Text(value,
                  style: AppTextStyles.body
                      .copyWith(fontWeight: FontWeight.w500)),
            ],
          ),
        ],
      ),
    );
  }
}
