import 'package:flutter/material.dart';

import '../../domain/utils/text_helper.dart';
import '../../domain/utils/ui_helper.dart';
import 'animated_progressbar.dart';
import 'back_icon.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackPressed;
  final int progressValue;
  final int totalLength;
  final List<Widget> trailing;
  final bool showProgressLine;
  final bool isBackButtonVisible;

  const CustomAppBar({
    super.key,
    this.onBackPressed,
    this.progressValue = 1,
    this.totalLength = 1,
    required this.title,
    this.showProgressLine = true,
    this.trailing = const [],
    this.isBackButtonVisible = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
              horizontal: doublePadding, vertical: normalPadding),
          child: AppBar(
            surfaceTintColor: Colors.transparent,
            leading:
                isBackButtonVisible ? BackIcon(onTap: onBackPressed) : null,
            automaticallyImplyLeading: false,
            titleSpacing: isBackButtonVisible ? 12 : 0,
            title: AppText(
              title,
              textStyle: Styles.subTitle(),
            ),
            centerTitle: false,
            actions: trailing,
          ),
        ),
        if (showProgressLine)
          Align(
            alignment: Alignment.centerLeft,
            child: AnimatedProgressBar(
              value: (progressValue) / totalLength,
            ),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(76);
}
