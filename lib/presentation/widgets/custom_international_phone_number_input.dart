import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_number_input/src/models/country_list.dart';
import 'package:intl_phone_number_input/src/models/country_model.dart';
import 'package:intl_phone_number_input/src/providers/country_provider.dart';
import 'package:intl_phone_number_input/src/utils/formatter/as_you_type_formatter.dart';
import 'package:intl_phone_number_input/src/utils/phone_number.dart';
import 'package:intl_phone_number_input/src/utils/phone_number/phone_number_util.dart';
import 'package:intl_phone_number_input/src/utils/selector_config.dart';
import 'package:intl_phone_number_input/src/utils/test/test_helper.dart';
import 'package:intl_phone_number_input/src/utils/util.dart';
import 'package:intl_phone_number_input/src/utils/widget_view.dart';
import 'package:intl_phone_number_input/src/widgets/selector_button.dart';

import '../../domain/utils/locale_helper.dart';
import '../../domain/utils/text_helper.dart';
import '../../domain/utils/ui_constants.dart';
import '../../domain/utils/ui_helper.dart';
import '../../gen/locale_keys.g.dart';
import 'buttons/app_elevated_button.dart';


class CustomInternationalPhoneNumberInput extends StatefulWidget {
  final SelectorConfig selectorConfig;

  final ValueChanged<PhoneNumber>? onInputChanged;
  final ValueChanged<bool>? onInputValidated;

  final VoidCallback? onSubmit;
  final ValueChanged<String>? onFieldSubmitted;
  final String? Function(String?)? validator;
  final ValueChanged<PhoneNumber>? onSaved;

  final Key? fieldKey;
  final TextEditingController? textFieldController;
  final TextInputType keyboardType;
  final TextInputAction? keyboardAction;

  final PhoneNumber? initialValue;
  final String? hintText;
  final String? errorMessage;

  final double selectorButtonOnErrorPadding;

  /// Ignored if [setSelectorButtonAsPrefixIcon = true]
  final double spaceBetweenSelectorAndTextField;
  final int maxLength;

  final bool isEnabled;
  final bool isCountrySectionEnabled;
  final bool formatInput;
  final bool autoFocus;
  final bool autoFocusSearch;
  final AutovalidateMode autoValidateMode;
  final bool ignoreBlank;
  final bool countrySelectorScrollControlled;

  final String? locale;

  final TextStyle? textStyle;
  final TextStyle? selectorTextStyle;
  final InputBorder? inputBorder;
  final InputDecoration? inputDecoration;
  final InputDecoration? searchBoxDecoration;
  final Color? cursorColor;
  final TextAlign textAlign;
  final TextAlignVertical textAlignVertical;
  final EdgeInsets scrollPadding;

  final FocusNode? focusNode;
  final Iterable<String>? autofillHints;

  final List<String>? countries;
  final bool isValid;

  const CustomInternationalPhoneNumberInput({
    super.key,
    this.selectorConfig = const SelectorConfig(),
    required this.onInputChanged,
    this.onInputValidated,
    this.onSubmit,
    this.onFieldSubmitted,
    this.validator,
    this.onSaved,
    this.fieldKey,
    this.textFieldController,
    this.keyboardAction,
    this.keyboardType = TextInputType.phone,
    this.initialValue,
    this.hintText = 'Phone number',
    this.errorMessage = 'Invalid phone number',
    this.selectorButtonOnErrorPadding = 24,
    this.spaceBetweenSelectorAndTextField = 12,
    this.maxLength = 15,
    this.isEnabled = true,
    this.isCountrySectionEnabled = true,
    this.formatInput = true,
    this.autoFocus = false,
    this.autoFocusSearch = false,
    this.autoValidateMode = AutovalidateMode.disabled,
    this.ignoreBlank = false,
    this.countrySelectorScrollControlled = true,
    this.locale,
    this.textStyle,
    this.selectorTextStyle,
    this.inputBorder,
    this.inputDecoration,
    this.searchBoxDecoration,
    this.textAlign = TextAlign.start,
    this.textAlignVertical = TextAlignVertical.center,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.focusNode,
    this.cursorColor,
    this.autofillHints,
    this.countries,
    required this.isValid,
  });

  @override
  State<StatefulWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<CustomInternationalPhoneNumberInput> {
  TextEditingController? controller;
  double selectorButtonBottomPadding = 0;

  Country? country;
  List<Country> countries = [];
  bool isNotValid = true;

  @override
  void initState() {
    super.initState();
    loadCountries();
    controller = widget.textFieldController ?? TextEditingController();
    initialiseWidget();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return _InputWidgetView(state: this);
  }

  @override
  void didUpdateWidget(CustomInternationalPhoneNumberInput oldWidget) {
    loadCountries(previouslySelectedCountry: country);
    if (oldWidget.initialValue?.hash != widget.initialValue?.hash) {
      if (country!.alpha2Code != widget.initialValue?.isoCode) {
        loadCountries();
      }
      initialiseWidget();
    }
    super.didUpdateWidget(oldWidget);
  }

  /// [initialiseWidget] sets initial values of the widget
  void initialiseWidget() async {
    if (widget.initialValue != null) {
      if (widget.initialValue!.phoneNumber != null &&
          widget.initialValue!.phoneNumber!.isNotEmpty &&
          (await PhoneNumberUtil.isValidNumber(
            phoneNumber: widget.initialValue!.phoneNumber!,
            isoCode: widget.initialValue!.isoCode!,
          ))!) {
        String phoneNumber = await PhoneNumber.getParsableNumber(
          widget.initialValue!,
        );

        controller!.text = widget.formatInput
            ? phoneNumber
            : phoneNumber.replaceAll(RegExp(r'[^\d+]'), '');

        phoneNumberControllerListener();
      }
    }
  }

  /// loads countries from [Countries.countryList] and selected Country
  void loadCountries({Country? previouslySelectedCountry}) {
    if (mounted) {
      List<Country> countries = CountryProvider.getCountriesData(
        countries: widget.countries,
      );

      Country country =
          previouslySelectedCountry ??
              Utils.getInitialSelectedCountry(
                countries,
                widget.initialValue?.isoCode ?? '',
              );

      // Remove potential duplicates
      countries = countries.toSet().toList();

      final CountryComparator? countryComparator =
          widget.selectorConfig.countryComparator;
      if (countryComparator != null) {
        countries.sort(countryComparator);
      }

      setState(() {
        this.countries = countries;
        this.country = country;
      });
    }
  }

  /// Listener that validates changes from the widget, returns a bool to
  /// the `ValueCallback` [widget.onInputValidated]
  void phoneNumberControllerListener({bool? shouldValidate}) {
    if (mounted) {
      String parsedPhoneNumberString = controller!.text.replaceAll(
        RegExp(r'[^\d+]'),
        '',
      );

      getParsedPhoneNumber(
        parsedPhoneNumberString,
        country?.alpha2Code,
        '${country?.dialCode}$parsedPhoneNumberString',
      ).then((phoneNumber) {
        if (phoneNumber == null) {
          String phoneNumber = '${country?.dialCode}$parsedPhoneNumberString';

          if (widget.onInputChanged != null) {
            widget.onInputChanged!(
              PhoneNumber(
                phoneNumber: phoneNumber,
                isoCode: country?.alpha2Code,
                dialCode: country?.dialCode,
              ),
            );
          }

          if (shouldValidate == true && widget.onInputValidated != null) {
            widget.onInputValidated!(false);
          }
          isNotValid = true;
        } else {
          if (widget.onInputChanged != null) {
            widget.onInputChanged!(
              PhoneNumber(
                phoneNumber: phoneNumber,
                isoCode: country?.alpha2Code,
                dialCode: country?.dialCode,
              ),
            );
          }

          if (shouldValidate == true && widget.onInputValidated != null) {
            widget.onInputValidated!(true);
          }
          isNotValid = false;
        }
      });
    }
  }

  /// Returns a formatted String of [phoneNumber] with [isoCode], returns `null`
  /// if [phoneNumber] is not valid or if an [Exception] is caught.
  Future<String?> getParsedPhoneNumber(
      String phoneNumber,
      String? isoCode,
      String fullNumber,
      ) async {
    if (phoneNumber.isNotEmpty && isoCode != null) {
      try {
        bool isValidPhoneNumber = !_isPhoneNumberNotValid(fullNumber);
        if (isValidPhoneNumber) {
          return fullNumber;
        }
      } on Exception {
        return null;
      }
    }
    return null;
  }

  static const int minPhoneNumberLength = 13;
  static const int maxPhoneNumberLength = 14;

  bool _isPhoneNumberNotValid(String phoneNumber) {
    final bool isEligibleForChecking =
        phoneNumber.isNotEmpty && phoneNumber != '+20' && phoneNumber != '+966';

    if (phoneNumber.startsWith('+200') || phoneNumber.startsWith('+9660')) {
      return isEligibleForChecking && phoneNumber.length != 14;
    } else if (phoneNumber.startsWith('+20') ||
        phoneNumber.startsWith('+966')) {
      return isEligibleForChecking && phoneNumber.length != 13;
    }
    return isEligibleForChecking &&
        (phoneNumber.length < minPhoneNumberLength ||
            phoneNumber.length > maxPhoneNumberLength);
  }

  /// Creates or Select [InputDecoration]
  InputDecoration getInputDecoration(InputDecoration? decoration) {
    InputDecoration value =
        decoration ??
            InputDecoration(
              border: widget.inputBorder ?? const UnderlineInputBorder(),
              hintText: widget.hintText,
            );

    if (widget.selectorConfig.setSelectorButtonAsPrefixIcon) {
      return value.copyWith(
        prefixIcon: SelectorButton(
          country: country,
          countries: countries,
          onCountryChanged: onCountryChanged,
          selectorConfig: widget.selectorConfig,
          selectorTextStyle: widget.selectorTextStyle,
          searchBoxDecoration: widget.searchBoxDecoration,
          locale: locale,
          isEnabled: widget.isEnabled,
          autoFocusSearchField: widget.autoFocusSearch,
          isScrollControlled: widget.countrySelectorScrollControlled,
        ),
      );
    }

    return value;
  }

  /// Validate the phone number when a change occurs
  void onChanged(String? value) {
    phoneNumberControllerListener();
  }

  /// Validate and returns a validation error when [FormState] validate is called.
  ///
  /// Also updates [selectorButtonBottomPadding]
  String? validator(String? value) {
    bool isValid =
        isNotValid && (value!.isNotEmpty || widget.ignoreBlank == false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (isValid && widget.errorMessage != null) {
        setState(() {
          selectorButtonBottomPadding = widget.selectorButtonOnErrorPadding;
        });
      } else {
        setState(() {
          selectorButtonBottomPadding = 0;
        });
      }
    });

    return isValid ? widget.errorMessage : null;
  }

  /// Changes Selector Button Country and Validate Change.
  void onCountryChanged(Country? country) {
    setState(() {
      this.country = country;
    });
    phoneNumberControllerListener();
  }

  void _phoneNumberSaved() {
    if (mounted) {
      String parsedPhoneNumberString = controller!.text.replaceAll(
        RegExp(r'[^\d+]'),
        '',
      );

      String phoneNumber = (country?.dialCode ?? '') + parsedPhoneNumberString;

      widget.onSaved?.call(
        PhoneNumber(
          phoneNumber: phoneNumber,
          isoCode: country?.alpha2Code,
          dialCode: country?.dialCode,
        ),
      );
    }
  }

  /// Saved the phone number when form is saved
  void onSaved(String? value) {
    _phoneNumberSaved();
  }

  /// Corrects duplicate locale
  String? get locale {
    if (widget.locale == null) return null;

    if (widget.locale!.toLowerCase() == 'nb' ||
        widget.locale!.toLowerCase() == 'nn') {
      return 'no';
    }
    return widget.locale;
  }
}

class _InputWidgetView
    extends WidgetView<CustomInternationalPhoneNumberInput, _InputWidgetState> {
  final _InputWidgetState state;

  _InputWidgetView({Key? key, required this.state})
      : super(key: key, state: state);

  @override
  Widget build(BuildContext context) {
    final countryCode = state.country?.alpha2Code ?? '';
    final dialCode = state.country?.dialCode ?? '';

    return Column(
      children: [
        Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: widget.isValid
                  ? ColorConstants.borderColor
                  : ColorConstants.redShadeColor,
            ),
          ),
          constraints: const BoxConstraints(minWidth: 400),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              if (!widget.selectorConfig.setSelectorButtonAsPrefixIcon) ...[
               Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SelectorButton(
                      country: state.country,
                      countries: state.countries,
                      onCountryChanged: state.onCountryChanged,
                      selectorConfig: widget.selectorConfig,
                      selectorTextStyle: widget.selectorTextStyle,
                      searchBoxDecoration: widget.searchBoxDecoration,
                      locale: state.locale,
                      isEnabled: widget.isCountrySectionEnabled,
                      autoFocusSearchField: widget.autoFocusSearch,
                      isScrollControlled:
                      widget.countrySelectorScrollControlled,
                    ),
                    SizedBox(height: state.selectorButtonBottomPadding),
                  ],
                ),
                SizedBox(width: widget.spaceBetweenSelectorAndTextField),
              ],
              Flexible(
                child: TextFormField(
                  key:
                  widget.fieldKey ??
                      const Key(TestHelper.TextInputKeyValue),
                  textDirection: TextDirection.ltr,
                  controller: state.controller,
                  cursorColor: widget.cursorColor,
                  focusNode: widget.focusNode,
                  enabled: widget.isEnabled,
                  autofocus: widget.autoFocus,
                  keyboardType: widget.keyboardType,
                  textInputAction: widget.keyboardAction,
                  style: widget.textStyle,
                  decoration: state.getInputDecoration(widget.inputDecoration),
                  textAlign: widget.textAlign,
                  textAlignVertical: widget.textAlignVertical,
                  onEditingComplete: widget.onSubmit,
                  onFieldSubmitted: widget.onFieldSubmitted,
                  autovalidateMode: widget.autoValidateMode,
                  autofillHints: widget.autofillHints,
                  validator: widget.validator ?? state.validator,
                  onSaved: state.onSaved,
                  scrollPadding: widget.scrollPadding,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(widget.maxLength),
                    FilteringTextInputFormatter.digitsOnly,
                    if (widget.formatInput)
                      AsYouTypeFormatter(
                        isoCode: countryCode,
                        dialCode: dialCode,
                        onInputFormatted: (TextEditingValue value) {
                          state.controller!.value = value;
                        },
                      ),
                  ],
                  onChanged: state.onChanged,
                ),
              ),
            ],
          ),
        ),
        const Height(halfPadding),
        if (!widget.isValid)
          Container(
            constraints: const BoxConstraints(minWidth: 400),
            child: Align(
              alignment: getLocaleString() == 'ar'
                  ? AlignmentDirectional.centerEnd
                  : AlignmentDirectional.centerStart,
              child: AppText(
                state.controller?.text == null ||
                    state.controller?.text.isEmpty == true
                    ? LocaleKeys.loginScreenErrorMessageEmpty
                    : LocaleKeys.loginScreenErrorMessage,
                textStyle: Styles.customStyle(
                  color: ColorConstants.redShadeColor,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        const Height(oneAndHalfPadding),
          Container(
            constraints: const BoxConstraints(minWidth: 350),
            child: SizedBox(
              width: double.maxFinite,
              child: AppElevatedButton(
                onTap: () =>
                    state.phoneNumberControllerListener(shouldValidate: true),
                text: LocaleKeys.continueText,
              ),
            ),
          ),
      ],
    );
  }
}
