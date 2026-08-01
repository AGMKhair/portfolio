import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/theme/app_colors.dart';

class SectionHeader extends StatelessWidget {
  final String tag;
  final String title;
  final String? subtitle;
  final bool centered;

  const SectionHeader({
    super.key,
    required this.tag,
    required this.title,
    this.subtitle,
    this.centered = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? AppColors.textPrimary : AppColors.textLightPrimary;
    final mutedColor = isDark ? AppColors.textMuted : AppColors.textLightMuted;

    return Column(
      crossAxisAlignment:
          centered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        // Tag
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          decoration: BoxDecoration(
            color: AppColors.accentGlow,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.borderAccent),
          ),
          child: Text(
            tag.toUpperCase(),
            style: GoogleFonts.inter(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: AppColors.accent,
              letterSpacing: 1.5,
            ),
          ),
        ),
        const SizedBox(height: 16),
        // Title
        Text(
          title,
          textAlign: centered ? TextAlign.center : TextAlign.left,
          style: GoogleFonts.spaceGrotesk(
            fontSize: 36,
            fontWeight: FontWeight.w700,
            letterSpacing: -1,
            height: 1.2,
            color: textColor,
          ),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 12),
          Text(
            subtitle!,
            textAlign: centered ? TextAlign.center : TextAlign.left,
            style: GoogleFonts.inter(
              fontSize: 16,
              height: 1.6,
              color: mutedColor,
            ),
          ),
        ],
      ],
    );
  }
}
