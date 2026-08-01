import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/providers/theme_provider.dart';
import 'package:portfolio/utils/size_extensions.dart';
import 'package:portfolio/utils/utils.dart';
import 'package:portfolio/widgets/section_header.dart';
import 'package:provider/provider.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = context.isMobile;
    final isDark = context.watch<ThemeProvider>().isDark;

    return Column(
      children: [
        _ServicesGrid(isMobile: isMobile, isDark: isDark),
        _ProcessSection(isMobile: isMobile, isDark: isDark),
      ],
    );
  }
}

class _ServicesGrid extends StatelessWidget {
  final bool isMobile;
  final bool isDark;
  const _ServicesGrid({required this.isMobile, required this.isDark});

  @override
  Widget build(BuildContext context) {
    const services = [
      (Icons.phone_android_rounded, 'Flutter Development', AppColors.accent,
          'Cross-platform mobile apps using Flutter & Dart with Clean Architecture, Riverpod, and production-grade quality.',
          ['Flutter', 'Dart', 'iOS', 'Android', 'Web']),
      (Icons.dns_rounded, 'Backend Development', AppColors.accentTeal,
          'Scalable REST APIs and microservices with Spring Boot, PostgreSQL, Firebase, and Docker.',
          ['Spring Boot', 'PostgreSQL', 'Docker', 'REST API']),
      (Icons.architecture_rounded, 'Architecture Consulting', Color(0xFFF59E0B),
          'Technical architecture reviews, system design, and solution blueprinting for growing products.',
          ['System Design', 'Clean Architecture', 'SOLID']),
      (Icons.rocket_launch_rounded, 'MVP Development', Color(0xFFEC4899),
          'Go from idea to a fully functional product in weeks with a focused, lean MVP strategy.',
          ['Rapid Prototyping', 'Agile', 'End-to-End']),
      (Icons.refresh_rounded, 'App Modernization', Color(0xFF10B981),
          'Migrate legacy Android (Java/Kotlin) apps to Flutter or modernize existing Flutter codebases.',
          ['Migration', 'Refactoring', 'Performance']),
      (Icons.speed_rounded, 'Performance Optimization', Color(0xFF3B82F6),
          'Diagnose and fix performance bottlenecks, reduce crash rates, and improve app responsiveness.',
          ['Profiling', 'Memory', 'Rendering']),
    ];

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
          const SectionHeader(
            tag: 'Services',
            title: 'How I Can\nHelp You',
            subtitle:
                'From mobile development to architecture consulting — end-to-end product engineering.',
          ),
          const SizedBox(height: 60),
          LayoutBuilder(builder: (context, constraints) {
            final crossCount =
                isMobile ? 1 : (constraints.maxWidth > 1000 ? 3 : 2);
            return GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: crossCount,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: isMobile ? 2.0 : 1.6,
              children: services
                  .map((s) => _ServiceItem(
                        icon: s.$1,
                        title: s.$2,
                        color: s.$3,
                        desc: s.$4,
                        tags: s.$5,
                        isDark: isDark,
                      ))
                  .toList(),
            );
          }),
        ],
      ),
    );
  }
}

class _ServiceItem extends StatefulWidget {
  final IconData icon;
  final String title;
  final Color color;
  final String desc;
  final List<String> tags;
  final bool isDark;

  const _ServiceItem({
    required this.icon,
    required this.title,
    required this.color,
    required this.desc,
    required this.tags,
    required this.isDark,
  });

  @override
  State<_ServiceItem> createState() => _ServiceItemState();
}

class _ServiceItemState extends State<_ServiceItem> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = widget.isDark;
    final bgColor = isDark
        ? (_hovered ? AppColors.bgCardHover : AppColors.bgCard)
        : (_hovered ? AppColors.bgLightCard : AppColors.bgLightSurface);
    final borderColor = _hovered
        ? widget.color.withOpacity(0.3)
        : (isDark ? AppColors.border : AppColors.borderLight);

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: borderColor),
          boxShadow: _hovered
              ? [
                  BoxShadow(
                    color: widget.color.withOpacity(0.1),
                    blurRadius: 24,
                    offset: const Offset(0, 8),
                  )
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: widget.color.withOpacity(0.12),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(widget.icon, color: widget.color, size: 22),
            ),
            const SizedBox(height: 16),
            Text(
              widget.title,
              style: GoogleFonts.spaceGrotesk(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: isDark ? AppColors.textPrimary : AppColors.textLightPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Text(
                widget.desc,
                style: GoogleFonts.inter(
                  fontSize: 13,
                  height: 1.6,
                  color: isDark ? AppColors.textMuted : AppColors.textLightMuted,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: widget.tags
                  .map((t) => Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: widget.color.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          t,
                          style: GoogleFonts.inter(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: widget.color,
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────
// PROCESS
// ─────────────────────────────────────────────────────────
class _ProcessSection extends StatelessWidget {
  final bool isMobile;
  final bool isDark;
  const _ProcessSection({required this.isMobile, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final bgColor = isDark ? AppColors.bgSurface : AppColors.bgLightCard;

    const steps = [
      (Icons.search_rounded, 'Discovery',
          'Understanding your business goals, users, and technical constraints.'),
      (Icons.map_rounded, 'Planning',
          'Creating a technical roadmap, feature prioritization, and timeline estimation.'),
      (Icons.architecture_rounded, 'Architecture',
          'Designing a scalable, maintainable system architecture before writing code.'),
      (Icons.code_rounded, 'Development',
          'Building with clean code, regular reviews, and continuous progress updates.'),
      (Icons.bug_report_rounded, 'Testing',
          'Comprehensive unit, widget, and integration testing for production quality.'),
      (Icons.cloud_upload_rounded, 'Deployment',
          'CI/CD pipelines, Play Store deployment, and production release management.'),
      (Icons.support_rounded, 'Support',
          'Post-launch monitoring, bug fixes, and feature iterations to keep the product growing.'),
    ];

    return Container(
      color: bgColor,
      padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 24 : 80, vertical: isMobile ? 60 : 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            tag: 'Process',
            title: 'How I Work',
            subtitle:
                'A structured, transparent process from discovery to long-term support.',
          ),
          const SizedBox(height: 60),
          ...steps.asMap().entries.map((entry) {
            final i = entry.key;
            final step = entry.value;
            final isLast = i == steps.length - 1;
            return _ProcessStep(
              number: i + 1,
              icon: step.$1,
              title: step.$2,
              desc: step.$3,
              isLast: isLast,
              isDark: isDark,
            );
          }),
          const SizedBox(height: 60),
          // CTA
          Center(
            child: GestureDetector(
              onTap: () => launch(
                  'https://wa.me/8801823585800?text=Hello%20AGM%20Khair,%20I%20would%20like%20to%20discuss%20a%20project.'),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                decoration: BoxDecoration(
                  gradient: AppColors.accentGradient,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.accent.withOpacity(0.3),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Text(
                  "Start a Project",
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
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

class _ProcessStep extends StatelessWidget {
  final int number;
  final IconData icon;
  final String title;
  final String desc;
  final bool isLast;
  final bool isDark;

  const _ProcessStep({
    required this.number,
    required this.icon,
    required this.title,
    required this.desc,
    required this.isLast,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = isDark ? AppColors.bgCard : AppColors.bgLightSurface;
    final borderColor = isDark ? AppColors.border : AppColors.borderLight;

    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Step indicator
          Column(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  gradient: AppColors.accentGradient,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    '$number',
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              if (!isLast)
                Container(
                  width: 2,
                  height: 32,
                  color: isDark ? AppColors.border : AppColors.borderLight,
                  margin: const EdgeInsets.symmetric(vertical: 6),
                ),
            ],
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: borderColor),
              ),
              child: Row(
                children: [
                  Icon(icon,
                      color: AppColors.accent, size: 20),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: GoogleFonts.spaceGrotesk(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: isDark
                                ? AppColors.textPrimary
                                : AppColors.textLightPrimary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          desc,
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            height: 1.5,
                            color: isDark
                                ? AppColors.textMuted
                                : AppColors.textLightMuted,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}