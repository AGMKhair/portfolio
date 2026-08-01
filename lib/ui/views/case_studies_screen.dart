import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/providers/theme_provider.dart';
import 'package:portfolio/utils/size_extensions.dart';
import 'package:portfolio/utils/utils.dart';
import 'package:portfolio/widgets/section_header.dart';
import 'package:portfolio/widgets/tech_chip.dart';
import 'package:provider/provider.dart';

class CaseStudiesScreen extends StatelessWidget {
  const CaseStudiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = context.isMobile;
    final isDark = context.watch<ThemeProvider>().isDark;

    final caseStudies = [
      _CaseStudy(
        title: 'CellFin — Digital Banking Platform',
        company: 'Islami Bank Bangladesh PLC',
        category: 'FinTech · Digital Banking',
        image: 'assets/images/cellfin.png',
        accentColor: const Color(0xFF10B981),
        problem:
            'Islami Bank required an enterprise-grade mobile banking platform to provide 500K+ customers with fund transfers, RTGS, NPSB, Binimoy, bill payments, and merchant banking under strict regulatory security compliance.',
        solution:
            'Engineered mobile banking features using Flutter and secure backend REST microservices with Spring Boot and Oracle DB. Implemented payment gateways, beneficiary management, and FDR/DPS opening.',
        impact: [
          '500,000+ active banking users served',
          'Integrated national payment switches: RTGS, NPSB, Binimoy',
          'Reduced branch visits by enabling remote account & scheme opening',
          'Full compliance with Bangladesh Bank security audit standards',
        ],
        techStack: ['Flutter', 'Java', 'Spring Boot', 'Oracle DB', 'REST APIs'],
        playStoreUrl:
            'https://play.google.com/store/apps/details?id=com.ibbl.cellfin',
      ),
      _CaseStudy(
        title: 'REDCUBE BUSINESS — Enterprise SME ERP',
        company: 'Red Technologies Ltd',
        category: 'FinTech · SME Enterprise',
        image: 'assets/images/red_cube.png',
        accentColor: const Color(0xFF7C3AED),
        problem:
            'SMEs needed a comprehensive digital application to handle inventory, sales, customer management, invoicing, expense tracking, and payment processing.',
        solution:
            'Developed ERP features and payment modules using Flutter with Clean Architecture, Riverpod, and GetX. Optimized app startup time and managed Play Store releases.',
        impact: [
          'Thousands of SMEs empowered with digital business tools',
          'Production-ready payment modules with high transaction success',
          'Reduced app startup time and memory footprint',
          'Published on Google Play Store & Apple App Store',
        ],
        techStack: ['Flutter', 'Riverpod', 'GetX', 'Firebase', 'REST APIs'],
        playStoreUrl:
            'https://play.google.com/store/apps/details?id=co.uk.redcube.merchant',
      ),
      _CaseStudy(
        title: '10 Minute School — EduTech Learning Platform',
        company: 'Robi 10 Minute School',
        category: 'EdTech · High Traffic',
        image:
            'https://upload.wikimedia.org/wikipedia/commons/3/32/10minutesschool.png',
        accentColor: const Color(0xFFEF4444),
        problem:
            'Bangladesh\'s leading EdTech platform needed a robust mobile app to serve 1M+ active students with live classes, learning materials, and quizzes.',
        solution:
            'Contributed to Android app feature development and API integration using Java and Flutter. Fixed production issues and optimized application performance.',
        impact: [
          'Served over 1M+ active student users across Bangladesh',
          'Improved application stability and reduced crash rates',
          'Enhanced user experience for live video streaming & learning modules',
        ],
        techStack: ['Java', 'Flutter', 'Android SDK', 'REST APIs', 'Firebase'],
        playStoreUrl:
            'https://play.google.com/store/apps/details?id=com.a10minuteschool.tenminuteschool',
      ),
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
            tag: 'Case Studies',
            title: 'Real Problems,\nReal Impact',
            subtitle:
                'Deep dives into key enterprise projects — the challenge, technical architecture, and measurable outcomes.',
          ),
          const SizedBox(height: 80),
          ...caseStudies.map((cs) => Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: _CaseStudyCard(
                    caseStudy: cs, isMobile: isMobile, isDark: isDark),
              )),
        ],
      ),
    );
  }
}

class _CaseStudy {
  final String title;
  final String company;
  final String category;
  final String image;
  final Color accentColor;
  final String problem;
  final String solution;
  final List<String> impact;
  final List<String> techStack;
  final String? playStoreUrl;

  const _CaseStudy({
    required this.title,
    required this.company,
    required this.category,
    required this.image,
    required this.accentColor,
    required this.problem,
    required this.solution,
    required this.impact,
    required this.techStack,
    this.playStoreUrl,
  });
}

class _CaseStudyCard extends StatefulWidget {
  final _CaseStudy caseStudy;
  final bool isMobile;
  final bool isDark;

  const _CaseStudyCard({
    required this.caseStudy,
    required this.isMobile,
    required this.isDark,
  });

  @override
  State<_CaseStudyCard> createState() => _CaseStudyCardState();
}

class _CaseStudyCardState extends State<_CaseStudyCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final cs = widget.caseStudy;
    final isDark = widget.isDark;
    final bgColor = isDark ? AppColors.bgCard : AppColors.bgLightSurface;
    final borderColor = _hovered
        ? cs.accentColor.withOpacity(0.3)
        : (isDark ? AppColors.border : AppColors.borderLight);

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: borderColor),
          boxShadow: _hovered
              ? [
                  BoxShadow(
                    color: cs.accentColor.withOpacity(0.1),
                    blurRadius: 32,
                    offset: const Offset(0, 12),
                  )
                ]
              : [],
        ),
        child: widget.isMobile
            ? _buildMobileLayout(cs, isDark)
            : _buildDesktopLayout(cs, isDark),
      ),
    );
  }

  Widget _buildDesktopLayout(_CaseStudy cs, bool isDark) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
          child: SizedBox(
            width: 280,
            height: 340,
            child: _buildImage(cs),
          ),
        ),
        // Content
        Expanded(child: _buildContent(cs, isDark, false)),
      ],
    );
  }

  Widget _buildMobileLayout(_CaseStudy cs, bool isDark) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: SizedBox(
            height: 200,
            width: double.infinity,
            child: _buildImage(cs),
          ),
        ),
        _buildContent(cs, isDark, true),
      ],
    );
  }

  Widget _buildImage(_CaseStudy cs) {
    return Stack(
      fit: StackFit.expand,
      children: [
        cs.image.startsWith('http')
            ? Image.network(cs.image, fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                      color: cs.accentColor.withOpacity(0.1),
                      child: Icon(Icons.image_rounded,
                          color: cs.accentColor, size: 48),
                    ))
            : Image.asset(cs.image, fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                      color: cs.accentColor.withOpacity(0.1),
                      child: Icon(Icons.image_rounded,
                          color: cs.accentColor, size: 48),
                    )),
        // Gradient overlay
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, Colors.black.withOpacity(0.6)],
            ),
          ),
        ),
        // Category tag
        Positioned(
          top: 16,
          left: 16,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: cs.accentColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              cs.category,
              style: GoogleFonts.inter(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContent(_CaseStudy cs, bool isDark, bool isMobile) {
    final textPrimary = isDark ? AppColors.textPrimary : AppColors.textLightPrimary;
    final textSecondary = isDark ? AppColors.textSecondary : AppColors.textLightSecondary;

    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            cs.company,
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: cs.accentColor,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            cs.title,
            style: GoogleFonts.spaceGrotesk(
              fontSize: isMobile ? 20 : 24,
              fontWeight: FontWeight.w700,
              color: textPrimary,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 20),
          // Problem
          _InfoBlock(
            label: 'PROBLEM',
            content: cs.problem,
            color: const Color(0xFFEC4899),
            isDark: isDark,
          ),
          const SizedBox(height: 16),
          _InfoBlock(
            label: 'SOLUTION',
            content: cs.solution,
            color: cs.accentColor,
            isDark: isDark,
          ),
          const SizedBox(height: 20),
          // Impact
          Text(
            'IMPACT & RESULTS',
            style: GoogleFonts.inter(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.5,
              color: AppColors.statusActive,
            ),
          ),
          const SizedBox(height: 10),
          ...cs.impact.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.check_circle_rounded,
                      color: AppColors.statusActive, size: 14),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      item,
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        height: 1.5,
                        color: textSecondary,
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
            spacing: 6,
            runSpacing: 6,
            children: cs.techStack
                .map((t) => TechChip(
                      label: t,
                      small: true,
                      color: cs.accentColor,
                    ))
                .toList(),
          ),
          if (cs.playStoreUrl != null) ...[
            const SizedBox(height: 24),
            GestureDetector(
              onTap: () => launch(cs.playStoreUrl!),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.open_in_new_rounded,
                      size: 14, color: cs.accentColor),
                  const SizedBox(width: 6),
                  Text(
                    'View on Play Store',
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: cs.accentColor,
                      decoration: TextDecoration.underline,
                      decorationColor: cs.accentColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _InfoBlock extends StatelessWidget {
  final String label;
  final String content;
  final Color color;
  final bool isDark;

  const _InfoBlock({
    required this.label,
    required this.content,
    required this.color,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(10),
        border: Border(left: BorderSide(color: color, width: 3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.5,
              color: color,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            content,
            style: GoogleFonts.inter(
              fontSize: 13,
              height: 1.6,
              color: isDark ? AppColors.textSecondary : AppColors.textLightSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
