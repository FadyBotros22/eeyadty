import 'package:eeyadty/domain/models/enums/user_role.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/di/dependency_injection.dart';
import '../../domain/utils/app_constants.dart';
import '../widgets/app_widgets.dart';
import '../feature_client/client_home_screen.dart';
import 'bloc/auth_bloc.dart';
import 'bloc/auth_event.dart';
import 'bloc/auth_state.dart';
import 'signup_screen.dart';

class LoginScreenArguments {
  final UserRole role;

  LoginScreenArguments({required this.role});
}

class LoginScreen extends StatefulWidget {
  static const route = '/login';

  const LoginScreen({super.key, required this.role});
  final UserRole role;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<AuthBloc>(),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.isSuccess) {
            Navigator.of(context).pushNamedAndRemoveUntil(
                ClientHomeScreen.route, (_) => false);
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
                      // Back button
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
                      // Header
                      Text('Welcome back', style: AppTextStyles.h1),
                      const SizedBox(height: 8),
                      Text(
                        'Sign in to your account to continue',
                        style: AppTextStyles.body
                            .copyWith(color: AppColors.textSecondary),
                      ),
                      const SizedBox(height: 40),
                      // Email field
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
                      // Password field
                      AppTextField(
                        label: 'Password',
                        hint: 'Your password',
                        controller: _passwordCtrl,
                        obscureText: true,
                        prefixIcon: const Icon(Icons.lock_outline,
                            color: AppColors.textSecondary, size: 20),
                        validator: (v) {
                          if (v == null || v.isEmpty) return 'Password is required';
                          if (v.length < 6) return 'Min 6 characters';
                          return null;
                        },
                      ),
                      const SizedBox(height: 32),
                      // Sign in button
                      AppPrimaryButton(
                        label: 'Sign In',
                        isLoading: state.isLoading,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<AuthBloc>().add(AuthEvent.signIn(
                                  email: _emailCtrl.text.trim(),
                                  password: _passwordCtrl.text,
                              role: widget.role,
                                ));
                          }
                        },
                      ),
                      const SizedBox(height: 24),
                      // Sign up link
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: AppTextStyles.body.copyWith(
                                color: AppColors.textSecondary),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.of(context)
                                .pushNamed(SignUpScreen.route),
                            child: Text(
                              'Sign Up',
                              style: AppTextStyles.body.copyWith(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
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
