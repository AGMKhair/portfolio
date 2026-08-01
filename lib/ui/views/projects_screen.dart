import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/models/project.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/providers/theme_provider.dart';
import 'package:portfolio/ui/data/company_projects.dart';
import 'package:portfolio/ui/data/personal_project.dart';
import 'package:portfolio/utils/size_extensions.dart';
import 'package:portfolio/utils/utils.dart';
import 'package:portfolio/widgets/section_header.dart';
import 'package:provider/provider.dart';

class ProjectsScreen extends StatefulWidget {
  final bool isHome;
  const ProjectsScreen({super.key, this.isHome = false});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  int _selectedCategory = 0;

  static const categories = [
    'All Projects',
    'FinTech & Banking',
    'SME & ERP',
    'Personal Products',
    'Social Impact',
  ];

  List<Project> get _filteredProjects {
    switch (_selectedCategory) {
      case 1:
        return companyProjects
            .where((p) =>
                p.company?.contains('Bank') == true ||
                p.company?.contains('Islami') == true ||
                p.company?.contains('CIBL') == true ||
                p.company?.contains('RED') == true)
            .toList();
      case 2:
        return companyProjects
            .where((p) =>
                p.company?.contains('RED') == true ||
                p.title.contains('ERP') == true)
            .toList();
      case 3:
        return clientProjects;
      case 4:
        return socialProjects;
      default:
        return [...companyProjects, ...clientProjects, ...socialProjects];
    }
  }

  void _launch(String url) {
    if (url.isNotEmpty) launch(url);
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = context.isMobile;
    final isDark = context.watch<ThemeProvider>().isDark;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        isMobile ? 24 : 80,
        widget.isHome ? 0 : 120,
        isMobile ? 24 : 80,
        widget.isHome ? 60 : 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.isHome) ...[
            const SectionHeader(
              tag: 'Featured Work',
              title: 'Production Projects\n& Applications',
              subtitle:
                  'Commercial banking platforms, SME solutions, and live mobile applications.',
              centered: true,
            ),
            const SizedBox(height: 60),
          ] else ...[
            const SectionHeader(
              tag: 'Portfolio',
              title: 'Projects & Work',
              subtitle:
                  'Explore commercial banking applications, enterprise systems, personal products, and community projects.',
            ),
            const SizedBox(height: 40),
            // Filter categories
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categories.asMap().entries.map((entry) {
                  final i = entry.key;
                  final label = entry.value;
                  final isSelected = _selectedCategory == i;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: _FilterChip(
                      label: label,
                      isSelected: isSelected,
                      isDark: isDark,
                      onTap: () => setState(() => _selectedCategory = i),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 48),
          ],
          // Grid
          LayoutBuilder(builder: (context, constraints) {
            final crossCount = isMobile ? 1 : (constraints.maxWidth > 1000 ? 3 : 2);
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.isHome
                  ? companyProjects.take(3).length
                  : _filteredProjects.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossCount,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: isMobile ? 1.25 : 1.25,
              ),
              itemBuilder: (context, index) {
                final projects = widget.isHome
                    ? companyProjects.take(3).toList()
                    : _filteredProjects;
                return _ProjectCard(
                  project: projects[index],
                  onLaunch: _launch,
                  isDark: isDark,
                );
              },
            );
          }),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final bool isDark;
  final VoidCallback onTap;

  const _FilterChip({
    required this.label,
    required this.isSelected,
    required this.isDark,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.accent
              : (isDark ? AppColors.bgCard : AppColors.bgLightCard),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected
                ? AppColors.accent
                : (isDark ? AppColors.border : AppColors.borderLight),
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.accent.withOpacity(0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  )
                ]
              : [],
        ),
        child: Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 13,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            color: isSelected
                ? Colors.white
                : (isDark ? AppColors.textSecondary : AppColors.textLightSecondary),
          ),
        ),
      ),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final Project project;
  final Function(String) onLaunch;
  final bool isDark;

  const _ProjectCard({
    required this.project,
    required this.onLaunch,
    required this.isDark,
  });

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final p = widget.project;
    final isDark = widget.isDark;
    final bgColor = isDark
        ? (_hovered ? AppColors.bgCardHover : AppColors.bgCard)
        : (_hovered ? AppColors.bgLightCard : AppColors.bgLightSurface);
    final borderColor = _hovered
        ? AppColors.accent.withOpacity(0.4)
        : (isDark ? AppColors.border : AppColors.borderLight);

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: borderColor, width: _hovered ? 1.5 : 1),
          boxShadow: _hovered
              ? [
                  BoxShadow(
                    color: AppColors.accent.withOpacity(0.18),
                    blurRadius: 28,
                    offset: const Offset(0, 10),
                  )
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Header (Half Card Height, Full Crisp Display)
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
              child: SizedBox(
                height: 175,
                width: double.infinity,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    AnimatedScale(
                      scale: _hovered ? 1.05 : 1.0,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                      child: _ProjectImage(
                        imageUrl: p.imageUrl,
                        title: p.title,
                      ),
                    ),
                    // Subtle Top/Bottom Vignette for readability
                    DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.4),
                            Colors.transparent,
                            Colors.black.withOpacity(0.3),
                          ],
                          stops: const [0.0, 0.5, 1.0],
                        ),
                      ),
                    ),
                    // Top-Left: Company / Category Tag
                    if (p.company != null && p.company!.isNotEmpty)
                      Positioned(
                        top: 12,
                        left: 12,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.65),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: Colors.white.withOpacity(0.2)),
                          ),
                          child: Text(
                            p.company!,
                            style: GoogleFonts.inter(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: AppColors.accentSecondary,
                            ),
                          ),
                        ),
                      ),
                    // Top-Right: Subtle Tech Glass Tag
                    if (p.tech != null)
                      Positioned(
                        top: 12,
                        right: 12,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: Colors.white.withOpacity(0.2)),
                          ),
                          child: Text(
                            p.tech!,
                            style: GoogleFonts.jetBrainsMono(
                              fontSize: 10,
                              color: AppColors.textSecondary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            // Soft Clean Content Area Below Image
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      p.title,
                      style: GoogleFonts.spaceGrotesk(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: _hovered
                            ? AppColors.accent
                            : (isDark
                                ? AppColors.textPrimary
                                : AppColors.textLightPrimary),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: Text(
                        p.description,
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          height: 1.5,
                          color: isDark
                              ? AppColors.textSecondary
                              : AppColors.textLightSecondary,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 14),
                    // Action Row
                    Row(
                      children: [
                        if (p.isPlayStore)
                          _PlayStoreButton(
                            onTap: () => widget.onLaunch(
                                p.links.isNotEmpty ? p.links[0].url : ''),
                          ),
                        const Spacer(),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          transform: Matrix4.identity()
                            ..translate(_hovered ? 4.0 : 0.0, 0.0),
                          child: Icon(
                            Icons.arrow_forward_rounded,
                            size: 18,
                            color: _hovered
                                ? AppColors.accent
                                : (isDark
                                    ? AppColors.textHint
                                    : AppColors.textLightMuted),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProjectImage extends StatelessWidget {
  final String imageUrl;
  final String title;

  const _ProjectImage({required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    if (imageUrl.startsWith('http')) {
      return Image.network(
        imageUrl,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => _buildBrandedCover(title),
      );
    }
    return Image.asset(
      imageUrl,
      fit: BoxFit.cover,
      errorBuilder: (_, __, ___) => _buildBrandedCover(title),
    );
  }

  Widget _buildBrandedCover(String projectTitle) {
    final initials = projectTitle.isNotEmpty
        ? projectTitle
            .trim()
            .split(' ')
            .take(2)
            .map((e) => e[0])
            .join()
            .toUpperCase()
        : 'P';

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF0F172A),
            Color(0xFF1C2B50),
          ],
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Radial Glow
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  AppColors.accent.withOpacity(0.25),
                  Colors.transparent,
                ],
                radius: 0.8,
              ),
            ),
          ),
          // Branded Emblem
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  gradient: AppColors.heroGradient,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.accent.withOpacity(0.4),
                      blurRadius: 16,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    initials,
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'SponT IT Verified',
                style: GoogleFonts.inter(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: AppColors.accentSecondary,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PlayStoreButton extends StatefulWidget {
  final VoidCallback onTap;
  const _PlayStoreButton({required this.onTap});

  @override
  State<_PlayStoreButton> createState() => _PlayStoreButtonState();
}

class _PlayStoreButtonState extends State<_PlayStoreButton> {
  bool _btnHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _btnHovered = true),
      onExit: (_) => setState(() => _btnHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            gradient: _btnHovered ? AppColors.heroGradient : null,
            color: _btnHovered ? null : AppColors.accent.withOpacity(0.12),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: _btnHovered
                  ? AppColors.accent
                  : AppColors.accent.withOpacity(0.3),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.shop_rounded,
                size: 13,
                color: _btnHovered ? Colors.white : AppColors.accent,
              ),
              const SizedBox(width: 6),
              Text(
                'Play Store',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: _btnHovered ? Colors.white : AppColors.accent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
