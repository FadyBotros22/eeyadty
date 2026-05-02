import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';
import 'svg_icon.dart';

class AppCheckBox extends StatelessWidget {
  final bool value;
  final Function(bool?)? onChanged;
  const AppCheckBox({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onChanged != null) {
          onChanged!(!value);
        }
      },
      child: SvgIcon(
        path: value
            ? MyAssets.images.svg.icCheckSquare.path
            : MyAssets.images.svg.icCheckEmpty.path,
        size: 20,
      ),
    );
  }
}
