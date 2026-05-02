import 'package:beautisry_merchant/domain/utils/text_helper.dart';
import 'package:beautisry_merchant/domain/utils/ui_constants.dart';
import 'package:beautisry_merchant/presentation/feature_auth/bloc/auth_event.dart';
import 'package:beautisry_merchant/presentation/feature_auth/registration/registration_screen.dart';
import 'package:beautisry_merchant/presentation/feature_home/home_screen.dart';
import 'package:beautisry_merchant/presentation/widgets/buttons/app_elevated_button.dart';
import 'package:beautisry_merchant/presentation/widgets/custom_app_bar.dart';
import 'package:beautisry_merchant/presentation/widgets/dimmed_loader.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../domain/di/dependency_injection.dart';
import '../../domain/models/enums/active_auth_page.dart';
import '../../domain/utils/ui_helper.dart';
import '../../gen/locale_keys.g.dart';
import 'bloc/auth_bloc.dart';
import 'bloc/auth_state.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOtpScreenArguments {
  final PhoneNumber phoneNumber;

  VerifyOtpScreenArguments({required this.phoneNumber});
}

class VerifyOtpScreen extends StatefulWidget {
  static const route = '/verify-otp-screen';

  final PhoneNumber phoneNumber;

  const VerifyOtpScreen({
    super.key,
    required this.phoneNumber,
  });

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<AuthBloc>(),
      child: VerifyOtpView(
        phoneNumber: widget.phoneNumber,
      ),
    );
  }
}

class VerifyOtpView extends StatefulWidget {
  final PhoneNumber phoneNumber;

  const VerifyOtpView({super.key, required this.phoneNumber});

  @override
  State<VerifyOtpView> createState() => _VerifyOtpViewState();
}

class _VerifyOtpViewState extends State<VerifyOtpView> {
  int otpLength = 4;
  bool isTimerLoading = true;
  DateTime _endTime = DateTime.now().add(
    const Duration(seconds: 60),
  );
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listenWhen: (previous, current) {
        if (previous.isLoading && !current.isLoading) {
          setState(() {
            otpController.text = '';
          });
        }
        return true;
      },
      listener: (context, state) {
        if (state.activePage == ActiveAuthPage.addImage &&
            !state.inRegistrationSteps) {
          Navigator.of(context).pushNamed(RegistrationScreen.route);
        }
        if (state.activePage == ActiveAuthPage.goHome &&
            !state.inRegistrationSteps) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(HomeScreen.route, (route) => false);
        }
        if (state.shouldResetTimer) {
          setState(() {
            _endTime = DateTime.now().add(
              const Duration(seconds: 60),
            );
            isTimerLoading = true;
          });
        }
      },
      builder: (context, state) {
        return DimmedLoader(
          showLoader: state.isLoading,
          child: Scaffold(
            appBar: CustomAppBar(
              title: '',
              onBackPressed: () {
                Navigator.of(context).pop();
              },
              showProgressLine: false,
            ),
            body: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
              child: Column(
                children: [
                  AppText(
                    LocaleKeys.verifyOtpScreenTitle,
                    textStyle: Styles.customStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: ColorConstants.darkBlue,
                    ),
                  ),
                  const Height(8.0),
                  AppText(
                    '${LocaleKeys.verifyOtpScreenSubtitle.tr()} \u200E${widget.phoneNumber.phoneNumber}',
                    textStyle: Styles.customStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: ColorConstants.primaryColor60,
                    ),
                  ),
                  const Height(30.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: PinCodeTextField(
                      appContext: context,
                      controller: otpController,
                      length: otpLength,
                      obscureText: false,
                      keyboardType: TextInputType.number,
                      animationType: AnimationType.fade,
                      textStyle: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(8),
                        fieldHeight: 48,
                        fieldWidth: 47,
                        activeFillColor: Colors.white,
                        activeColor: ColorConstants.primaryColor8,
                        selectedColor: ColorConstants.primaryColor8,
                        inactiveColor: ColorConstants.primaryColor8,
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      onChanged: (_) => setState(() {}),
                    ).setToLTR(),
                  ),
                  const Height(24),
                  AppElevatedButton(
                    onTap: () {
                      getIt<AuthBloc>().add(
                        AuthEvent.verifyOtp(
                            otpController.text,
                            widget.phoneNumber.phoneNumber ?? '',
                            widget.phoneNumber.dialCode ?? ''),
                      );
                    },
                    text: LocaleKeys.continueText,
                    enabled: otpController.text.length == otpLength,
                  ),
                  const Height(30),
                  Container(
                    key: ValueKey(_endTime),
                    width: 100,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        color: ColorConstants.primaryColor8,
                      ),
                    ),
                    child: TimerCountdown(
                      timeTextStyle: Styles.customStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                      colonsTextStyle: Styles.customStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                      spacerWidth: 2,
                      enableDescriptions: false,
                      format: CountDownTimerFormat.minutesSeconds,
                      endTime: _endTime,
                      onEnd: () {
                        setState(() {
                          isTimerLoading = false;
                        });
                      },
                    ),
                  ),
                  const Height(13),
                  if (!isTimerLoading)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          LocaleKeys.verifyOtpScreenDidNotGetCode,
                          textStyle: Styles.customStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        const Width(5),
                        InkWell(
                          onTap: () {
                            getIt<AuthBloc>().add(
                              AuthEvent.sendOtp(
                                  phone: widget.phoneNumber,
                                  isValid: true,
                                  isFromOtpScreen: true),
                            );
                          },
                          child: AppText(
                            LocaleKeys.verifyOtpScreenSendAgain,
                            textStyle: Styles.customStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                isUnderLined: true),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
