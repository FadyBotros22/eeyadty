import 'package:flutter/cupertino.dart';

import '../../domain/utils/ui_helper.dart';

class SlideFromRight<T> extends SlidePageRoute<T> {
  SlideFromRight({
    required super.builder,
  }) : super(beginOffset: const Offset(1.0, 0.0));
}

class SlideFromLeft<T> extends SlidePageRoute<T> {
  SlideFromLeft({
    required super.builder,
  }) : super(beginOffset: const Offset(-1.0, 0.0));
}

class SlideFromBottom<T> extends SlidePageRoute<T> {
  SlideFromBottom({
    required super.builder,
  }) : super(beginOffset: const Offset(0.0, 1.0));
}

class SlideFromTop<T> extends SlidePageRoute<T> {
  SlideFromTop({
    required super.builder,
  }) : super(beginOffset: const Offset(0.0, -1.0));
}

class SlidePageRoute<T> extends CupertinoPageRoute<T> {
  final Offset beginOffset;

  SlidePageRoute({
    required super.builder,
    required this.beginOffset,
  });

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    final routeWidget =
        super.buildTransitions(context, animation, secondaryAnimation, child);

    if (routeWidget is CupertinoPageTransition) {
      return Builder(builder: (context) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: beginOffset,
            end: Offset.zero,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut,
              reverseCurve: Curves.easeInOut,
            ),
          ),
          child: routeWidget.child,
        );
      });
    } else {
      return routeWidget;
    }
  }

  @override
  Duration get transitionDuration => standardAnimationDuration;
}

class FadePageRoute<T> extends CupertinoPageRoute<T> {
  FadePageRoute({required super.builder});

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    final routeWidget =
        super.buildTransitions(context, animation, secondaryAnimation, child);

    if (routeWidget is CupertinoPageTransition) {
      return Builder(builder: (context) {
        return FadeTransition(
          opacity: Tween<double>(
            begin: 0,
            end: 1,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.easeIn,
              reverseCurve: Curves.easeOut,
            ),
          ),
          child: routeWidget.child,
        );
      });
    } else {
      return routeWidget;
    }
  }

  @override
  Duration get transitionDuration => standardAnimationDuration;

  @override
  Duration get reverseTransitionDuration => const Duration(milliseconds: 0);
}
