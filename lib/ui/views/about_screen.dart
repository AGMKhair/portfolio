import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/providers/theme_provider.dart';
import 'package:portfolio/utils/size_extensions.dart';
import 'package:portfolio/widgets/section_header.dart';
import 'package:portfolio/widgets/skill_bubbles_widget.dart';
import 'package:portfolio/widgets/tech_chip.dart';
import 'package:provider/provider.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = context.isMobile;
    final isDark = context.watch<ThemeProvider>().isDark;

    return Column(
      children: [
        _StorySection(isMobile: isMobile, isDark: isDark),
        _EducationSection(isMobile: isMobile, isDark: isDark),
        _SkillsSection(isMobile: isMobile, isDark: isDark),
        _ValuesSection(isMobile: isMobile, isDark: isDark),
        _CommunitySection(isMobile: isMobile, isDark: isDark),
        _QuoteSection(isMobile: isMobile, isDark: isDark),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────
// STORY
// ─────────────────────────────────────────────────────────
class _StorySection extends StatelessWidget {
  final bool isMobile;
  final bool isDark;
  const _StorySection({required this.isMobile, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final textPrimary = isDark ? AppColors.textPrimary : AppColors.textLightPrimary;
    final textSecondary = isDark ? AppColors.textSecondary : AppColors.textLightSecondary;
    final textMuted = isDark ? AppColors.textMuted : AppColors.textLightMuted;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        isMobile ? 24 : 80,
        120,
        isMobile ? 24 : 80,
        80,
      ),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildAvatar(isMobile),
                const SizedBox(height: 40),
                _buildStory(textPrimary, textSecondary, textMuted),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 5,
                    child:
                        _buildStory(textPrimary, textSecondary, textMuted)),
                const SizedBox(width: 80),
                Expanded(flex: 3, child: _buildAvatar(isMobile)),
              ],
            ),
    );
  }

  Widget _buildAvatar(bool isMobile) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: isMobile ? 220 : 280,
              height: isMobile ? 220 : 280,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: AppColors.heroGradient,
              ),
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/mypic.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        // Info chips
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 8,
          runSpacing: 8,
          children: const [
            TechChip(label: '📍 Dhaka, Bangladesh', color: AppColors.textMuted),
            TechChip(label: '🏢 Senior Associate SE', color: AppColors.accent),
            TechChip(label: '🚀 FinTech & Banking', color: AppColors.accentTeal),
          ],
        ),
      ],
    );
  }

  Widget _buildStory(Color textPrimary, Color textSecondary, Color textMuted) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          tag: 'Professional Profile',
          title: 'AGM Khair Sabbir',
          subtitle: 'Software Engineer | FinTech & Banking Solutions',
        ),
        const SizedBox(height: 32),
        _StoryParagraph(
          title: 'Professional Summary',
          content:
              'Results-driven Software Engineer with 6+ years of experience designing and developing secure, scalable, and high-performance mobile, web, and backend applications across FinTech, Banking, EduTech, and Enterprise ERP industries. Specialized in Flutter, Java, Kotlin, Spring Boot, Oracle Database, REST APIs, and enterprise payment systems. Delivered digital banking platforms, 1M+ active user EdTech solutions, ERP systems, and payment gateway integrations.',
          textSecondary: textSecondary,
          textMuted: textMuted,
        ),
        const SizedBox(height: 24),
        _StoryParagraph(
          title: 'Core Philosophy',
          content:
              'Passionate about building secure, scalable, and user-centric financial applications while following clean architecture, Agile methodologies, and software engineering best practices. Published 10+ production-ready mobile applications on Google Play Store.',
          textSecondary: textSecondary,
          textMuted: textMuted,
        ),
        const SizedBox(height: 32),
        // Key Achievements
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            _AchievementBadge(
              icon: Icons.emoji_events_rounded,
              label: '1st Place — DIU Smart Campus (IoT & Android)',
              isDark: isDark,
            ),
            _AchievementBadge(
              icon: Icons.workspace_premium_rounded,
              label: '5th Place — DIU Campus Guide (Android)',
              isDark: isDark,
            ),
            _AchievementBadge(
              icon: Icons.school_rounded,
              label: 'BITM Certified — Project Management (2021)',
              isDark: isDark,
            ),
            _AchievementBadge(
              icon: Icons.verified_user_rounded,
              label: 'BITM Certified — Android App Dev (2019)',
              isDark: isDark,
            ),
          ],
        ),
      ],
    );
  }
}

class _StoryParagraph extends StatelessWidget {
  final String title;
  final String content;
  final Color textSecondary;
  final Color textMuted;

  const _StoryParagraph({
    required this.title,
    required this.content,
    required this.textSecondary,
    required this.textMuted,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.spaceGrotesk(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.accent,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          content,
          style: GoogleFonts.inter(
            fontSize: 15,
            height: 1.7,
            color: textSecondary,
          ),
        ),
      ],
    );
  }
}

class _AchievementBadge extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isDark;

  const _AchievementBadge({
    required this.icon,
    required this.label,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: isDark ? AppColors.bgCard : AppColors.bgLightCard,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            color: isDark ? AppColors.border : AppColors.borderLight),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 15, color: AppColors.accent),
          const SizedBox(width: 8),
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: isDark ? AppColors.textSecondary : AppColors.textLightSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────
// EDUCATION
// ─────────────────────────────────────────────────────────
class _EducationSection extends StatelessWidget {
  final bool isMobile;
  final bool isDark;
  const _EducationSection({required this.isMobile, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final bgColor = isDark ? AppColors.bgSurface : AppColors.bgLightCard;
    final textPrimary = isDark ? AppColors.textPrimary : AppColors.textLightPrimary;
    final textSecondary = isDark ? AppColors.textSecondary : AppColors.textLightSecondary;

    const educationList = [
      (
        degree: 'M.Sc in Computer Science and Engineering',
        institution: 'Jahangirnagar University, Dhaka',
        duration: '2022 – 2023',
        icon: Icons.school_rounded,
      ),
      (
        degree: 'B.Sc in Computer Science and Engineering',
        institution: 'Daffodil International University, Dhaka',
        duration: '2016 – 2020',
        icon: Icons.history_edu_rounded,
      ),
      (
        degree: 'HSC & SSC in Computer Operation & Technology',
        institution: 'Begumganj Govt. Technical School & College, Noakhali',
        duration: '2011 – 2015',
        icon: Icons.account_balance_rounded,
      ),
    ];

    return Container(
      color: bgColor,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 24 : 80, vertical: isMobile ? 60 : 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            tag: 'Academic Background',
            title: 'Education',
          ),
          const SizedBox(height: 40),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: educationList
                .map((edu) => Container(
                      width: isMobile ? double.infinity : 360,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: isDark ? AppColors.bgCard : AppColors.bgLightSurface,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                            color: isDark
                                ? AppColors.border
                                : AppColors.borderLight),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 36,
                                height: 36,
                                decoration: BoxDecoration(
                                  color: AppColors.accent.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Icon(edu.icon,
                                    color: AppColors.accent, size: 20),
                              ),
                              const Spacer(),
                              Text(
                                edu.duration,
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.accentTeal,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            edu.degree,
                            style: GoogleFonts.spaceGrotesk(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: textPrimary,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            edu.institution,
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              color: textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────
// SKILLS
// ─────────────────────────────────────────────────────────
class _SkillsSection extends StatelessWidget {
  final bool isMobile;
  final bool isDark;
  const _SkillsSection({required this.isMobile, required this.isDark});

  @override
  Widget build(BuildContext context) {
    const categories = [
      (
        Icons.phone_android_rounded,
        'Mobile Development',
        AppColors.accent,
        ['Flutter', 'Android SDK', 'Java', 'Kotlin', 'Material Design', 'Responsive UI']
      ),
      (
        Icons.dns_rounded,
        'Backend Development',
        AppColors.accentTeal,
        ['Spring Boot', 'Spring Security', 'Spring Data JPA', 'REST APIs', 'Microservices']
      ),
      (
        Icons.storage_rounded,
        'Databases & Storage',
        Color(0xFFF59E0B),
        ['Oracle Database', 'MySQL', 'SQLite', 'Room', 'Hive', 'Firestore', 'Supabase']
      ),
      (
        Icons.layers_rounded,
        'State & Architecture',
        Color(0xFFEC4899),
        ['Riverpod', 'Provider', 'GetX', 'BLoC', 'Clean Architecture', 'MVVM', 'SOLID']
      ),
      (
        Icons.cloud_rounded,
        'Cloud & Firebase',
        Color(0xFF10B981),
        ['Firebase Auth', 'Firestore', 'FCM', 'Crashlytics', 'Analytics', 'Remote Config']
      ),
      (
        Icons.handyman_rounded,
        'Tools & DevOps',
        Color(0xFF3B82F6),
        ['Git', 'GitHub', 'Docker (Basic)', 'Postman', 'Swagger', 'Figma', 'JUnit', 'Mockito']
      ),
    ];

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 24 : 80, vertical: isMobile ? 60 : 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            tag: 'Technical Skills',
            title: 'Full Engineering\nCapabilities',
            subtitle: 'Directly sourced from hands-on production experience in banking and FinTech.',
          ),
          const SizedBox(height: 48),
          SkillBubblesWidget(isDark: isDark),
          const SizedBox(height: 48),
          LayoutBuilder(builder: (context, constraints) {
            final crossCount =
                isMobile ? 1 : (constraints.maxWidth > 900 ? 3 : 2);
            return GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: crossCount,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: isMobile ? 2.0 : 1.75,
              children: categories
                  .map((cat) => _SkillCard(
                        icon: cat.$1,
                        title: cat.$2,
                        color: cat.$3,
                        skills: cat.$4,
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

class _SkillCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  final List<String> skills;
  final bool isDark;

  const _SkillCard({
    required this.icon,
    required this.title,
    required this.color,
    required this.skills,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = isDark ? AppColors.bgCard : AppColors.bgLightSurface;
    final borderColor = isDark ? AppColors.border : AppColors.borderLight;

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: color, size: 18),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: isDark ? AppColors.textPrimary : AppColors.textLightPrimary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _AnimatedSkillChips(
            skills: skills,
            color: color,
          ),
        ],
      ),
    );
  }
}

class _AnimatedSkillChips extends StatefulWidget {
  final List<String> skills;
  final Color color;

  const _AnimatedSkillChips({
    required this.skills,
    required this.color,
  });

  @override
  State<_AnimatedSkillChips> createState() => _AnimatedSkillChipsState();
}

class _AnimatedSkillChipsState extends State<_AnimatedSkillChips>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5 + (widget.skills.length % 3)),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final progress = _controller.value;
        final count = widget.skills.length;
        return Wrap(
          spacing: 8,
          runSpacing: 8,
          children: widget.skills.asMap().entries.map((entry) {
            final idx = entry.key;
            final skill = entry.value;
            // Smooth center-origin vertical wave swipe
            final centerPhase = (idx - (count / 2.0)).abs() * 0.5;
            final waveY = sin((progress * 2 * pi) - centerPhase) * 7.0;
            final waveX = sin((progress * 2 * pi) + (idx * 0.2)) * 3.0;

            return Transform.translate(
              offset: Offset(waveX, waveY),
              child: TechChip(
                label: skill,
                small: true,
                color: widget.color,
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

// ─────────────────────────────────────────────────────────
// VALUES
// ─────────────────────────────────────────────────────────
class _ValuesSection extends StatelessWidget {
  final bool isMobile;
  final bool isDark;
  const _ValuesSection({required this.isMobile, required this.isDark});

  @override
  Widget build(BuildContext context) {
    const values = [
      (Icons.security_rounded, 'Banking-Grade Security',
          'Strict adherence to enterprise security, data privacy, and regulatory financial standards.'),
      (Icons.verified_rounded, 'Clean Architecture',
          'Building modular, maintainable, and testable codebases using MVVM and SOLID principles.'),
      (Icons.groups_rounded, 'Agile & Team Leadership',
          'Mentoring junior developers, conducting code reviews, and executing in Agile Scrum sprints.'),
      (Icons.handshake_rounded, 'Product Ownership',
          'Taking complete ownership from technical design to Play Store & App Store deployments.'),
    ];

    return Container(
      color: isDark ? AppColors.bgSurface : AppColors.bgLightCard,
      padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 24 : 80, vertical: isMobile ? 60 : 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            tag: 'Engineering Practice',
            title: 'Development Principles',
          ),
          const SizedBox(height: 60),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: values
                .map((v) => _ValueCard(
                      icon: v.$1,
                      title: v.$2,
                      desc: v.$3,
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

class _ValueCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String desc;
  final bool isDark;
  final bool isMobile;

  const _ValueCard({
    required this.icon,
    required this.title,
    required this.desc,
    required this.isDark,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = isDark ? AppColors.bgCard : AppColors.bgLightSurface;
    final borderColor = isDark ? AppColors.border : AppColors.borderLight;

    return SizedBox(
      width: isMobile ? double.infinity : 460,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: borderColor),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: AppColors.accentGlow,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: AppColors.accent, size: 22),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: isDark ? AppColors.textPrimary : AppColors.textLightPrimary,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    desc,
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      height: 1.6,
                      color: isDark ? AppColors.textMuted : AppColors.textLightMuted,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────
// COMMUNITY & LEADERSHIP
// ─────────────────────────────────────────────────────────
class _CommunitySection extends StatelessWidget {
  final bool isMobile;
  final bool isDark;
  const _CommunitySection({required this.isMobile, required this.isDark});

  @override
  Widget build(BuildContext context) {
    const roles = [
      ('Chief Technology Officer (CTO)', 'Hilful Fuzul Organization'),
      ('Chief Technology Officer (CTO)', 'Change of Community Organization (CCO)'),
      ('Student Prefect (Java)', 'Daffodil International University'),
      ('Android Instructor', 'GraphView Inc'),
      ('Android Trainer', 'DIU Computer Programming Club'),
    ];

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 24 : 80, vertical: isMobile ? 60 : 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            tag: 'Leadership & Community',
            title: 'Roles & Mentorship',
          ),
          const SizedBox(height: 48),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: roles
                .map((r) => _RoleBadge(
                      role: r.$1,
                      org: r.$2,
                      isDark: isDark,
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _RoleBadge extends StatelessWidget {
  final String role;
  final String org;
  final bool isDark;

  const _RoleBadge({
    required this.role,
    required this.org,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = isDark ? AppColors.bgCard : AppColors.bgLightSurface;
    final borderColor = isDark ? AppColors.border : AppColors.borderLight;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            role,
            style: GoogleFonts.spaceGrotesk(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.accent,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            org,
            style: GoogleFonts.inter(
              fontSize: 13,
              color: isDark ? AppColors.textSecondary : AppColors.textLightSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────
// QUOTE
// ─────────────────────────────────────────────────────────
class _QuoteSection extends StatelessWidget {
  final bool isMobile;
  final bool isDark;
  const _QuoteSection({required this.isMobile, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 24 : 80, vertical: isMobile ? 60 : 100),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(isMobile ? 40 : 64),
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
            ShaderMask(
              shaderCallback: (bounds) =>
                  AppColors.heroGradient.createShader(bounds),
              child: const Icon(
                Icons.format_quote_rounded,
                size: 48,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              '"Building secure, scalable, and high-performance digital banking and FinTech products that genuinely serve people."',
              textAlign: TextAlign.center,
              style: GoogleFonts.spaceGrotesk(
                fontSize: isMobile ? 20 : 28,
                fontWeight: FontWeight.w600,
                letterSpacing: -0.5,
                height: 1.5,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              '— AGM Khair Sabbir',
              style: GoogleFonts.inter(
                fontSize: 14,
                color: AppColors.textMuted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
