import 'package:easy_localization/easy_localization.dart' as loc;
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart' as intl;

import '../../../app_config.dart';
import '../../../domain/utils/locale_helper.dart';
import '../../../domain/utils/text_helper.dart';
import '../../../domain/utils/ui_constants.dart';
import '../../../domain/utils/ui_helper.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/locale_keys.g.dart';
import '../custom_international_phone_number_input.dart';
import '../svg_icon.dart';

class PhoneTextField extends StatefulWidget {
  final String? hint;
  final Function(intl.PhoneNumber) onChange;
  final Function(bool) onValidate;

  const PhoneTextField({
    super.key,
    this.hint,
    required this.onChange,
    required this.onValidate,
  });

  @override
  State<PhoneTextField> createState() => _PhoneTextFieldState();
}

class _PhoneTextFieldState extends State<PhoneTextField> {
  String initialCountry = 'SA';
  late intl.PhoneNumber currentNumber;
  late TextEditingController? controller;
  bool isValid = true;

  @override
  void initState() {
    controller = TextEditingController();
    currentNumber = intl.PhoneNumber(isoCode: 'SA', dialCode: '+966');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomInternationalPhoneNumberInput(
      isValid: isValid,
      ignoreBlank: true,
      formatInput: false,
      initialValue: currentNumber,
      inputBorder: InputBorder.none,
      textFieldController: controller,
      keyboardType: TextInputType.phone,
      autoValidateMode: AutovalidateMode.disabled,
      textStyle: Styles.line(),
      textAlign: TextAlign.start,
      locale: context.locale.languageCode,
      spaceBetweenSelectorAndTextField: 0,
      selectorButtonOnErrorPadding: 0,
      textAlignVertical: TextAlignVertical.center,
      inputDecoration: InputDecoration(
          contentPadding: const EdgeInsetsDirectional.symmetric(vertical: 12),
          border: InputBorder.none,
          hintStyle: Styles.hint(),
          hintText: widget.hint,
          hintTextDirection: getLocaleString() == 'ar'
              ? TextDirection.rtl
              : TextDirection.ltr,
          prefixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgIcon(
                path: MyAssets.images.svg.icArrowDown.path,
                color: ColorConstants.primaryColor60,
                size: AppConfig.shared.flavor == Flavor.staging ? 20 : 0,
              ),
              const Width(12),
              VerticalDivider(
                color: ColorConstants.primaryColor24,
                width: 1,
                thickness: 1,
                endIndent: 12,
                indent: 12,
              ),
            ],
          ),
          prefixIconConstraints: AppConfig.shared.flavor == Flavor.staging
              ? null
              : const BoxConstraints(minWidth: 26)),
      selectorTextStyle: Styles.customStyle(
        color: ColorConstants.primaryColor60,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      selectorConfig: const intl.SelectorConfig(
        selectorType: intl.PhoneInputSelectorType.BOTTOM_SHEET,
        trailingSpace: false,
        useBottomSheetSafeArea: true,
      ),
      searchBoxDecoration: InputDecoration(
        constraints: const BoxConstraints(maxHeight: 40),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: ColorConstants.lightGrey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: ColorConstants.lightGrey),
        ),
        fillColor: ColorConstants.lightGrey,
        filled: true,
        hintStyle: Styles.line(color: ColorConstants.primaryColor40),
        hintText: LocaleKeys.onBoardingScreenSearchForCountry.tr(),
        prefixIconConstraints:
            const BoxConstraints(maxHeight: 40, maxWidth: 40),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgIcon(
            path: MyAssets.images.svg.icSearch.path,
          ),
        ),
      ),
      onInputChanged: (intl.PhoneNumber number) {
        widget.onChange(number);
        setState(() {
          isValid = true;
        });
      },
      onInputValidated: (value) {
        setState(() {
          isValid = value;
        });
        widget.onValidate(value);
      },
      countries: const ['EG', 'SA'],
      isCountrySectionEnabled: AppConfig.shared.flavor == Flavor.staging,
    ).setToLTR();
  }
}
