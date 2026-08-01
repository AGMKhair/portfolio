import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/theme/app_colors.dart';

class MetricCard extends StatefulWidget {
  final String value;
  final String label;
  final IconData? icon;

  const MetricCard({
    super.key,
    required this.value,
    required this.label,
    this.icon,
  });

  @override
  State<MetricCard> createState() => _MetricCardState();
}

class _MetricCardState extends State<MetricCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  int _targetNumber = 0;
  String _prefix = '';
  String _suffix = '';

  @override
  void initState() {
    super.initState();
    _parseValue();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    );

    _controller.forward();
  }

  void _parseValue() {
    final raw = widget.value;
    final match = RegExp(r'(\D*)(\d+)(\D*)').firstMatch(raw);
    if (match != null) {
      _prefix = match.group(1) ?? '';
      _targetNumber = int.tryParse(match.group(2) ?? '0') ?? 0;
      _suffix = match.group(3) ?? '';
    } else {
      _prefix = '';
      _targetNumber = 0;
      _suffix = raw;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        final currentVal = (_targetNumber * _animation.value).round();
        final displayString = _targetNumber > 0
            ? '$_prefix$currentVal$_suffix'
            : widget.value;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              displayString,
              style: GoogleFonts.spaceGrotesk(
                fontSize: 38,
                fontWeight: FontWeight.w800,
                letterSpacing: -1,
                color: AppColors.accent,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              widget.label,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: isDark ? AppColors.textMuted : AppColors.textLightMuted,
              ),
            ),
          ],
        );
      },
    );
  }
}
