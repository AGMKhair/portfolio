import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/models/product.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/providers/theme_provider.dart';
import 'package:portfolio/ui/data/products_data.dart';
import 'package:portfolio/utils/size_extensions.dart';
import 'package:portfolio/widgets/section_header.dart';
import 'package:portfolio/widgets/tech_chip.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

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
            tag: 'My Products',
            title: 'Building the\nNext Generation',
            subtitle:
                "Beyond client work — I'm building my own startup products that solve real problems.",
          ),
          const SizedBox(height: 80),
          LayoutBuilder(builder: (context, constraints) {
            final crossCount =
                isMobile ? 1 : (constraints.maxWidth > 1100 ? 3 : 2);
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossCount,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: isMobile ? 1.45 : 1.35,
              ),
              itemBuilder: (context, index) {
                return _ProductCard(
                  product: products[index],
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

class _ProductCard extends StatefulWidget {
  final Product product;
  final bool isDark;
  const _ProductCard({required this.product, required this.isDark});

  @override
  State<_ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<_ProductCard> {
  bool _hovered = false;

  Color get _statusColor {
    switch (widget.product.status) {
      case 'Live':
        return AppColors.statusActive;
      case 'Beta':
        return AppColors.statusBeta;
      case 'Building':
        return AppColors.statusDev;
      default:
        return AppColors.statusSoon;
    }
  }

  @override
  Widget build(BuildContext context) {
    final p = widget.product;
    final isDark = widget.isDark;
    final accent = p.accentColor ?? AppColors.accent;
    final bgColor = isDark
        ? (_hovered ? AppColors.bgCardHover : AppColors.bgCard)
        : (_hovered ? AppColors.bgLightCard : AppColors.bgLightSurface);
    final borderColor = _hovered
        ? accent.withOpacity(0.35)
        : (isDark ? AppColors.border : AppColors.borderLight);

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: borderColor),
          boxShadow: _hovered
              ? [
                  BoxShadow(
                    color: accent.withOpacity(0.12),
                    blurRadius: 32,
                    offset: const Offset(0, 12),
                  )
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                // Icon
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: accent.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(p.icon, color: accent, size: 24),
                ),
                const Spacer(),
                // Status badge
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: _statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: _statusColor.withOpacity(0.3)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 5,
                        height: 5,
                        decoration: BoxDecoration(
                          color: _statusColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        p.status,
                        style: GoogleFonts.inter(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: _statusColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Name
            Text(
              p.name,
              style: GoogleFonts.spaceGrotesk(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: isDark ? AppColors.textPrimary : AppColors.textLightPrimary,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              p.tagline,
              style: GoogleFonts.inter(
                fontSize: 13,
                color: accent,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Text(
                p.description,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.inter(
                  fontSize: 13,
                  height: 1.6,
                  color: isDark ? AppColors.textMuted : AppColors.textLightMuted,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Tech chips
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: p.technologies
                  .take(4)
                  .map((t) => TechChip(label: t, small: true, color: accent))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
