import 'package:flutter/material.dart';

import '../../domain/utils/ui_constants.dart';
import 'network_image.dart';

class NetworkImageWithBorder extends StatelessWidget {
  const NetworkImageWithBorder({
    super.key,
    this.imageUrl,
    this.width,
    this.height,
    this.placeholderPath,
    this.fit = BoxFit.cover,
    this.cornerRadiusBottomLeft = 0,
    this.cornerRadiusBottomRight = 0,
    this.cornerRadiusTopLeft = 0,
    this.cornerRadiusTopRight = 0,
    required this.cornerRadius,
  });
  final String? imageUrl;
  final double? width;
  final double? height;
  final String? placeholderPath;
  final double cornerRadius;
  final double cornerRadiusTopRight;
  final double cornerRadiusTopLeft;
  final double cornerRadiusBottomRight;
  final double cornerRadiusBottomLeft;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(cornerRadius),
        border: Border.all(
          color: ColorConstants.borderColor, // border color
          width: 0.5,
        ),
        color: ColorConstants.white, // background color (optional)
      ),
      child: NetworkImageLoader(
        imageUrl: imageUrl,
        width: width,
        height: height,
        fit: fit,
        cornerRadius: cornerRadius,
        cornerRadiusTopRight: cornerRadiusTopRight,
        cornerRadiusTopLeft: cornerRadiusTopLeft,
        cornerRadiusBottomRight: cornerRadiusBottomRight,
        cornerRadiusBottomLeft: cornerRadiusBottomLeft,
        placeholderPath: placeholderPath,
      ),
    );
  }
}
