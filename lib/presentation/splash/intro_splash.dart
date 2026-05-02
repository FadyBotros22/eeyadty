import 'package:flutter/material.dart';

import '../../domain/utils/ui_helper.dart';
import '../../gen/assets.gen.dart';
import '../widgets/heartbeat_effect_image.dart';

class IntroSplash extends StatefulWidget {
  const IntroSplash({super.key});

  @override
  State<IntroSplash> createState() => _IntroSplashState();
}

class _IntroSplashState extends State<IntroSplash> {
  double? _width = 167;

  @override
  void initState() {
    super.initState();

    Future.delayed(fastAnimationDuration, () {
      setState(() {
        _width = _width == 167.0 ? 267.0 : 167.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: HeartbeatEffectImage(
          imagePath: MyAssets.images.appSplash.path,
          duration: const Duration(milliseconds: 500),
          initialWidth: 167,
          finalWidth: 200,
        ),
      ),
    );
  }
}
