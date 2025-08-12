import 'dart:math';


import 'package:flutter/material.dart';

class AnimatedDotBackground extends StatefulWidget {
  @override
  _AnimatedDotBackgroundState createState() => _AnimatedDotBackgroundState();
}

class _AnimatedDotBackgroundState extends State<AnimatedDotBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller =
    AnimationController(vsync: this, duration: Duration(seconds: 10))
      ..repeat();
    super.initState();
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
      builder: (_, __) => CustomPaint(
        painter: DotPainter(_controller.value * 1000),
        child: Container(),
      ),
    );
  }
}
class DotPainter extends CustomPainter {
  final double time;

  DotPainter(this.time);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.blue.withOpacity(0.5);
    final spacing = 20.0;

    for (double x = 0; x < size.width; x += spacing) {
      for (double y = 0; y < size.height; y += spacing) {
        final offsetY = 5 * sin((x + time) * 0.05);
        canvas.drawCircle(Offset(x, y + offsetY), 2, paint);
      }
    }
  }

  @override
  bool shouldRepaint(DotPainter oldDelegate) => true;
}
