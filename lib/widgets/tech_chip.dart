import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/theme/app_colors.dart';

class TechChip extends StatelessWidget {
  final String label;
  final Color? color;
  final bool small;

  const TechChip({
    super.key,
    required this.label,
    this.color,
    this.small = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final chipColor = color ?? AppColors.accent;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: small ? 9 : 12,
        vertical: small ? 4 : 6,
      ),
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.bgSurface.withOpacity(0.8)
            : AppColors.bgLightCard,
        borderRadius: BorderRadius.circular(20), // Soft rounded pill
        border: Border.all(
          color: chipColor.withOpacity(0.25),
          width: 1,
        ),
      ),
      child: Text(
        label,
        style: GoogleFonts.jetBrainsMono(
          fontSize: small ? 10 : 12,
          fontWeight: FontWeight.w500,
          color: isDark ? AppColors.textSecondary : AppColors.textLightSecondary,
        ),
      ),
    );
  }
}
