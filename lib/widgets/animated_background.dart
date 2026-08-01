import 'dart:math';
import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_colors.dart';

class AnimatedBackground extends StatefulWidget {
  final Widget child;
  const AnimatedBackground({super.key, required this.child});

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (!isDark) return widget.child;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Stack(
          children: [
            // Background Orbs Custom Painter
            Positioned.fill(
              child: CustomPaint(
                painter: _BackgroundPainter(progress: _controller.value),
              ),
            ),
            widget.child,
          ],
        );
      },
    );
  }
}

class _BackgroundPainter extends CustomPainter {
  final double progress;
  _BackgroundPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final t = progress * 2 * pi;

    // Orb 1: SponT Orange top-right glow
    final orb1Center = Offset(
      size.width * 0.75 + sin(t) * 80,
      size.height * 0.2 + cos(t * 0.7) * 60,
    );
    final paint1 = Paint()
      ..shader = RadialGradient(
        colors: [
          AppColors.accent.withOpacity(0.12),
          AppColors.accent.withOpacity(0.04),
          Colors.transparent,
        ],
      ).createShader(Rect.fromCircle(center: orb1Center, radius: 450));
    canvas.drawCircle(orb1Center, 450, paint1);

    // Orb 2: SponT Gold mid-left glow
    final orb2Center = Offset(
      size.width * 0.15 + cos(t * 0.8) * 70,
      size.height * 0.55 + sin(t * 1.2) * 80,
    );
    final paint2 = Paint()
      ..shader = RadialGradient(
        colors: [
          AppColors.accentSecondary.withOpacity(0.10),
          AppColors.accentSecondary.withOpacity(0.03),
          Colors.transparent,
        ],
      ).createShader(Rect.fromCircle(center: orb2Center, radius: 400));
    canvas.drawCircle(orb2Center, 400, paint2);

    // Orb 3: SponT Orange bottom-right glow
    final orb3Center = Offset(
      size.width * 0.85 + sin(t * 1.1) * 60,
      size.height * 0.85 + cos(t * 0.9) * 70,
    );
    final paint3 = Paint()
      ..shader = RadialGradient(
        colors: [
          AppColors.accent.withOpacity(0.08),
          Colors.transparent,
        ],
      ).createShader(Rect.fromCircle(center: orb3Center, radius: 350));
    canvas.drawCircle(orb3Center, 350, paint3);
  }

  @override
  bool shouldRepaint(covariant _BackgroundPainter oldDelegate) =>
      oldDelegate.progress != progress;
}
