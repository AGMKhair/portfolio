import 'package:flutter/material.dart';
import 'package:portfolio/providers/blog_provider.dart';
import 'package:portfolio/utils/AppRoutes.dart';
import 'package:provider/provider.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final blogProvider = context.watch<BlogProvider>();
    final isMobile = MediaQuery.of(context).size.width < 900;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 80,
        vertical: 40,
      ),
      child: FutureBuilder(
        future: blogProvider.fetchBlogs(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final blogs = blogProvider.blogs;

          final categories = blogs
              .map((b) => b['category'])
              .whereType<String>()
              .where((c) => c.isNotEmpty)
              .toSet()
              .toList();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ===== HEADER =====
              Text(
                'Blog',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Thoughts, tutorials, and insights from my experience.',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              const SizedBox(height: 24),

              // ===== CATEGORY FILTER =====
              Wrap(
                spacing: 10,
                runSpacing: 8,
                children: [
                  FilterChip(
                    label: const Text('All'), onSelected: (bool value) {

                  },
                    // selected: blogProvider.selectedCategory == null,
                    // onSelected: (_) =>
                    //     blogProvider.filterByCategory(null),
                  ),
                  ...categories.map(
                        (category) => FilterChip(
                      label: Text(category), onSelected: (bool value) {  },
                      // selected: blogProvider.selectedCategory == category,
                      // onSelected: (_) => blogProvider.filterByCategory(category),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // ===== BLOG LIST / GRID =====
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: isMobile ? 1 : 3,
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 24,
                    childAspectRatio: isMobile ? 1.2 : 0.9,
                  ),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    // final blog = blogProvider.filteredBlogs[index];
                    // return _BlogCard(blog: blog);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// ================= BLOG CARD =================

class _BlogCard extends StatelessWidget {
  final Map<String, dynamic> blog;

  const _BlogCard({required this.blog});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.blogDetails,
          arguments: blog,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ===== CATEGORY =====
              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  blog['category'] ?? '',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // ===== TITLE =====
              Text(
                blog['title'] ?? '',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              // ===== EXCERPT =====
              Text(
                blog['content'] ?? '',
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 14,
                  height: 1.5,
                  color: Colors.grey,
                ),
              ),

              const Spacer(),

              // ===== CTA =====
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  'Read more →',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
