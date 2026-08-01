import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/theme/app_colors.dart';

class SkillBubblesWidget extends StatefulWidget {
  final bool isDark;
  const SkillBubblesWidget({super.key, required this.isDark});

  @override
  State<SkillBubblesWidget> createState() => _SkillBubblesWidgetState();
}

class _SkillBubblesWidgetState extends State<SkillBubblesWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  static const List<(String, IconData, Color)> row1Skills = [
    ('Flutter', Icons.phone_android_rounded, AppColors.accent),
    ('Spring Boot', Icons.dns_rounded, AppColors.accentSecondary),
    ('Dart', Icons.code_rounded, AppColors.accent),
    ('Java', Icons.coffee_rounded, Color(0xFF3B82F6)),
    ('Kotlin', Icons.android_rounded, Color(0xFF8B5CF6)),
    ('Oracle DB', Icons.storage_rounded, Color(0xFFF59E0B)),
    ('REST APIs', Icons.api_rounded, Color(0xFF10B981)),
    ('Clean Architecture', Icons.architecture_rounded, AppColors.accent),
  ];

  static const List<(String, IconData, Color)> row2Skills = [
    ('Riverpod', Icons.layers_rounded, Color(0xFFEC4899)),
    ('Firebase', Icons.local_fire_department_rounded, Color(0xFFFF6B00)),
    ('PostgreSQL', Icons.storage_rounded, Color(0xFF06B6D4)),
    ('Docker', Icons.directions_boat_rounded, Color(0xFF3B82F6)),
    ('MVVM Pattern', Icons.account_tree_rounded, Color(0xFF8B5CF6)),
    ('Git & GitHub', Icons.merge_type_rounded, Color(0xFFF59E0B)),
    ('FinTech Payments', Icons.payments_rounded, AppColors.accent),
    ('GetX & Provider', Icons.widgets_rounded, AppColors.accentSecondary),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 25),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Row 1 — Moving Left
        _buildMarqueeRow(row1Skills, reverse: false),
        const SizedBox(height: 16),
        // Row 2 — Moving Right
        _buildMarqueeRow(row2Skills, reverse: true),
      ],
    );
  }

  Widget _buildMarqueeRow(List<(String, IconData, Color)> skills,
      {required bool reverse}) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final offset = reverse
            ? _controller.value * 300
            : -_controller.value * 300;

        return Transform.translate(
          offset: Offset(offset % 400, 0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            child: Row(
              children: [
                ...skills.map((s) => _SkillBubbleItem(
                      label: s.$1,
                      icon: s.$2,
                      color: s.$3,
                      isDark: widget.isDark,
                    )),
                // Repeat for seamless loop
                ...skills.map((s) => _SkillBubbleItem(
                      label: s.$1,
                      icon: s.$2,
                      color: s.$3,
                      isDark: widget.isDark,
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _SkillBubbleItem extends StatefulWidget {
  final String label;
  final IconData icon;
  final Color color;
  final bool isDark;

  const _SkillBubbleItem({
    required this.label,
    required this.icon,
    required this.color,
    required this.isDark,
  });

  @override
  State<_SkillBubbleItem> createState() => _SkillBubbleItemState();
}

class _SkillBubbleItemState extends State<_SkillBubbleItem> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = widget.isDark;
    final bgColor = isDark
        ? (_hovered ? AppColors.bgCardHover : AppColors.bgCard)
        : (_hovered ? AppColors.bgLightCard : AppColors.bgLightSurface);
    final borderColor = _hovered
        ? widget.color
        : widget.color.withOpacity(0.3);

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(right: 14),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(30), // Bubble shape
          border: Border.all(color: borderColor, width: _hovered ? 1.5 : 1),
          boxShadow: [
            BoxShadow(
              color: widget.color.withOpacity(_hovered ? 0.3 : 0.08),
              blurRadius: _hovered ? 20 : 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: widget.color.withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: Icon(widget.icon, color: widget.color, size: 16),
            ),
            const SizedBox(width: 10),
            Text(
              widget.label,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: isDark ? AppColors.textPrimary : AppColors.textLightPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
