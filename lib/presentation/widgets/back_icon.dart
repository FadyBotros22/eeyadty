import 'package:eeyadty/domain/utils/ui_helper.dart';
import 'package:eeyadty/presentation/widgets/svg_icon.dart';
import 'package:flutter/material.dart';

import '../../domain/utils/ui_constants.dart';
import '../../gen/assets.gen.dart';

class BackIcon extends StatelessWidget {
  final VoidCallback? onTap;
  const BackIcon({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(
            width: 0.5,
            color: ColorConstants.borderColor,
          ),
        ),
        child: SvgIcon(size: 25, path: MyAssets.images.svg.arrowLeft.path)
            .mirrorRTL(),
      ),
    );
  }
}
