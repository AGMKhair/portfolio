import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/providers/navigation_provider.dart';
import 'package:portfolio/providers/theme_provider.dart';
import 'package:portfolio/ui/views/about_screen.dart';
import 'package:portfolio/ui/views/blog/blog_screen.dart';
import 'package:portfolio/ui/views/case_studies_screen.dart';
import 'package:portfolio/ui/views/contact/contact_screen.dart';
import 'package:portfolio/ui/views/experience_screen.dart';
import 'package:portfolio/ui/views/home_screen.dart';
import 'package:portfolio/ui/views/products_screen.dart';
import 'package:portfolio/ui/views/projects_screen.dart';
import 'package:portfolio/ui/views/service/service_screen.dart';
import 'package:portfolio/utils/size_extensions.dart';
import 'package:portfolio/utils/utils.dart';
import 'package:portfolio/widgets/app_footer.dart';
import 'package:portfolio/widgets/app_menu.dart';
import 'package:portfolio/widgets/animated_background.dart';
import 'package:portfolio/widgets/tech_constellation_background.dart';
import 'package:provider/provider.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  final _scrollController = ScrollController();
  bool _isScrolled = false;

  static const pages = [
    HomeScreen(),
    AboutScreen(),
    ExperienceScreen(),
    ProjectsScreen(),
    ProductsScreen(),
    CaseStudiesScreen(),
    ServicesScreen(),
    BlogScreen(),
    ContactScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      final scrolled = _scrollController.offset > 20;
      if (scrolled != _isScrolled) {
        setState(() => _isScrolled = scrolled);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = context.watch<NavigationProvider>().currentIndex;
    final isDark = context.watch<ThemeProvider>().isDark;
    final isMobile = context.isMobile;

    final bgColor = isDark ? AppColors.bgDark : AppColors.bgLight;
    final navBg = isDark
        ? (_isScrolled
            ? AppColors.bgSurface.withOpacity(0.92)
            : Colors.transparent)
        : (_isScrolled
            ? AppColors.bgLightSurface.withOpacity(0.95)
            : Colors.transparent);
    final borderColor = isDark ? AppColors.border : AppColors.borderLight;

    return Scaffold(
      backgroundColor: bgColor,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(64),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: navBg,
            border: _isScrolled
                ? Border(bottom: BorderSide(color: borderColor, width: 1))
                : null,
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 20 : 48, vertical: 0),
              child: Row(
                children: [
                  // Logo / Brand (SponT IT -> http://spont-it.com/)
                  Row(
                    children: [
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () => launch('http://spont-it.com/'),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'SponT ',
                                  style: GoogleFonts.spaceGrotesk(
                                    fontSize: 20,
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
                                        fontSize: 12,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        height: 14,
                        width: 1,
                        color: isDark
                            ? AppColors.borderStrong
                            : AppColors.borderLight,
                      ),
                      const SizedBox(width: 12),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () => context
                              .read<NavigationProvider>()
                              .setIndex(0),
                          child: Text(
                            'AGM Khair Sabbir',
                            style: GoogleFonts.spaceGrotesk(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: isDark
                                  ? AppColors.textSecondary
                                  : AppColors.textLightSecondary,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  if (!isMobile) const AppMenu(),
                  if (isMobile) ...[
                    _ThemeMobileToggle(
                      isDark: isDark,
                      onToggle:
                          context.read<ThemeProvider>().toggleTheme,
                    ),
                    const SizedBox(width: 8),
                    Builder(
                      builder: (ctx) => IconButton(
                        onPressed: () => Scaffold.of(ctx).openDrawer(),
                        icon: Icon(
                          Icons.menu_rounded,
                          color: isDark
                              ? AppColors.textSecondary
                              : AppColors.textLightSecondary,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
      drawer: isMobile
          ? Drawer(
              backgroundColor:
                  isDark ? AppColors.bgSurface : AppColors.bgLightSurface,
              child: const AppMenu(),
            )
          : null,
      body: TechConstellationBackground(
        isDark: isDark,
        child: AnimatedBackground(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            switchInCurve: Curves.easeOut,
            switchOutCurve: Curves.easeIn,
            child: SingleChildScrollView(
              key: ValueKey(currentIndex),
              controller: _scrollController,
              child: Column(
                children: [
                  pages[currentIndex],
                  const AppFooter(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ThemeMobileToggle extends StatelessWidget {
  final bool isDark;
  final VoidCallback onToggle;

  const _ThemeMobileToggle({required this.isDark, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onToggle,
      child: Icon(
        isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
        size: 22,
        color: isDark ? AppColors.textMuted : AppColors.textLightMuted,
      ),
    );
  }
}
