import 'package:eeyadty/presentation/widgets/svg_icon.dart';
import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';

class CloseIcon extends StatelessWidget {
  const CloseIcon(
      {super.key, required this.parentContext, this.iconSize, this.color});
  final BuildContext parentContext;
  final double? iconSize;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pop(),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(15, 15, 0, 15),
        child: SvgIcon(
          path: MyAssets.images.svg.icClose.path,
          size: iconSize,
          color: color,
        ),
      ),
    );
  }
}
