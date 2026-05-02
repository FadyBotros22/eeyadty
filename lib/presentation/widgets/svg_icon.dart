import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcon extends StatelessWidget {
  final double? size;
  final double? height;
  final double? width;

  final Color? color;
  final String path;
  final BoxFit? boxFit;

  const SvgIcon({
    super.key,
    this.size = 24,
    this.color,
    required this.path,
    this.height,
    this.width,
    this.boxFit,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      height: height ?? size,
      width: width ?? size,
      colorFilter: color != null
          ? ColorFilter.mode(
              color!,
              BlendMode.srcIn,
            )
          : null,
      fit: boxFit ?? BoxFit.contain,
    );
  }
}
