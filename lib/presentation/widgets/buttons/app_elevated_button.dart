import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../domain/utils/text_helper.dart';
import '../../../domain/utils/ui_constants.dart';

class AppElevatedButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final Widget? titleWidget;
  final bool enabled;
  final bool isBig;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final double? height;
  final double? width;
  final double? borderRadius;
  final ButtonStyle? style;

  const AppElevatedButton({
    super.key,
    required this.onTap,
    required this.text,
    this.titleWidget,
    this.isBig = true,
    this.enabled = true,
    this.textStyle,
    this.backgroundColor,
    this.height,
    this.borderRadius,
    this.width, this.style,
  });

  @override
  Widget build(BuildContext context) {
    bool shouldUseGradient = backgroundColor == null && style == null;
    return Container(
      decoration: BoxDecoration(
        gradient: shouldUseGradient? ColorConstants.buttonGradient : null,
        borderRadius: BorderRadius.circular(borderRadius ?? 24),
      ),
      height: height ?? 48,
      width: isBig ? double.maxFinite : width,
      child: ElevatedButton(
        onPressed: enabled ? onTap : null,
        style: style?? ElevatedButton.styleFrom(
          padding:
          width != null ? const EdgeInsets.symmetric(horizontal: 0) : null,
          elevation: 0,
          foregroundColor: shouldUseGradient ?Colors.transparent : ColorConstants.redColor,
          shadowColor: Colors.transparent,
          disabledBackgroundColor: const Color(0xffEBEBEB),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 24),
          ),
          backgroundColor: shouldUseGradient ?Colors.transparent :  backgroundColor ?? ColorConstants.primaryAppColor,
        ),
        child:FittedBox(
          child: titleWidget ??
              Text(
                text.tr(),
                style: textStyle ?? Styles.button(color: Colors.white),
              ),
        ) ,
      ),
    );
  }
}
