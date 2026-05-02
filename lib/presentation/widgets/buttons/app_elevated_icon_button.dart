import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../domain/utils/text_helper.dart';
import '../../../domain/utils/ui_constants.dart';
import '../svg_icon.dart';

class AppElevatedIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final String iconPath;
  final Color? iconColor;
  final String label;
  final Color? backGroundColor;
  final Color? forGroundColor;
  final bool isBig;
  final double? width;
  final TextStyle? textStyle;

  const AppElevatedIconButton(
      {super.key,
      required this.onTap,
      required this.iconPath,
      required this.label,
      this.forGroundColor,
      this.isBig = false,
      this.width,
      this.backGroundColor,
      this.textStyle,
      this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 48,
        width: width,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            foregroundColor: forGroundColor ?? ColorConstants.darkBlue,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            backgroundColor: backGroundColor ?? ColorConstants.primaryAppColor,
            textStyle: textStyle ??
                Styles.customStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: ColorConstants.darkBlue,
                ),
          ),
          onPressed: onTap,
          icon: SizedBox(
            height: 25,
            width: 25,
            child: SvgIcon(
              path: iconPath,
              color: iconColor,
            ),
            // SvgPicture.asset(iconPath),
          ),
          label: Text(
            label.tr(),
          ),
        ),
      ),
    );
  }
}
