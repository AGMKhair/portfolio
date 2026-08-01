import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/providers/theme_provider.dart';
import 'package:portfolio/utils/utils.dart';
import 'package:provider/provider.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 900;
    final isDark = context.watch<ThemeProvider>().isDark;
    final bgColor = isDark ? AppColors.bgSurface : AppColors.bgLightCard;
    final borderColor = isDark ? AppColors.border : AppColors.borderLight;
    final textPrimary = isDark ? AppColors.textPrimary : AppColors.textLightPrimary;
    final textMuted = isDark ? AppColors.textMuted : AppColors.textLightMuted;
    final textSecondary = isDark ? AppColors.textSecondary : AppColors.textLightSecondary;

    const quickLinks = [
      ('Home', 0), ('About', 1), ('Experience', 2), ('Projects', 3),
      ('Products', 4), ('Case Studies', 5), ('Services', 6), ('Blog', 7), ('Contact', 8),
    ];

    const socials = [
      (Icons.language_rounded, 'LinkedIn', 'https://www.linkedin.com/in/agmkhair/'),
      (Icons.code_rounded, 'GitHub', 'https://github.com/agmkhair'),
      (Icons.email_rounded, 'Email', 'mailto:agmkhair@gmail.com'),
      (Icons.message_rounded, 'WhatsApp', 'https://wa.me/8801823585800'),
    ];

    return Container(
      color: bgColor,
      child: Column(
        children: [
          // Divider
          Container(height: 1, color: borderColor),
          // Main footer content
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 24 : 80,
              vertical: 60,
            ),
            child: isMobile
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildBrand(textPrimary, textMuted),
                      const SizedBox(height: 40),
                      _buildQuickLinks(
                          quickLinks, textSecondary, textMuted, context),
                      const SizedBox(height: 40),
                      _buildSocials(socials, isDark),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 2,
                          child: _buildBrand(textPrimary, textMuted)),
                      Expanded(
                          flex: 2,
                          child: _buildQuickLinks(
                              quickLinks, textSecondary, textMuted, context)),
                      Expanded(
                          child: _buildSocials(socials, isDark)),
                    ],
                  ),
          ),
          // Bottom bar
          Container(
            height: 1,
            color: borderColor,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 24 : 80,
              vertical: 20,
            ),
            child: Row(
              children: [
                Text(
                  '© 2026 AGM Khair Sabbir. All rights reserved.',
                  style: GoogleFonts.inter(fontSize: 12, color: textMuted),
                ),
                const Spacer(),
                Text(
                  'Built with Flutter ❤',
                  style: GoogleFonts.jetBrainsMono(
                      fontSize: 12, color: AppColors.accent),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBrand(Color textPrimary, Color textMuted) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => launch('http://spont-it.com/'),
            child: Row(
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'SponT ',
                        style: GoogleFonts.spaceGrotesk(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          color: AppColors.accent,
                          letterSpacing: -0.5,
                        ),
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            gradient: AppColors.heroGradient,
                            borderRadius: BorderRadius.circular(4),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.accent.withOpacity(0.3),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Text(
                            'IT',
                            style: GoogleFonts.spaceGrotesk(
                              fontSize: 13,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  height: 16,
                  width: 1,
                  color: AppColors.borderStrong,
                ),
                const SizedBox(width: 12),
                Text(
                  'AGM Khair Sabbir',
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.accentSecondary,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: 280,
          child: Text(
            'Software Engineer · Product Builder · Startup Founder\nBuilding digital products that scale.',
            style: GoogleFonts.inter(
              fontSize: 13,
              height: 1.6,
              color: textMuted,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: AppColors.statusActive.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                color: AppColors.statusActive.withOpacity(0.3)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                      color: AppColors.statusActive,
                      shape: BoxShape.circle)),
              const SizedBox(width: 6),
              Text(
                'Available for opportunities',
                style: GoogleFonts.inter(
                  fontSize: 11,
                  color: AppColors.statusActive,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildQuickLinks(
      List<(String, int)> links,
      Color textSecondary,
      Color textMuted,
      BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Links',
          style: GoogleFonts.spaceGrotesk(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: textMuted,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 24,
          runSpacing: 8,
          children: links
              .map((link) => GestureDetector(
                    onTap: () {
                      // Navigation is handled at the provider level
                    },
                    child: Text(
                      link.$1,
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        color: textSecondary,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildSocials(List<(IconData, String, String)> socials, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Connect',
          style: GoogleFonts.spaceGrotesk(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: isDark ? AppColors.textMuted : AppColors.textLightMuted,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 16),
        ...socials.map(
          (s) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: GestureDetector(
              onTap: () => launch(s.$3),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(s.$1,
                      size: 15,
                      color: isDark
                          ? AppColors.textMuted
                          : AppColors.textLightMuted),
                  const SizedBox(width: 8),
                  Text(
                    s.$2,
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      color: isDark
                          ? AppColors.textSecondary
                          : AppColors.textLightSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
