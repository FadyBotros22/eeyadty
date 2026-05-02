import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../domain/utils/text_helper.dart';
import '../../../domain/utils/ui_constants.dart';

class AppOutlinedIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final String iconPath;
  final String label;
  final Color? backGroundColor;
  final Color? forGroundColor;

  const AppOutlinedIconButton({
    super.key,
    required this.onTap,
    required this.iconPath,
    required this.label,
    this.forGroundColor,
    this.backGroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: OutlinedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: backGroundColor,
          foregroundColor: forGroundColor,
          side: BorderSide(
            color: ColorConstants.borderColor,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onTap,
        icon: SizedBox(
          height: 25,
          width: 25,
          child: SvgPicture.asset(iconPath),
        ),
        label: Text(label.tr(), style: Styles.line()),
      ),
    );
  }
}
