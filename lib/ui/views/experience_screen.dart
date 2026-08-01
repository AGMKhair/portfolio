import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/models/experience.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/providers/theme_provider.dart';
import 'package:portfolio/ui/data/experience_data.dart';
import 'package:portfolio/utils/size_extensions.dart';
import 'package:portfolio/widgets/section_header.dart';
import 'package:portfolio/widgets/tech_chip.dart';
import 'package:provider/provider.dart';

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = context.isMobile;
    final isDark = context.watch<ThemeProvider>().isDark;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        isMobile ? 24 : 80,
        120,
        isMobile ? 24 : 80,
        80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            tag: 'Experience',
            title: '6+ Years of\nBuilding at Scale',
            subtitle:
                'From EdTech platforms and enterprise ERPs to leading mobile and backend engineering for commercial banks and FinTech enterprises.',
          ),
          const SizedBox(height: 80),
          // Timeline
          ...experiences.asMap().entries.map((entry) {
            final i = entry.key;
            final exp = entry.value;
            final isLast = i == experiences.length - 1;
            return _TimelineItem(
              experience: exp,
              isLast: isLast,
              isMobile: isMobile,
              isDark: isDark,
            );
          }),
        ],
      ),
    );
  }
}

class _TimelineItem extends StatefulWidget {
  final Experience experience;
  final bool isLast;
  final bool isMobile;
  final bool isDark;

  const _TimelineItem({
    required this.experience,
    required this.isLast,
    required this.isMobile,
    required this.isDark,
  });

  @override
  State<_TimelineItem> createState() => _TimelineItemState();
}

class _TimelineItemState extends State<_TimelineItem> {
  bool _expanded = false;
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final exp = widget.experience;
    final isDark = widget.isDark;
    final bgColor = isDark ? AppColors.bgCard : AppColors.bgLightSurface;
    final borderColor = _hovered
        ? AppColors.borderAccent
        : (isDark ? AppColors.border : AppColors.borderLight);

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline column
          SizedBox(
            width: 48,
            child: Column(
              children: [
                // Dot
                Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: exp.isCurrent
                        ? AppColors.heroGradient
                        : null,
                    color: exp.isCurrent
                        ? null
                        : (isDark ? AppColors.bgCardHover : AppColors.bgLightCard),
                    border: exp.isCurrent
                        ? null
                        : Border.all(
                            color: isDark
                                ? AppColors.borderStrong
                                : AppColors.borderLight,
                            width: 2),
                  ),
                ),
                if (!widget.isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      color: isDark ? AppColors.border : AppColors.borderLight,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          // Card
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: MouseRegion(
                onEnter: (_) => setState(() => _hovered = true),
                onExit: (_) => setState(() => _hovered = false),
                child: GestureDetector(
                  onTap: () => setState(() => _expanded = !_expanded),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.all(28),
                    decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: borderColor),
                      boxShadow: _hovered
                          ? [
                              BoxShadow(
                                color: AppColors.accent.withOpacity(0.07),
                                blurRadius: 24,
                                offset: const Offset(0, 8),
                              )
                            ]
                          : [],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header row
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        exp.role,
                                        style: GoogleFonts.spaceGrotesk(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          color: isDark
                                              ? AppColors.textPrimary
                                              : AppColors.textLightPrimary,
                                        ),
                                      ),
                                      if (exp.isCurrent) ...[
                                        const SizedBox(width: 10),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 3),
                                          decoration: BoxDecoration(
                                            color: AppColors.statusActive
                                                .withOpacity(0.1),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            border: Border.all(
                                                color: AppColors.statusActive
                                                    .withOpacity(0.3)),
                                          ),
                                          child: Text(
                                            'Current',
                                            style: GoogleFonts.inter(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.statusActive,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    exp.company,
                                    style: GoogleFonts.inter(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.accent,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Row(
                                    children: [
                                      Icon(Icons.schedule_rounded,
                                          size: 13,
                                          color: isDark
                                              ? AppColors.textMuted
                                              : AppColors.textLightMuted),
                                      const SizedBox(width: 4),
                                      Text(
                                        exp.duration,
                                        style: GoogleFonts.inter(
                                          fontSize: 13,
                                          color: isDark
                                              ? AppColors.textMuted
                                              : AppColors.textLightMuted,
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Icon(Icons.location_on_rounded,
                                          size: 13,
                                          color: isDark
                                              ? AppColors.textMuted
                                              : AppColors.textLightMuted),
                                      const SizedBox(width: 4),
                                      Text(
                                        exp.location,
                                        style: GoogleFonts.inter(
                                          fontSize: 13,
                                          color: isDark
                                              ? AppColors.textMuted
                                              : AppColors.textLightMuted,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              _expanded
                                  ? Icons.keyboard_arrow_up_rounded
                                  : Icons.keyboard_arrow_down_rounded,
                              color: isDark
                                  ? AppColors.textMuted
                                  : AppColors.textLightMuted,
                            ),
                          ],
                        ),
                        // Expanded content
                        AnimatedSize(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          child: _expanded
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 24),
                                    Divider(
                                      color: isDark
                                          ? AppColors.border
                                          : AppColors.borderLight,
                                    ),
                                    const SizedBox(height: 20),
                                    // Responsibilities
                                    Text(
                                      'Responsibilities',
                                      style: GoogleFonts.spaceGrotesk(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: isDark
                                            ? AppColors.textSecondary
                                            : AppColors.textLightSecondary,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    ...exp.responsibilities.map(
                                      (r) => Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  top: 7),
                                              width: 5,
                                              height: 5,
                                              decoration: const BoxDecoration(
                                                color: AppColors.accent,
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Expanded(
                                              child: Text(
                                                r,
                                                style: GoogleFonts.inter(
                                                  fontSize: 14,
                                                  height: 1.6,
                                                  color: isDark
                                                      ? AppColors.textSecondary
                                                      : AppColors
                                                          .textLightSecondary,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    // Key achievements
                                    Text(
                                      'Key Achievements',
                                      style: GoogleFonts.spaceGrotesk(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: isDark
                                            ? AppColors.textSecondary
                                            : AppColors.textLightSecondary,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    ...exp.achievements.map(
                                      (a) => Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Icon(
                                              Icons.check_circle_rounded,
                                              size: 15,
                                              color: AppColors.statusActive,
                                            ),
                                            const SizedBox(width: 10),
                                            Expanded(
                                              child: Text(
                                                a,
                                                style: GoogleFonts.inter(
                                                  fontSize: 14,
                                                  height: 1.6,
                                                  color: isDark
                                                      ? AppColors.textSecondary
                                                      : AppColors
                                                          .textLightSecondary,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    // Tech stack
                                    Wrap(
                                      spacing: 8,
                                      runSpacing: 8,
                                      children: exp.technologies
                                          .map((t) => TechChip(
                                                label: t,
                                                small: true,
                                              ))
                                          .toList(),
                                    ),
                                  ],
                                )
                              : const SizedBox.shrink(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
