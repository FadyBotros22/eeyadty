import 'package:flutter/material.dart';

import '../../domain/utils/ui_constants.dart';
import '../../domain/utils/ui_helper.dart';

class AnimatedProgressBar extends StatefulWidget {
  final double value;
  final Color? backGroundColor;
  final Color? foreGroundColor;
  final double radius;

  const AnimatedProgressBar({
    super.key,
    required this.value,
    this.backGroundColor,
    this.radius = 0,
    this.foreGroundColor,
  });

  @override
  State<AnimatedProgressBar> createState() => _AnimatedProgressBarState();
}

class _AnimatedProgressBarState extends State<AnimatedProgressBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 4,
          color: ColorConstants.borderColor,
        ),
        AnimatedContainer(
          duration: fastAnimationDuration,
          height: 4,
          color: ColorConstants.darkBlue,
          width: widget.value * screenSize(context).width,
        ),
      ],
    );
  }
}
