import 'package:flutter/material.dart';

import '../../../domain/utils/ui_constants.dart';
import '../svg_icon.dart';

class AppIconButton extends StatelessWidget {
  final String iconPath;
  final VoidCallback? onTap;
  final Color? foreGroundColor;
  final Color? backGroundColor;
  final double? iconSize;
  final double? iconPadding;
  const AppIconButton({
    super.key,
    required this.iconPath,
    this.onTap,
    this.foreGroundColor,
    this.backGroundColor,
    this.iconPadding,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(iconPadding ?? 8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backGroundColor ?? ColorConstants.lightGrey,
        ),
        child: SvgIcon(
          path: iconPath,
          color: foreGroundColor,
          size: iconSize,
        ),
      ),
    );
  }
}
