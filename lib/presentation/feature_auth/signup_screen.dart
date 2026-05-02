import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/di/dependency_injection.dart';
import '../../domain/models/enums/user_role.dart';
import '../../domain/utils/app_constants.dart';
import '../feature_doctor/doctor_home_screen.dart';
import '../widgets/app_widgets.dart';
import '../feature_client/client_home_screen.dart';
import 'bloc/auth_bloc.dart';
import 'bloc/auth_event.dart';
import 'bloc/auth_state.dart';

class SignUpScreen extends StatefulWidget {
  static const route = '/sign-up';

  const SignUpScreen({super.key, required this.role});
  final UserRole role;

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _confirmCtrl = TextEditingController();

  // Doctor-only controllers
  final _specialtyCtrl = TextEditingController();
  final _bioCtrl = TextEditingController();
  final _priceCtrl = TextEditingController();

  bool get _isDoctor => widget.role == UserRole.doctor;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _phoneCtrl.dispose();
    _passwordCtrl.dispose();
    _confirmCtrl.dispose();
    _specialtyCtrl.dispose();
    _bioCtrl.dispose();
    _priceCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<AuthBloc>(),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.isSuccess) {
            if (widget.role == UserRole.patient) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  ClientHomeScreen.route, (_) => false);
            } else {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  DoctorHomeScreen.route, (_) => false);
            }
          }
          if (state.errorMessage != null) {
            showAppSnackBar(context, state.errorMessage!, isError: true);
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.background,
            body: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(AppDimens.paddingLG),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 24),
                      // Back
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColors.surface,
                            borderRadius:
                            BorderRadius.circular(AppDimens.radiusMD),
                            border: Border.all(color: AppColors.divider),
                          ),
                          child: const Icon(Icons.arrow_back_ios_rounded,
                              size: 18, color: AppColors.textPrimary),
                        ),
                      ),
                      const SizedBox(height: 32),
                      Text(
                        _isDoctor
                            ? 'Doctor Registration'
                            : 'Create Account',
                        style: AppTextStyles.h1,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _isDoctor
                            ? 'Fill in your professional details'
                            : 'Fill in your details to get started',
                        style: AppTextStyles.body
                            .copyWith(color: AppColors.textSecondary),
                      ),
                      const SizedBox(height: 40),

                      // ── Common Fields ────────────────────────────────────
                      AppTextField(
                        label: 'Full Name',
                        hint: _isDoctor ? 'Dr. John Doe' : 'John Doe',
                        controller: _nameCtrl,
                        prefixIcon: const Icon(Icons.person_outline,
                            color: AppColors.textSecondary, size: 20),
                        validator: (v) => (v == null || v.isEmpty)
                            ? 'Full name is required'
                            : null,
                      ),
                      const SizedBox(height: 20),
                      AppTextField(
                        label: 'Email address',
                        hint: 'you@example.com',
                        controller: _emailCtrl,
                        keyboardType: TextInputType.emailAddress,
                        prefixIcon: const Icon(Icons.email_outlined,
                            color: AppColors.textSecondary, size: 20),
                        validator: (v) {
                          if (v == null || v.isEmpty) return 'Email is required';
                          if (!v.contains('@')) return 'Enter a valid email';
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      AppTextField(
                        label: 'Phone Number (optional)',
                        hint: '+20 100 000 0000',
                        controller: _phoneCtrl,
                        keyboardType: TextInputType.phone,
                        prefixIcon: const Icon(Icons.phone_outlined,
                            color: AppColors.textSecondary, size: 20),
                      ),
                      const SizedBox(height: 20),
                      AppTextField(
                        label: 'Password',
                        hint: 'Min 6 characters',
                        controller: _passwordCtrl,
                        obscureText: true,
                        prefixIcon: const Icon(Icons.lock_outline,
                            color: AppColors.textSecondary, size: 20),
                        validator: (v) {
                          if (v == null || v.isEmpty)
                            return 'Password is required';
                          if (v.length < 6) return 'Min 6 characters';
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      AppTextField(
                        label: 'Confirm Password',
                        hint: 'Re-enter your password',
                        controller: _confirmCtrl,
                        obscureText: true,
                        prefixIcon: const Icon(Icons.lock_outline,
                            color: AppColors.textSecondary, size: 20),
                        validator: (v) {
                          if (v != _passwordCtrl.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),

                      // ── Doctor-Only Fields ───────────────────────────────
                      if (_isDoctor) ...[
                        const SizedBox(height: 32),
                        _SectionHeader(
                          icon: Icons.medical_services_outlined,
                          title: 'Professional Details',
                        ),
                        const SizedBox(height: 20),
                        AppTextField(
                          label: 'Specialty',
                          hint: 'e.g. Cardiologist, Pediatrician',
                          controller: _specialtyCtrl,
                          prefixIcon: const Icon(
                              Icons.local_hospital_outlined,
                              color: AppColors.textSecondary,
                              size: 20),
                          validator: (v) => (v == null || v.isEmpty)
                              ? 'Specialty is required'
                              : null,
                        ),
                        const SizedBox(height: 20),
                        AppTextField(
                          label: 'Consultation Price (EGP)',
                          hint: 'e.g. 500',
                          controller: _priceCtrl,
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          prefixIcon: const Icon(Icons.attach_money_outlined,
                              color: AppColors.textSecondary, size: 20),
                          validator: (v) {
                            if (v == null || v.isEmpty)
                              return 'Consultation price is required';
                            if (double.tryParse(v) == null)
                              return 'Enter a valid price';
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        // Bio — multi-line
                        _BioField(controller: _bioCtrl),
                      ],

                      const SizedBox(height: 32),
                      AppPrimaryButton(
                        label: _isDoctor
                            ? 'Register as Doctor'
                            : 'Create Account',
                        isLoading: state.isLoading,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<AuthBloc>().add(AuthEvent.signUp(
                              email: _emailCtrl.text.trim(),
                              password: _passwordCtrl.text,
                              fullName: _nameCtrl.text.trim(),
                              phoneNumber: _phoneCtrl.text.isNotEmpty
                                  ? _phoneCtrl.text.trim()
                                  : null,
                              role: widget.role,
                              specialty: _isDoctor
                                  ? _specialtyCtrl.text.trim()
                                  : null,
                              bio: _isDoctor && _bioCtrl.text.isNotEmpty
                                  ? _bioCtrl.text.trim()
                                  : null,
                              consultationPrice: _isDoctor &&
                                  _priceCtrl.text.isNotEmpty
                                  ? double.tryParse(_priceCtrl.text.trim())
                                  : null,
                            ));
                          }
                        },
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account? ',
                            style: AppTextStyles.body
                                .copyWith(color: AppColors.textSecondary),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: Text(
                              'Sign In',
                              style: AppTextStyles.body.copyWith(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// ── Section Header ──────────────────────────────────────────────────────────

class _SectionHeader extends StatelessWidget {
  final IconData icon;
  final String title;

  const _SectionHeader({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(AppDimens.radiusMD),
          ),
          child: Icon(icon, color: AppColors.primary, size: 20),
        ),
        const SizedBox(width: 12),
        Text(title, style: AppTextStyles.h3),
      ],
    );
  }
}

// ── Bio Field ───────────────────────────────────────────────────────────────

class _BioField extends StatelessWidget {
  final TextEditingController controller;

  const _BioField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Bio (optional)', style: AppTextStyles.label),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
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
              borderSide: const BorderSide(color: AppColors.inputBorder),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius:
              BorderRadius.circular(AppDimens.radiusMD),
              borderSide: const BorderSide(color: AppColors.inputBorder),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius:
              BorderRadius.circular(AppDimens.radiusMD),
              borderSide:
              const BorderSide(color: AppColors.primary, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}
