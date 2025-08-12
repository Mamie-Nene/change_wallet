import 'package:flutter/material.dart';
import 'dart:math';


import 'package:splash_view/source/presentation/pages/splash_view.dart';
import 'package:splash_view/source/presentation/widgets/done.dart';

import '../../utils/consts/app_specifications/allDirectories.dart';
import 'home_pages/about_app_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: SplashView(
          bottomLoading: true,
          backgroundColor: AppColors.mainAppColor,
          done: Done(const AboutAppPage()),
          loadingIndicator: LinearProgressIndicator(color: AppColors.mainAppColor,),
          logo: AspectRatio(
            aspectRatio: 9 / 16,
            child: const AnimatedDotBackground(),
          ),
// 🔵 animated dots
        )
    );
  }
}

class AnimatedDotBackground extends StatefulWidget {
  const AnimatedDotBackground({super.key});

  @override
  _AnimatedDotBackgroundState createState() => _AnimatedDotBackgroundState();
}

class _AnimatedDotBackgroundState extends State<AnimatedDotBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
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
      builder: (_, __) => CustomPaint(
        painter: DotPainter(_controller.value * 2 * pi),
        size: MediaQuery.of(context).size,
      ),
    );
  }
}

class DotPainter extends CustomPainter {
  final double time;
  DotPainter(this.time);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white.withOpacity(0.3);
    const spacing = 20.0;

    for (double x = 0; x < size.width; x += spacing) {
      for (double y = 0; y < size.height; y += spacing) {
        final offsetY = 5 * sin((x * 0.04) + time) + 5 * cos((y * 0.04) + time);
        canvas.drawCircle(Offset(x, y + offsetY), 2, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
