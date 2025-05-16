
import 'package:flutter/material.dart';
import 'package:portfolio/providers/blog_provider.dart';
import 'package:provider/provider.dart';

class AddBlogScreen extends StatelessWidget {
  const AddBlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final blogProvider = Provider.of<BlogProvider>(context);
    final titleController = TextEditingController();
    final contentController = TextEditingController();
    final categoryController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Add New Blog')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Blog Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: contentController,
              decoration: const InputDecoration(
                labelText: 'Blog Content',
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: categoryController,
              decoration: const InputDecoration(
                labelText: 'Category',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                if (titleController.text.isNotEmpty &&
                    contentController.text.isNotEmpty &&
                    categoryController.text.isNotEmpty) {
                  await blogProvider.addBlog(
                    titleController.text,
                    contentController.text,
                    categoryController.text,
                  );
                  Navigator.pop(context);
                }
              },
              child: const Text('Publish Blog'),
            ),
          ],
        ),
      ),
    );
  }
}
