import 'package:flutter/material.dart';

class CustomRotatingArc extends StatefulWidget {
  final Gradient gradient;
  final double size;
  final double thickness;

  const CustomRotatingArc({
    super.key,
    required this.gradient,
    required this.size,
    required this.thickness,
  });

  @override
  CustomRotatingArcState createState() => CustomRotatingArcState();
}

class CustomRotatingArcState extends State<CustomRotatingArc>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.rotate(
          angle: _controller.value * 2 * 3.141592653589793,
          child: CustomPaint(
            size: Size(widget.size, widget.size),
            painter: _ArcPainter(widget.gradient, widget.thickness),
          ),
        );
      },
    );
  }
}

class _ArcPainter extends CustomPainter {
  final Gradient gradient;
  final double thickness;

  _ArcPainter(this.gradient, this.thickness);

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);

    final Paint paint = Paint()
      ..shader = gradient.createShader(rect)
      ..strokeWidth = thickness
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Draw the arc
    canvas.drawArc(rect, 0, 3.14, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
