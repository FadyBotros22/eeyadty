import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../domain/utils/text_helper.dart';
import '../../../domain/utils/ui_constants.dart';


class AppElevatedStrokeButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final bool enabled;
  final bool isBig;
  final Color? color;
  final double? stroke;
  final double? height;
  final TextStyle? textStyle;

  const AppElevatedStrokeButton({
    super.key,
    required this.onTap,
    required this.text,
    this.isBig = true,
    this.enabled = true,
    this.color,
    this.stroke,
    this.height,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 48,
      width: isBig ? double.maxFinite : null,
      child: ElevatedButton(
        onPressed: enabled ? onTap : null,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: color ?? ColorConstants.darkBlue,
              width: stroke ?? 1,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: AppText(
          text.tr(),
          textStyle: textStyle ?? Styles.button(),
        ),
      ),
    );
  }
}
