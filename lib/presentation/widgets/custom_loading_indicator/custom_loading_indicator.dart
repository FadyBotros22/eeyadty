import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../../gen/assets.gen.dart';
import 'custom_rotating_arc.dart';

class CustomLoadingIndicator extends StatelessWidget {
  final Gradient gradient;
  final double size;
  final double thickness;
  final double iconSize;

  const CustomLoadingIndicator({
    super.key,
    this.gradient = const LinearGradient(
      colors: [Color(0xffF05053), Color(0xffE1EEC3)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    this.size = 60,
    this.thickness = 3,
    this.iconSize = 35,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomRotatingArc(
          gradient: gradient,
          size: size,
          thickness: thickness,
        ),
        SvgPicture.asset(
          MyAssets.images.svg.appIcon.path,
          width: iconSize,
          height: iconSize,
        ),
      ],
    );
  }
}
