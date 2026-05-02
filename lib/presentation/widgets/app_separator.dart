import 'package:flutter/cupertino.dart';

import '../../domain/utils/ui_constants.dart';

class AppSeparator extends StatelessWidget {
  const AppSeparator({super.key, this.height, this.color, this.separatorHeight});
  final double? height;
  final double? separatorHeight;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 35,
      child: Center(
        child: Container(
          height: separatorHeight ?? 1,
          color: color ?? ColorConstants.primaryColor8,
        ),
      ),
    );
  }
}
