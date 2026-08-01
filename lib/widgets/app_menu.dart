import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/providers/navigation_provider.dart';
import 'package:portfolio/providers/theme_provider.dart';
import 'package:portfolio/utils/size_extensions.dart';
import 'package:provider/provider.dart';

class AppMenu extends StatelessWidget {
  const AppMenu({super.key});

  static const List<String> items = [
    'Home',
    'About',
    'Experience',
    'Projects',
    'Products',
    'Case Studies',
    'Services',
    'Blog',
    'Contact',
  ];

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<NavigationProvider>();
    final themeProvider = context.watch<ThemeProvider>();
    final isDark = themeProvider.isDark;

    if (context.isMobile) {
      return _buildMobileMenu(context, provider, isDark);
    }
    return _buildDesktopMenu(context, provider, isDark, themeProvider);
  }

  Widget _buildDesktopMenu(BuildContext context, NavigationProvider provider,
      bool isDark, ThemeProvider themeProvider) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...List.generate(items.length, (index) {
          final bool isSelected = provider.currentIndex == index;
          return _NavItem(
            label: items[index],
            isSelected: isSelected,
            isDark: isDark,
            onTap: () => context.read<NavigationProvider>().setIndex(index),
          );
        }),
        const SizedBox(width: 16),
        _ThemeToggle(isDark: isDark, onToggle: themeProvider.toggleTheme),
        const SizedBox(width: 8),
        _ContactCta(onTap: () => context.read<NavigationProvider>().goContact()),
      ],
    );
  }

  Widget _buildMobileMenu(BuildContext context, NavigationProvider provider,
      bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 60),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            'AGM Khair Sabbir',
            style: GoogleFonts.spaceGrotesk(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: isDark ? AppColors.textPrimary : AppColors.textLightPrimary,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            'Software Engineer & Product Builder',
            style: GoogleFonts.inter(
              fontSize: 12,
              color: AppColors.accent,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 32),
        const Divider(height: 1),
        const SizedBox(height: 16),
        ...List.generate(items.length, (index) {
          final bool isSelected = provider.currentIndex == index;
          return _MobileNavItem(
            label: items[index],
            isSelected: isSelected,
            isDark: isDark,
            onTap: () {
              context.read<NavigationProvider>().setIndex(index);
              Navigator.of(context).pop();
            },
          );
        }),
      ],
    );
  }
}

class _NavItem extends StatefulWidget {
  final String label;
  final bool isSelected;
  final bool isDark;
  final VoidCallback onTap;

  const _NavItem({
    required this.label,
    required this.isSelected,
    required this.isDark,
    required this.onTap,
  });

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final color = widget.isSelected
        ? AppColors.accent
        : widget.isDark
            ? (_hovered ? AppColors.textSecondary : AppColors.textMuted)
            : (_hovered
                ? AppColors.textLightPrimary
                : AppColors.textLightSecondary);

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.label,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight:
                      widget.isSelected ? FontWeight.w600 : FontWeight.w400,
                  color: color,
                ),
              ),
              const SizedBox(height: 4),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 2,
                width: widget.isSelected ? 20 : (_hovered ? 10 : 0),
                decoration: BoxDecoration(
                  color: AppColors.accent,
                  borderRadius: BorderRadius.circular(1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MobileNavItem extends StatelessWidget {
  final String label;
  final bool isSelected;
  final bool isDark;
  final VoidCallback onTap;

  const _MobileNavItem({
    required this.label,
    required this.isSelected,
    required this.isDark,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.accentGlow : Colors.transparent,
          border: Border(
            left: BorderSide(
              color: isSelected ? AppColors.accent : Colors.transparent,
              width: 3,
            ),
          ),
        ),
        child: Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 15,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            color: isSelected
                ? AppColors.accent
                : (isDark ? AppColors.textSecondary : AppColors.textLightSecondary),
          ),
        ),
      ),
    );
  }
}

class _ThemeToggle extends StatelessWidget {
  final bool isDark;
  final VoidCallback onToggle;

  const _ThemeToggle({required this.isDark, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onToggle,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isDark ? AppColors.bgCard : AppColors.bgLightCard,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isDark ? AppColors.border : AppColors.borderLight,
          ),
        ),
        child: Icon(
          isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
          size: 18,
          color: isDark ? AppColors.textMuted : AppColors.textLightMuted,
        ),
      ),
    );
  }
}

class _ContactCta extends StatefulWidget {
  final VoidCallback onTap;
  const _ContactCta({required this.onTap});

  @override
  State<_ContactCta> createState() => _ContactCtaState();
}

class _ContactCtaState extends State<_ContactCta> {
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
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
          decoration: BoxDecoration(
            gradient: _hovered
                ? AppColors.accentGradient
                : null,
            color: _hovered ? null : AppColors.accent,
            borderRadius: BorderRadius.circular(8),
            boxShadow: _hovered
                ? [
                    BoxShadow(
                      color: AppColors.accent.withOpacity(0.4),
                      blurRadius: 16,
                      offset: const Offset(0, 4),
                    )
                  ]
                : [],
          ),
          child: Text(
            "Let's Talk",
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
