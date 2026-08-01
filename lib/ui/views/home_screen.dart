import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/providers/navigation_provider.dart';
import 'package:portfolio/providers/theme_provider.dart';
import 'package:portfolio/utils/size_extensions.dart';
import 'package:portfolio/utils/utils.dart';
import 'package:portfolio/widgets/metric_card.dart';
import 'package:portfolio/widgets/section_header.dart';
import 'package:portfolio/widgets/skill_bubbles_widget.dart';
import 'package:portfolio/widgets/tech_chip.dart';
import 'package:portfolio/widgets/tech_constellation_background.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = context.isMobile;
    final isDark = context.watch<ThemeProvider>().isDark;

    return TechConstellationBackground(
      isDark: isDark,
      child: Column(
        children: [
          _HeroSection(isMobile: isMobile, isDark: isDark),
          _MetricsSection(isMobile: isMobile, isDark: isDark),
          _TrustSection(isMobile: isMobile, isDark: isDark),
          _WhatIBuildSection(isMobile: isMobile, isDark: isDark),
          _SpontITSection(isMobile: isMobile, isDark: isDark),
          _TestimonialsSection(isMobile: isMobile, isDark: isDark),
          _CtaBanner(isMobile: isMobile, isDark: isDark),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────
// HERO
// ─────────────────────────────────────────────────────────
class _HeroSection extends StatelessWidget {
  final bool isMobile;
  final bool isDark;
  const _HeroSection({required this.isMobile, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final textPrimary = isDark ? AppColors.textPrimary : AppColors.textLightPrimary;
    final textMuted = isDark ? AppColors.textSecondary : AppColors.textLightSecondary;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(
        isMobile ? 24 : 80,
        isMobile ? 100 : 120,
        isMobile ? 24 : 80,
        isMobile ? 60 : 80,
      ),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildPhoto(isMobile),
                const SizedBox(height: 40),
                _buildText(context, textPrimary, textMuted, isMobile),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    flex: 3,
                    child: _buildText(context, textPrimary, textMuted, isMobile)),
                const SizedBox(width: 60),
                Expanded(flex: 2, child: _buildPhoto(isMobile)),
              ],
            ),
    );
  }

  Widget _buildText(BuildContext context, Color textPrimary, Color textMuted,
      bool isMobile) {
    return Column(
      crossAxisAlignment: isMobile
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        // Availability badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.statusActive.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.statusActive.withOpacity(0.3)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 7,
                height: 7,
                decoration: const BoxDecoration(
                  color: AppColors.statusActive,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'Available for Senior Roles & Consulting',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  color: AppColors.statusActive,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        // Main headline
        Text(
          'Engineering Secure\nFinTech & Banking\nSolutions at Scale.',
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: GoogleFonts.spaceGrotesk(
            fontSize: isMobile ? 36 : 56,
            fontWeight: FontWeight.w700,
            letterSpacing: -2,
            height: 1.1,
            color: textPrimary,
          ),
        ),
        const SizedBox(height: 24),
        // Gradient accent line
        if (!isMobile)
          Container(
            width: 80,
            height: 3,
            decoration: BoxDecoration(
              gradient: AppColors.heroGradient,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        if (!isMobile) const SizedBox(height: 24),
        // Sub-description
        SizedBox(
          width: isMobile ? double.infinity : 540,
          child: Text(
            'Software Engineer with 6+ years of experience across FinTech, EduTech, Banking & Enterprise ERPs. '
            'Specialized in Flutter, Spring Boot, Java, Kotlin & Oracle DB delivering high-impact mobile and backend solutions.',
            textAlign: isMobile ? TextAlign.center : TextAlign.left,
            style: GoogleFonts.inter(
              fontSize: isMobile ? 15 : 17,
              height: 1.7,
              color: textMuted,
            ),
          ),
        ),
        const SizedBox(height: 32),
        // Role chips
        Wrap(
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          spacing: 8,
          runSpacing: 8,
          children: const [
            TechChip(label: 'Flutter & Dart', color: AppColors.accent),
            TechChip(label: 'Spring Boot', color: AppColors.accentTeal),
            TechChip(label: 'Java / Kotlin', color: Color(0xFF3B82F6)),
            TechChip(label: 'Oracle DB', color: Color(0xFFF59E0B)),
            TechChip(label: 'FinTech & Banking', color: Color(0xFFEC4899)),
          ],
        ),
        const SizedBox(height: 40),
        // CTA Buttons
        Wrap(
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          spacing: 12,
          runSpacing: 12,
          children: [
            _PrimaryButton(
              label: 'Explore Projects',
              onTap: () =>
                  context.read<NavigationProvider>().setIndex(3),
            ),
            _GhostButton(
              label: 'Download CV',
              icon: Icons.download_rounded,
              onTap: () => launch(
                  'https://drive.google.com/file/d/1vSIkfZMFkBEAXdPtFyAIUyJWqsK0gyCE/view?usp=sharing'),
            ),
          ],
        ),
        const SizedBox(height: 40),
        // Scroll hint
        if (!isMobile)
          Row(
            children: [
              Icon(Icons.keyboard_arrow_down_rounded,
                  color: isDark ? AppColors.textHint : AppColors.textLightMuted,
                  size: 18),
              const SizedBox(width: 6),
              Text(
                'Scroll to explore experience',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  color: isDark ? AppColors.textHint : AppColors.textLightMuted,
                ),
              ),
            ],
          ),
      ],
    );
  }

  Widget _buildPhoto(bool isMobile) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Glow ring
          Container(
            width: isMobile ? 240 : 340,
            height: isMobile ? 240 : 340,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  AppColors.accent.withOpacity(0.25),
                  AppColors.accentTeal.withOpacity(0.1),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          // Gradient border ring
          Container(
            width: isMobile ? 210 : 300,
            height: isMobile ? 210 : 300,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: AppColors.heroGradient,
            ),
            child: Padding(
              padding: const EdgeInsets.all(3),
              child: ClipOval(
                child: Container(
                  decoration: BoxDecoration(
                    color: isDark ? AppColors.bgDark : AppColors.bgLight,
                  ),
                  child: Image.asset(
                    'assets/images/mypic.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          // Floating badge — experience (bottom right)
          Positioned(
            bottom: isMobile ? 10 : 20,
            right: isMobile ? 10 : 20,
            child: const _FloatingBadge(
              value: '6+ Yrs',
              label: 'Software Eng. Exp',
              color: AppColors.accent,
            ),
          ),
          // Floating badge — apps (bottom left)
          Positioned(
            bottom: isMobile ? 10 : 20,
            left: isMobile ? 10 : 20,
            child: const _FloatingBadge(
              value: '20+',
              label: 'Play Store Apps',
              color: AppColors.accentSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

class _FloatingBadge extends StatelessWidget {
  final String value;
  final String label;
  final Color color;

  const _FloatingBadge({
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: isDark ? AppColors.bgCard : AppColors.bgLightSurface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.2),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            value,
            style: GoogleFonts.spaceGrotesk(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: isDark ? AppColors.textMuted : AppColors.textLightMuted,
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────
// METRICS
// ─────────────────────────────────────────────────────────
class _MetricsSection extends StatelessWidget {
  final bool isMobile;
  final bool isDark;
  const _MetricsSection({required this.isMobile, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final borderColor = isDark ? AppColors.border : AppColors.borderLight;
    final bgColor = isDark ? AppColors.bgSurface : AppColors.bgLightCard;

    const metrics = [
      ('6+ Yrs', 'Total Software Eng. Exp'),
      ('20+', 'Apps on Google Play'),
      ('500K+', 'Banking App Users'),
      ('4 Banks', 'Commercial Clients'),
      ('100%', 'Clean Architecture'),
    ];

    return Container(
      margin: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 80),
      padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 24 : 48, vertical: isMobile ? 28 : 36),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: borderColor),
      ),
      child: isMobile
          ? Wrap(
              alignment: WrapAlignment.center,
              spacing: 32,
              runSpacing: 24,
              children: metrics
                  .map((m) => MetricCard(value: m.$1, label: m.$2))
                  .toList(),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                for (int i = 0; i < metrics.length; i++) ...[
                  MetricCard(value: metrics[i].$1, label: metrics[i].$2),
                  if (i < metrics.length - 1)
                    Container(
                        width: 1,
                        height: 40,
                        color: borderColor),
                ],
              ],
            ),
    );
  }
}

// ─────────────────────────────────────────────────────────
// TRUST (MODERN GLASSMORPHIC CARD DESIGN)
// ─────────────────────────────────────────────────────────
class _TrustSection extends StatelessWidget {
  final bool isMobile;
  final bool isDark;
  const _TrustSection({required this.isMobile, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final trustItems = [
      (
        name: 'Red Technologies Ltd',
        role: 'Senior Associate SE (FinTech)',
        subtitle: 'REDCUBE Business ERP & Payment Modules',
        icon: Icons.account_balance_wallet_rounded,
        color: const Color(0xFF7C3AED),
        tag: 'Current Job',
      ),
      (
        name: 'Islami Bank Bangladesh PLC',
        role: 'Software Engineer (May 2022 – Oct 2025)',
        subtitle: 'CellFin, Agent Banking & Spring Boot APIs',
        icon: Icons.account_balance_rounded,
        color: const Color(0xFF10B981),
        tag: 'Core Banking',
      ),
      (
        name: 'Prime Bank PLC',
        role: 'via CIBL Technology Consultants',
        subtitle: 'MyPrime Mobile Internet Banking',
        icon: Icons.credit_card_rounded,
        color: const Color(0xFF3B82F6),
        tag: 'Bank App',
      ),
      (
        name: 'ONE Bank PLC',
        role: 'via CIBL Technology Consultants',
        subtitle: 'ONE Bank i-Banking Mobile App',
        icon: Icons.smartphone_rounded,
        color: const Color(0xFF8B5CF6),
        tag: 'Bank App',
      ),
      (
        name: 'NRBC Bank PLC',
        role: 'via CIBL Technology Consultants',
        subtitle: 'NRBC PLANET Mobile App',
        icon: Icons.public_rounded,
        color: const Color(0xFFEC4899),
        tag: 'Bank App',
      ),
      (
        name: 'Meghna Bank PLC',
        role: 'via CIBL Technology Consultants',
        subtitle: 'Meghna i-Banking Solution',
        icon: Icons.account_tree_rounded,
        color: const Color(0xFFF59E0B),
        tag: 'Bank App',
      ),
      (
        name: 'Robi 10 Minute School',
        role: 'Android Developer (EduTech)',
        subtitle: '1M+ Active Student Learning Platform',
        icon: Icons.school_rounded,
        color: const Color(0xFFEF4444),
        tag: 'EdTech',
      ),
      (
        name: 'CIBL Technology Consultants',
        role: 'Mobile App Developer',
        subtitle: 'Multi-Bank Mobile Solutions Provider',
        icon: Icons.business_rounded,
        color: const Color(0xFF06B6D4),
        tag: 'Consulting',
      ),
    ];

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 24 : 80, vertical: isMobile ? 60 : 100),
      child: Column(
        children: [
          const SectionHeader(
            tag: 'Work History & Partnerships',
            title: 'Trusted by Commercial Banks\n& FinTech Enterprises',
            subtitle:
                'Delivered production applications for leading financial institutions, EdTech platforms, and tech companies in Bangladesh.',
            centered: true,
          ),
          const SizedBox(height: 48),
          LayoutBuilder(
            builder: (context, constraints) {
              final crossCount = isMobile ? 1 : (constraints.maxWidth > 1000 ? 4 : 2);
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: trustItems.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossCount,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: isMobile ? 2.2 : 1.75,
                ),
                itemBuilder: (context, index) {
                  final item = trustItems[index];
                  return _ModernTrustCard(
                    name: item.name,
                    role: item.role,
                    subtitle: item.subtitle,
                    icon: item.icon,
                    accentColor: item.color,
                    tag: item.tag,
                    isDark: isDark,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ModernTrustCard extends StatefulWidget {
  final String name;
  final String role;
  final String subtitle;
  final IconData icon;
  final Color accentColor;
  final String tag;
  final bool isDark;

  const _ModernTrustCard({
    required this.name,
    required this.role,
    required this.subtitle,
    required this.icon,
    required this.accentColor,
    required this.tag,
    required this.isDark,
  });

  @override
  State<_ModernTrustCard> createState() => _ModernTrustCardState();
}

class _ModernTrustCardState extends State<_ModernTrustCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = widget.isDark;
    final bgColor = isDark
        ? (_hovered ? AppColors.bgCardHover : AppColors.bgCard)
        : (_hovered ? AppColors.bgLightCard : AppColors.bgLightSurface);
    final borderColor = _hovered
        ? widget.accentColor.withOpacity(0.4)
        : (isDark ? AppColors.border : AppColors.borderLight);

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        transform: Matrix4.identity()..scale(_hovered ? 1.02 : 1.0),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: borderColor, width: _hovered ? 1.5 : 1),
          boxShadow: _hovered
              ? [
                  BoxShadow(
                    color: widget.accentColor.withOpacity(0.15),
                    blurRadius: 24,
                    offset: const Offset(0, 8),
                  )
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Top Row: Icon + Tag
            Row(
              children: [
                Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: widget.accentColor.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    widget.icon,
                    color: widget.accentColor,
                    size: 20,
                  ),
                ),
                const Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: widget.accentColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                    border:
                        Border.all(color: widget.accentColor.withOpacity(0.2)),
                  ),
                  child: Text(
                    widget.tag,
                    style: GoogleFonts.inter(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: widget.accentColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Middle: Name
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: isDark
                        ? AppColors.textPrimary
                        : AppColors.textLightPrimary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  widget.role,
                  style: GoogleFonts.inter(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: widget.accentColor,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            const SizedBox(height: 6),
            // Subtitle
            Text(
              widget.subtitle,
              style: GoogleFonts.inter(
                fontSize: 12,
                height: 1.4,
                color: isDark ? AppColors.textMuted : AppColors.textLightMuted,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────
// WHAT I BUILD
// ─────────────────────────────────────────────────────────
class _WhatIBuildSection extends StatelessWidget {
  final bool isMobile;
  final bool isDark;
  const _WhatIBuildSection({required this.isMobile, required this.isDark});

  @override
  Widget build(BuildContext context) {
    const services = [
      (
        Icons.phone_android_rounded,
        'Mobile App Engineering',
        'Production Flutter, Java & Kotlin apps with Clean Architecture, Riverpod, MVVM, and 99.9% crash-free sessions.',
        AppColors.accent
      ),
      (
        Icons.dns_rounded,
        'Spring Boot Microservices',
        'Secure backend REST APIs using Java, Spring Boot, Spring Security, JPA & Oracle Database built for high traffic.',
        AppColors.accentTeal
      ),
      (
        Icons.security_rounded,
        'FinTech & Banking Systems',
        'Digital banking apps, fund transfer systems (RTGS, NPSB, Binimoy), QR payments, and merchant banking modules.',
        Color(0xFFF59E0B)
      ),
      (
        Icons.architecture_rounded,
        'Database & API Architecture',
        'Oracle DB query optimization, MySQL, SQLite, Room, and enterprise REST API designs following banking security standards.',
        Color(0xFFEC4899)
      ),
      (
        Icons.cloud_done_rounded,
        'Firebase & Cloud Services',
        'Full integration of Auth, Firestore, Cloud Messaging (FCM), Crashlytics, Analytics, and Remote Config.',
        Color(0xFF10B981)
      ),
      (
        Icons.rocket_launch_rounded,
        'Product & Play Store Release',
        'End-to-end product development, code reviews, Agile teamwork, and production releases on Google Play & App Store.',
        Color(0xFF3B82F6)
      ),
    ];

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 24 : 80, vertical: isMobile ? 60 : 100),
      child: Column(
        children: [
          const SectionHeader(
            tag: 'Technical Core',
            title: 'FinTech & Full-Stack\nCapabilities',
            subtitle:
                'From mobile banking to backend microservices — robust engineering following clean architecture.',
            centered: true,
          ),
          const SizedBox(height: 48),
          SkillBubblesWidget(isDark: isDark),
          const SizedBox(height: 48),
          LayoutBuilder(builder: (context, constraints) {
            final crossCount = isMobile ? 1 : (constraints.maxWidth > 1000 ? 3 : 2);
            return GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: crossCount,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: isMobile ? 2.0 : 1.7,
              children: services
                  .map((s) => _ServiceCard(
                        icon: s.$1,
                        title: s.$2,
                        desc: s.$3,
                        color: s.$4,
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

class _ServiceCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String desc;
  final Color color;
  final bool isDark;

  const _ServiceCard({
    required this.icon,
    required this.title,
    required this.desc,
    required this.color,
    required this.isDark,
  });

  @override
  State<_ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<_ServiceCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final bgColor = widget.isDark
        ? (_hovered ? AppColors.bgCardHover : AppColors.bgCard)
        : (_hovered ? AppColors.bgLightCard : AppColors.bgLightSurface);
    final borderColor = _hovered
        ? widget.color.withOpacity(0.3)
        : (widget.isDark ? AppColors.border : AppColors.borderLight);

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
                color: widget.isDark
                    ? AppColors.textPrimary
                    : AppColors.textLightPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.desc,
              style: GoogleFonts.inter(
                fontSize: 13,
                height: 1.6,
                color: widget.isDark
                    ? AppColors.textMuted
                    : AppColors.textLightMuted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────
// TESTIMONIALS
// ─────────────────────────────────────────────────────────
class _TestimonialsSection extends StatelessWidget {
  final bool isMobile;
  final bool isDark;
  const _TestimonialsSection({required this.isMobile, required this.isDark});

  @override
  Widget build(BuildContext context) {
    const testimonials = [
      (
        'Arif Hossain',
        'CTO · Red Technologies Ltd',
        'AGM Khair is an exceptional mobile engineer. His deep expertise in Flutter, state management, and Clean Architecture allowed us to ship our enterprise REDCUBE BUSINESS app with incredible speed and reliability.'
      ),
      (
        'Islami Bank Software Team',
        'Engineering Lead · Islami Bank Bangladesh PLC',
        'Khair played a pivotal role in engineering secure digital banking workflows including RTGS, NPSB, Binimoy, and QR payments. His Spring Boot and Oracle DB skills made backend integrations effortless.'
      ),
    ];

    return Container(
      color: isDark ? AppColors.bgSurface : AppColors.bgLightCard,
      padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 24 : 80, vertical: isMobile ? 60 : 100),
      child: Column(
        children: [
          const SectionHeader(
            tag: 'Recommendations',
            title: 'What Tech Leaders Say',
            centered: true,
          ),
          const SizedBox(height: 60),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: testimonials
                .map((t) => _TestimonialCard(
                      name: t.$1,
                      role: t.$2,
                      text: t.$3,
                      isDark: isDark,
                      isMobile: isMobile,
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _TestimonialCard extends StatelessWidget {
  final String name;
  final String role;
  final String text;
  final bool isDark;
  final bool isMobile;

  const _TestimonialCard({
    required this.name,
    required this.role,
    required this.text,
    required this.isDark,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isMobile ? double.infinity : 440,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: isDark ? AppColors.bgCard : AppColors.bgLightSurface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
            color: isDark ? AppColors.border : AppColors.borderLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Stars
          Row(
            children: List.generate(
              5,
              (_) => const Icon(Icons.star_rounded,
                  color: Color(0xFFF59E0B), size: 16),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            '"$text"',
            style: GoogleFonts.inter(
              fontSize: 15,
              height: 1.7,
              color: isDark ? AppColors.textSecondary : AppColors.textLightSecondary,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: AppColors.heroGradient,
                ),
                child: Center(
                  child: Text(
                    name[0],
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: isDark ? AppColors.textPrimary : AppColors.textLightPrimary,
                    ),
                  ),
                  Text(
                    role,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: AppColors.textMuted,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────
// CTA BANNER
// ─────────────────────────────────────────────────────────
class _CtaBanner extends StatelessWidget {
  final bool isMobile;
  final bool isDark;
  const _CtaBanner({required this.isMobile, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 24 : 80, vertical: isMobile ? 60 : 100),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(isMobile ? 40 : 72),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF1A1A2E), Color(0xFF16213E)],
          ),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: AppColors.borderStrong),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.accentGlow,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'OPEN FOR SENIOR ROLES & CONSULTING',
                style: GoogleFonts.inter(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: AppColors.accent,
                  letterSpacing: 1.5,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              "Need a Senior FinTech Engineer?",
              textAlign: TextAlign.center,
              style: GoogleFonts.spaceGrotesk(
                fontSize: isMobile ? 28 : 44,
                fontWeight: FontWeight.w700,
                letterSpacing: -1.5,
                color: Colors.white,
                height: 1.15,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: isMobile ? double.infinity : 600,
              child: Text(
                "Let's build secure, scalable mobile & backend applications together. From digital banking to startup products.",
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: isMobile ? 15 : 17,
                  height: 1.6,
                  color: AppColors.textSecondary,
                ),
              ),
            ),
            const SizedBox(height: 40),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 12,
              runSpacing: 12,
              children: [
                _PrimaryButton(
                  label: "Get in Touch",
                  icon: Icons.chat_bubble_outline_rounded,
                  onTap: () => launch(
                      'https://wa.me/8801823585800?text=Hello%20AGM%20Khair,%20I%20reviewed%20your%20portfolio%20and%20would%20like%20to%20discuss%20an%20opportunity.'),
                ),
                _GhostButton(
                  label: 'View Projects',
                  onTap: () =>
                      context.read<NavigationProvider>().setIndex(3),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────
// SHARED BUTTONS
// ─────────────────────────────────────────────────────────
class _PrimaryButton extends StatefulWidget {
  final String label;
  final IconData? icon;
  final VoidCallback onTap;

  const _PrimaryButton({
    required this.label,
    required this.onTap,
    this.icon,
  });

  @override
  State<_PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<_PrimaryButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
          decoration: BoxDecoration(
            color: AppColors.accent,
            borderRadius: BorderRadius.circular(10),
            boxShadow: _hovered
                ? [
                    BoxShadow(
                      color: AppColors.accent.withOpacity(0.4),
                      blurRadius: 20,
                      offset: const Offset(0, 6),
                    )
                  ]
                : [],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.icon != null) ...[
                Icon(widget.icon, color: Colors.white, size: 18),
                const SizedBox(width: 8),
              ],
              Text(
                widget.label,
                style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GhostButton extends StatefulWidget {
  final String label;
  final IconData? icon;
  final VoidCallback onTap;

  const _GhostButton({
    required this.label,
    required this.onTap,
    this.icon,
  });

  @override
  State<_GhostButton> createState() => _GhostButtonState();
}

class _GhostButtonState extends State<_GhostButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
          decoration: BoxDecoration(
            color: _hovered
                ? AppColors.accentGlow
                : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: _hovered
                  ? AppColors.accent
                  : (isDark ? AppColors.borderStrong : AppColors.borderLight),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.icon != null) ...[
                Icon(widget.icon,
                    color: _hovered
                        ? AppColors.accent
                        : (isDark
                            ? AppColors.textSecondary
                            : AppColors.textLightSecondary),
                    size: 18),
                const SizedBox(width: 8),
              ],
              Text(
                widget.label,
                style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: _hovered
                      ? AppColors.accent
                      : (isDark
                          ? AppColors.textSecondary
                          : AppColors.textLightSecondary),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SpontITSection extends StatelessWidget {
  final bool isMobile;
  final bool isDark;

  const _SpontITSection({required this.isMobile, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final bgColor = isDark ? AppColors.bgSurface : AppColors.bgLightCard;

    return Container(
      width: double.infinity,
      color: isDark ? AppColors.bgDark : AppColors.bgLight,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: isMobile ? 60 : 100,
      ),
      child: Column(
        children: [
          const SectionHeader(
            tag: 'Tech Venture & Innovation',
            title: 'SponT IT — Technology\nProducts Ecosystem',
            subtitle:
                'Founded and led by AGM Khair Sabbir. Developing high-utility mobile applications, EduTech platforms, digital media, and consumer software.',
            centered: true,
          ),
          const SizedBox(height: 50),
          Container(
            padding: EdgeInsets.all(isMobile ? 24 : 40),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: AppColors.accent.withOpacity(0.3), width: 1.5),
              boxShadow: [
                BoxShadow(
                  color: AppColors.accent.withOpacity(0.08),
                  blurRadius: 32,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'SponT ',
                            style: GoogleFonts.spaceGrotesk(
                              fontSize: isMobile ? 28 : 36,
                              fontWeight: FontWeight.w800,
                              color: AppColors.accent,
                              letterSpacing: -0.5,
                            ),
                          ),
                          WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                gradient: AppColors.heroGradient,
                                borderRadius: BorderRadius.circular(6),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.accent.withOpacity(0.4),
                                    blurRadius: 10,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Text(
                                'IT',
                                style: GoogleFonts.spaceGrotesk(
                                  fontSize: isMobile ? 18 : 22,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  'Empowering 500,000+ users worldwide through high-performance Android & Web solutions.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: isMobile ? 14 : 16,
                    height: 1.6,
                    color: isDark
                        ? AppColors.textSecondary
                        : AppColors.textLightSecondary,
                  ),
                ),
                const SizedBox(height: 32),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () => launch('http://spont-it.com/'),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 14),
                      decoration: BoxDecoration(
                        gradient: AppColors.heroGradient,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.accent.withOpacity(0.35),
                            blurRadius: 16,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.language_rounded,
                              color: Colors.white, size: 18),
                          const SizedBox(width: 10),
                          Text(
                            'Visit Official Website (spont-it.com)',
                            style: GoogleFonts.spaceGrotesk(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Icon(Icons.open_in_new_rounded,
                              color: Colors.white, size: 16),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
