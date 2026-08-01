import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/theme/app_colors.dart';

class TechConstellationBackground extends StatefulWidget {
  final Widget child;
  final bool isDark;

  const TechConstellationBackground({
    super.key,
    required this.child,
    required this.isDark,
  });

  @override
  State<TechConstellationBackground> createState() =>
      _TechConstellationBackgroundState();
}

class _TechConstellationBackgroundState
    extends State<TechConstellationBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<_TechNode> _nodes = [];
  final Random _random = Random(123);

  static const List<(IconData, String, Color)> _iconSet = [
    (Icons.phone_android_rounded, 'Flutter', AppColors.accent),
    (Icons.language_rounded, 'Web Dev', Color(0xFF3B82F6)),
    (Icons.hub_rounded, 'Networking', AppColors.accentSecondary),
    (Icons.dns_rounded, 'Spring Boot', Color(0xFF10B981)),
    (Icons.storage_rounded, 'Oracle DB', Color(0xFFF59E0B)),
    (Icons.api_rounded, 'REST APIs', Color(0xFF8B5CF6)),
    (Icons.security_rounded, 'FinTech Sec', Color(0xFFEC4899)),
    (Icons.android_rounded, 'Android', Color(0xFF34D399)),
    (Icons.cloud_done_rounded, 'Firebase', AppColors.accent),
    (Icons.architecture_rounded, 'Architecture', Color(0xFF06B6D4)),
    (Icons.code_rounded, 'Dart', Color(0xFF6366F1)),
    (Icons.coffee_rounded, 'Java', Color(0xFFF97316)),
    (Icons.layers_rounded, 'Riverpod', Color(0xFFE11D48)),
    (Icons.terminal_rounded, 'CLI', Color(0xFF14B8A6)),
    (Icons.directions_boat_rounded, 'Docker', Color(0xFF0284C7)),
    (Icons.merge_type_rounded, 'Git/CI/CD', Color(0xFFD97706)),
    (Icons.devices_rounded, 'Cross-Platform', AppColors.accent),
    (Icons.data_object_rounded, 'PostgreSQL', Color(0xFF8B5CF6)),
  ];

  @override
  void initState() {
    super.initState();
    // Initialize 18 floating tech node particles
    for (int i = 0; i < _iconSet.length; i++) {
      final item = _iconSet[i];
      _nodes.add(_TechNode(
        x: _random.nextDouble(),
        y: _random.nextDouble(),
        vx: (_random.nextDouble() - 0.5) * 0.0006,
        vy: (_random.nextDouble() - 0.5) * 0.0006,
        icon: item.$1,
        label: item.$2,
        color: item.$3,
      ));
    }

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 35),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isDark) {
      return widget.child;
    }

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        // Update positions
        for (var node in _nodes) {
          node.x += node.vx;
          node.y += node.vy;

          if (node.x < 0 || node.x > 1) node.vx *= -1;
          if (node.y < 0 || node.y > 1) node.vy *= -1;
        }

        return Stack(
          children: [
            // Connection Lines Painter
            Positioned.fill(
              child: CustomPaint(
                painter: _ConstellationPainter(
                  nodes: _nodes,
                  progress: _controller.value,
                ),
              ),
            ),
            // Floating Tech Icons with Micro Labels
            Positioned.fill(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Stack(
                    children: _nodes.map((node) {
                      final px = node.x * constraints.maxWidth;
                      final py = node.y * constraints.maxHeight;

                      return Positioned(
                        left: px - 28,
                        top: py - 18,
                        child: IgnorePointer(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 34,
                                height: 34,
                                decoration: BoxDecoration(
                                  color: AppColors.bgCard.withOpacity(0.75),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: node.color.withOpacity(0.45),
                                    width: 1.2,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: node.color.withOpacity(0.2),
                                      blurRadius: 12,
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  node.icon,
                                  size: 16,
                                  color: node.color,
                                ),
                              ),
                              const SizedBox(height: 3),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 2),
                                decoration: BoxDecoration(
                                  color: AppColors.bgDark.withOpacity(0.7),
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                    color: node.color.withOpacity(0.25),
                                    width: 0.8,
                                  ),
                                ),
                                child: Text(
                                  node.label,
                                  style: GoogleFonts.spaceGrotesk(
                                    fontSize: 9,
                                    fontWeight: FontWeight.w600,
                                    color: node.color.withOpacity(0.9),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            ),
            // Master Child Content
            widget.child,
          ],
        );
      },
    );
  }
}

class _TechNode {
  double x;
  double y;
  double vx;
  double vy;
  final IconData icon;
  final String label;
  final Color color;

  _TechNode({
    required this.x,
    required this.y,
    required this.vx,
    required this.vy,
    required this.icon,
    required this.label,
    required this.color,
  });
}

class _ConstellationPainter extends CustomPainter {
  final List<_TechNode> nodes;
  final double progress;

  _ConstellationPainter({
    required this.nodes,
    required this.progress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    const double maxDistance = 240.0;

    final linePaint = Paint()
      ..strokeWidth = 1.2
      ..style = PaintingStyle.stroke;

    final pulsePaint = Paint()..style = PaintingStyle.fill;

    for (int i = 0; i < nodes.length; i++) {
      final p1 = Offset(nodes[i].x * size.width, nodes[i].y * size.height);

      for (int j = i + 1; j < nodes.length; j++) {
        final p2 = Offset(nodes[j].x * size.width, nodes[j].y * size.height);
        final dist = (p1 - p2).distance;

        if (dist < maxDistance) {
          final opacity = (1.0 - (dist / maxDistance)) * 0.22;
          linePaint.color = AppColors.accent.withOpacity(opacity);

          // Draw connection line
          canvas.drawLine(p1, p2, linePaint);

          // Animated pulse spark travelling along the connection line
          final pulsePos = (progress * 3.0 + i + j) % 1.0;
          final sparkOffset = Offset.lerp(p1, p2, pulsePos)!;

          pulsePaint.color = AppColors.accentSecondary.withOpacity(opacity * 2.5);
          canvas.drawCircle(sparkOffset, 2.2, pulsePaint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant _ConstellationPainter oldDelegate) => true;
}
