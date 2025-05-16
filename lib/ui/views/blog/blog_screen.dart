import 'package:flutter/material.dart';
import 'package:portfolio/providers/blog_provider.dart';
import 'package:portfolio/utils/AppRoutes.dart';
import 'package:provider/provider.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final blogProvider = Provider.of<BlogProvider>(context);

    return Scaffold(
      body: FutureBuilder(
        future: blogProvider.fetchBlogs(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final blogs = blogProvider.blogs;
          final categories = blogs
              .map((blog) => blog['category'])
              .where((category) => category is String && category.isNotEmpty)
              .cast<String>()
              .toSet()
              .toList();
          // final categories = blogs.map((blog) => blog['category']).toSet().toList();

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: DropdownButton<String>(
                  hint: const Text('Filter by Category'),
                  items: categories.map((category) => DropdownMenuItem(
                    value: category,
                    child: Text(category),)
                  ).toList(),
                  onChanged: (value) {
                    // Implement category filter
                  },
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: blogs.length,
                  itemBuilder: (context, index) {
                    final blog = blogs[index];
                    return ListTile(
                      title: Text(blog['title']),
                      subtitle: Text('Category: ${blog['category']}'),
                      trailing: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            AppRoutes.blogDetails, // Use AppRoutes
                            arguments: blog,
                          );
                        },
                        child: const Text('Details'),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, AppRoutes.addBlog), // Use AppRoutes
        child: const Icon(Icons.add),
      ),
    );
  }
}