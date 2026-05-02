import 'dart:math';

import 'package:flutter/cupertino.dart';

import 'locale_helper.dart';

const double halfPadding = 5;
const double normalPadding = 8;
const double oneAndHalfPadding = 16;
const double doublePadding = 20;
const double triplePadding = 32;
const double quadPadding = 40;
const double buttonBottomPadding = 24;

Duration get fastAnimationDuration => const Duration(milliseconds: 150);

Duration get standardAnimationDuration => const Duration(milliseconds: 300);

Duration get slowAnimationDuration => const Duration(milliseconds: 700);

Duration get scanAnimationDuration => const Duration(milliseconds: 2000);

const double bottomSafeMargin = 60;
const double topSafeMargin = 70;

class Height extends StatelessWidget {
  final double padding;
  const Height(this.padding, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: padding);
  }
}

class Width extends StatelessWidget {
  final double padding;
  const Width(this.padding, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: padding);
  }
}

Size screenSize(BuildContext context) => MediaQuery.of(context).size;

extension BodyMargin on Widget {
  Widget respectBodyMargin({bool addPadding = true}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: addPadding ? doublePadding : 0),
      child: this,
    );
  }

  Widget setToLTR() {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: this,
    );
  }

  Widget mirrorRTL() {
    return Transform(
      alignment: AlignmentDirectional.center,
      transform: Matrix4.rotationY(
        getLocaleString() == 'ar' ? pi : 0.0,
      ),
      child: this,
    );
  }
}
