import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeartbeatEffectImage extends StatefulWidget {
  final String imagePath;
  final Duration duration;
  final double initialWidth;
  final double finalWidth;

  const HeartbeatEffectImage({
    super.key,
    required this.imagePath,
    required this.duration,
    required this.initialWidth,
    required this.finalWidth,
  });

  @override
  State<HeartbeatEffectImage> createState() => _HeartbeatEffectImageState();
}

class _HeartbeatEffectImageState extends State<HeartbeatEffectImage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _scaleAnimation = Tween<double>(
      begin: widget.initialWidth / widget.initialWidth,
      end: widget.finalWidth / widget.initialWidth,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: SizedBox(
            width: widget.initialWidth,
            height: widget.initialWidth, // Maintain aspect ratio
            child: child,
          ),
        );
      },
      child: widget.imagePath.endsWith('.svg')
          ? SvgPicture.asset(
        widget.imagePath,
        fit: BoxFit.contain,
      )
          : Image.asset(
        widget.imagePath,
        fit: BoxFit.contain,
      ),
    );
  }
}
