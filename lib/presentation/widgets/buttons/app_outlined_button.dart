import 'package:flutter/material.dart';

import '../../../domain/utils/text_helper.dart';
import '../../../domain/utils/ui_constants.dart';
import '../../../domain/utils/ui_helper.dart';

class AppOutlinedButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final Color? borderColor;
  final double? radius;
  final double? horizontalPadding;

  const AppOutlinedButton({
    super.key,
    required this.onTap,
    required this.text,
    this.borderColor, this.radius, this.horizontalPadding,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? oneAndHalfPadding,
          vertical: normalPadding,
        ),
        side: BorderSide(
          color: (borderColor == null) ? ColorConstants.borderColor : borderColor!,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 12),
        ),
      ),
      onPressed: onTap,
      child: Text(
        text,
        style: Styles.line(),
      ),
    );
  }
}
