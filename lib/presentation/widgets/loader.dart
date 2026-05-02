import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../domain/utils/ui_helper.dart';

class Loader extends StatelessWidget {
  final Widget child;
  final bool showLoader;
  const Loader({super.key, required this.child, required this.showLoader});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        child,
        if (showLoader)
          Container(
            color: Colors.transparent,
            height: screenSize(context).height,
            child: const CupertinoActivityIndicator(
              color: Colors.black,
              radius: 16,
            ),
          ),
      ],
    );
  }
}
