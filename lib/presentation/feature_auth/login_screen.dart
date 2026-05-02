import 'package:beautisry_merchant/domain/di/dependency_injection.dart';
import 'package:beautisry_merchant/presentation/feature_auth/verify_otp_screen.dart';
import 'package:beautisry_merchant/presentation/feature_auth/widgets/login_title.dart';
import 'package:beautisry_merchant/presentation/widgets/dimmed_loader.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import '../../domain/models/enums/active_auth_page.dart';
import '../../domain/utils/text_helper.dart';
import '../../domain/utils/ui_helper.dart';
import '../../gen/locale_keys.g.dart';
import '../widgets/inputs/phone_text_field.dart';
import 'bloc/auth_bloc.dart';
import 'bloc/auth_event.dart';
import 'bloc/auth_state.dart';

class LoginScreen extends StatefulWidget {
  static const route = '/login-screen';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<AuthBloc>(),
      child: const LoginView(),
    );
  }
}

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  PhoneNumber? phoneNumber;
  String? countryCode;
  bool isValid = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.activePage == ActiveAuthPage.verifyOtp &&
            !state.inRegistrationSteps &&
            !state.isLoading) {
          if (phoneNumber != null) {
            Navigator.of(context).pushNamed(
              VerifyOtpScreen.route,
              arguments: VerifyOtpScreenArguments(phoneNumber: phoneNumber!),
            );
            getIt<AuthBloc>().add(const AuthEvent.resetActivePage());
          }
        }
      },
      builder: (context, state) {
        return DimmedLoader(
          showLoader: state.isLoading,
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            body: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Height(topSafeMargin * 1.5),
                      const LoginTitle(),
                      const Height(halfPadding),
                      AppText(
                        LocaleKeys.loginScreenSubtitle,
                        textStyle: Styles.body(),
                        textAlign: TextAlign.start,
                      ),
                      const Height(normalPadding),
                      const Height(doublePadding),
                      AppText(LocaleKeys.loginScreenMobileNumber,
                          textStyle: Styles.line()),
                      const Height(halfPadding),
                      PhoneTextField(
                        onValidate: (value) {
                          if (value) {
                            _onContinueClicked();
                          }
                        },
                        onChange: (value) {
                          setState(() {
                            phoneNumber = value;
                            countryCode = phoneNumber?.dialCode;
                          });
                        },
                        hint: LocaleKeys.loginScreenMobileNumberHint.tr(),
                      ),
                      const Height(bottomSafeMargin),
                    ],
                  ).respectBodyMargin(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _onContinueClicked() {
    getIt<AuthBloc>().add(AuthEvent.sendOtp(phone: phoneNumber,isValid:  isValid));
  }
}
