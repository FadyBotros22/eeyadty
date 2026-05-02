import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../domain/utils/text_helper.dart';
import '../../../domain/utils/ui_constants.dart';

class AppClearBackgroundButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final TextStyle? textStyle;

  const AppClearBackgroundButton({
    super.key,
    required this.onTap,
    required this.text,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: double.maxFinite,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
        ),
        child: Text(
          text.tr(),
          style: textStyle ?? Styles.button(color: ColorConstants.darkBlue),
        ),
      ),
    );
  }
}
