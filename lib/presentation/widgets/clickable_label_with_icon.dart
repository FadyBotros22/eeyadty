import 'package:easy_localization/easy_localization.dart';
import 'package:eeyadty/presentation/widgets/svg_icon.dart';
import 'package:flutter/material.dart';

import '../../domain/utils/text_helper.dart';
import '../../domain/utils/ui_helper.dart';

class ClickableLabelWithIcon extends StatelessWidget {
  const ClickableLabelWithIcon(
      {super.key,
      required this.onClicked,
      required this.iconPath,
      required this.label,
      this.style});
  final VoidCallback onClicked;
  final String iconPath;
  final String label;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClicked,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: SvgIcon(
              path: iconPath,
              size: 16,
            ),
          ),
          const Width(10),
          Expanded(
            child: Transform.translate(
                offset: const Offset(0, 0),
              child: Text(
                label.tr(),
                style: style ?? Styles.label(),
                textAlign: TextAlign.start,
                strutStyle: const StrutStyle(
                  forceStrutHeight: true,
                  height: 1.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
