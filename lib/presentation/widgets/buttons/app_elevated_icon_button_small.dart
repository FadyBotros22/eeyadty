import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../domain/utils/text_helper.dart';
import '../../../domain/utils/ui_constants.dart';

class AppElevatedIconButtonSmall extends StatelessWidget {
  final VoidCallback onTap;
  final String iconPath;
  final String label;
  final Color? backGroundColor;
  final Color? forGroundColor;
  final bool isBig;
  final double? width;
  final TextStyle? textStyle;

  const AppElevatedIconButtonSmall({
    super.key,
    required this.onTap,
    required this.iconPath,
    required this.label,
    this.forGroundColor,
    this.isBig = false,
    this.width,
    this.backGroundColor,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: width ?? 100,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 2),
          foregroundColor: forGroundColor ?? ColorConstants.darkBlue,
          backgroundColor: backGroundColor ?? Colors.transparent,
          textStyle: textStyle ??
              Styles.customStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: ColorConstants.darkBlue,
              ),
        ),
        onPressed: onTap,
        icon: SizedBox(
          height: 18, // Set icon size to 18x18
          width: 18,
          child: SvgPicture.asset(iconPath),
        ),
        label: Text(
          label.tr(),
        ),
      ),
    );
  }
}
