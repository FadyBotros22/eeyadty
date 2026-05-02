import 'package:flutter/material.dart';

class AssetCircleImage extends StatelessWidget {
  final String imagePath;
  final double? imageSize;
  const AssetCircleImage(
      {super.key, required this.imagePath, this.imageSize = 48});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: imageSize,
      width: imageSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(imagePath),
        ),
      ),
    );
  }
}
