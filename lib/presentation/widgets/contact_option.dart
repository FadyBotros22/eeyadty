import 'package:flutter/material.dart';

import '../../domain/utils/text_helper.dart';
import '../../domain/utils/ui_constants.dart';
import '../../domain/utils/ui_helper.dart';
import 'svg_icon.dart';

class ContactOption extends StatelessWidget {
  final String title;
  final String iconPath;
  final VoidCallback? onTap;
  const ContactOption(
      {super.key, required this.iconPath, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 48,
            height: 48,
            padding: const EdgeInsets.all(oneAndHalfPadding),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorConstants.lightGrey,
            ),
            child: SvgIcon(
              path: iconPath,
              size: 24,
            ),
          ),
          const Height(normalPadding),
          AppText(
            title,
            textStyle: Styles.subBody(color: ColorConstants.darkBlue),
          )
        ],
      ),
    );
  }
}
