import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../domain/utils/ui_constants.dart';

class DimmedLoader extends StatelessWidget {
  final Widget child;
  final bool showLoader;
  final StackFit? fit;
  final double? radius;
  const DimmedLoader(
      {super.key,
      required this.child,
      required this.showLoader,
      this.fit,
      this.radius});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: fit ?? StackFit.expand,
      children: [
        child,
        if (showLoader)
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius:
                      radius != null ? BorderRadius.circular(radius!) : null),
              child: CupertinoActivityIndicator(
                color: ColorConstants.lightOrange,
                radius: 16,
              ),
            ),
          ),
      ],
    );
  }
}
