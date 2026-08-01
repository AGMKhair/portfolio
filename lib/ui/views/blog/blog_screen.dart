import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/models/blog_post.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/providers/theme_provider.dart';
import 'package:portfolio/ui/data/blog_data.dart';
import 'package:portfolio/utils/size_extensions.dart';
import 'package:portfolio/widgets/section_header.dart';
import 'package:provider/provider.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({super.key});

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  String _selectedCategory = 'All';

  static const _categories = [
    'All',
    'Flutter',
    'Architecture',
    'FinTech',
    'Startup',
    'Backend',
    'DevOps',
  ];

  List<BlogPost> get _filteredPosts {
    if (_selectedCategory == 'All') return blogPosts;
    return blogPosts
        .where((p) => p.category == _selectedCategory)
        .toList();
  }

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
          const SectionHeader(
            tag: 'Blog',
            title: 'Thoughts on\nEngineering',
            subtitle:
                'Articles on Flutter, architecture, FinTech, and building startups from Bangladesh.',
          ),
          const SizedBox(height: 48),
          // Category filters
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: _categories.map((cat) {
                final isSelected = _selectedCategory == cat;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: GestureDetector(
                    onTap: () => setState(() => _selectedCategory = cat),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.accent
                            : (isDark
                                ? AppColors.bgCard
                                : AppColors.bgLightCard),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isSelected
                              ? AppColors.accent
                              : (isDark
                                  ? AppColors.border
                                  : AppColors.borderLight),
                        ),
                      ),
                      child: Text(
                        cat,
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          fontWeight: isSelected
                              ? FontWeight.w600
                              : FontWeight.w400,
                          color: isSelected
                              ? Colors.white
                              : (isDark
                                  ? AppColors.textSecondary
                                  : AppColors.textLightSecondary),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 48),
          // Blog posts grid
          LayoutBuilder(builder: (context, constraints) {
            final crossCount =
                isMobile ? 1 : (constraints.maxWidth > 900 ? 3 : 2);
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _filteredPosts.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossCount,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: isMobile ? 1.8 : 1.45,
              ),
              itemBuilder: (context, index) {
                return _BlogCard(
                  post: _filteredPosts[index],
                  isDark: isDark,
                );
              },
            );
          }),
          const SizedBox(height: 60),
          // Writing CTA
          Center(
            child: Container(
              padding: const EdgeInsets.all(40),
              decoration: BoxDecoration(
                color: isDark ? AppColors.bgCard : AppColors.bgLightCard,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    color: isDark ? AppColors.border : AppColors.borderLight),
              ),
              child: Column(
                children: [
                  const Icon(Icons.edit_rounded,
                      color: AppColors.accent, size: 32),
                  const SizedBox(height: 16),
                  Text(
                    'More articles coming soon',
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: isDark
                          ? AppColors.textPrimary
                          : AppColors.textLightPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Follow me on LinkedIn to get notified when I publish new articles.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: isDark ? AppColors.textMuted : AppColors.textLightMuted,
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

class _BlogCard extends StatefulWidget {
  final BlogPost post;
  final bool isDark;
  const _BlogCard({required this.post, required this.isDark});

  @override
  State<_BlogCard> createState() => _BlogCardState();
}

class _BlogCardState extends State<_BlogCard> {
  bool _hovered = false;

  Color get _categoryColor {
    switch (widget.post.category) {
      case 'Flutter':
        return AppColors.accent;
      case 'FinTech':
        return AppColors.accentTeal;
      case 'Startup':
        return const Color(0xFFF59E0B);
      case 'Architecture':
        return const Color(0xFFEC4899);
      case 'Backend':
        return const Color(0xFF10B981);
      case 'DevOps':
        return const Color(0xFF3B82F6);
      default:
        return AppColors.textMuted;
    }
  }

  @override
  Widget build(BuildContext context) {
    final post = widget.post;
    final isDark = widget.isDark;
    final bgColor = isDark
        ? (_hovered ? AppColors.bgCardHover : AppColors.bgCard)
        : (_hovered ? AppColors.bgLightCard : AppColors.bgLightSurface);
    final borderColor = _hovered
        ? _categoryColor.withOpacity(0.3)
        : (isDark ? AppColors.border : AppColors.borderLight);

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
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
                    color: _categoryColor.withOpacity(0.1),
                    blurRadius: 24,
                    offset: const Offset(0, 8),
                  )
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Category + read time
            Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: _categoryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    post.category,
                    style: GoogleFonts.inter(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: _categoryColor,
                    ),
                  ),
                ),
                const Spacer(),
                Icon(Icons.schedule_rounded,
                    size: 12,
                    color: isDark ? AppColors.textHint : AppColors.textLightMuted),
                const SizedBox(width: 4),
                Text(
                  post.readTime,
                  style: GoogleFonts.inter(
                    fontSize: 11,
                    color: isDark ? AppColors.textHint : AppColors.textLightMuted,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Title
            Text(
              post.title,
              style: GoogleFonts.spaceGrotesk(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                height: 1.35,
                color: isDark ? AppColors.textPrimary : AppColors.textLightPrimary,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 10),
            // Excerpt
            Expanded(
              child: Text(
                post.excerpt,
                style: GoogleFonts.inter(
                  fontSize: 13,
                  height: 1.6,
                  color: isDark ? AppColors.textMuted : AppColors.textLightMuted,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
              ),
            ),
            const SizedBox(height: 16),
            // Footer
            Row(
              children: [
                Text(
                  post.date,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: isDark ? AppColors.textHint : AppColors.textLightMuted,
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_forward_rounded,
                  size: 15,
                  color: _hovered
                      ? _categoryColor
                      : (isDark ? AppColors.textHint : AppColors.textLightMuted),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
