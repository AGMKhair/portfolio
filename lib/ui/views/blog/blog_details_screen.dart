import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/providers/blog_provider.dart';
import 'package:portfolio/utils/AppRoutes.dart';
import 'package:provider/provider.dart';

class BlogDetailScreen extends StatelessWidget {
  const BlogDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final blog = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final blogProvider = Provider.of<BlogProvider>(context);
    final TextEditingController commentController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text(blog['title'])),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(blog['title'], style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            Text('Category: ${blog['category']}'),
            const SizedBox(height: 16),
            Text(blog['content']),
            const SizedBox(height: 24),
            const Text('Comments', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('blogs')
                  .doc(blog['id'])
                  .collection('comments')
                  .orderBy('createdAt', descending: true)
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) return const CircularProgressIndicator();
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final comment = snapshot.data!.docs[index];
                    return ListTile(
                      title: Text(comment['comment']),
                      subtitle: Text(comment['createdAt'].toDate().toString()),
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 16),
            TextField(
              controller: commentController,
              decoration: const InputDecoration(
                labelText: 'Add a comment',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () async {
                if (commentController.text.isNotEmpty) {
                  await blogProvider.addComment(blog['id'], commentController.text);
                  commentController.clear();
                }
              },
              child: const Text('Post Comment'),
            ),
            const SizedBox(height: 24),
            const Text('Suggested Blogs', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            FutureBuilder(
              future: blogProvider.fetchBlogs(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                final suggestedBlogs = blogProvider.blogs
                    .where((b) => b['id'] != blog['id'] && b['category'] == blog['category'])
                    .take(3)
                    .toList();
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: suggestedBlogs.length,
                  itemBuilder: (context, index) {
                    final suggestedBlog = suggestedBlogs[index];
                    return ListTile(
                      title: Text(suggestedBlog['title']),
                      onTap: () {
                        Navigator.pushReplacementNamed(
                          context,
                          AppRoutes.blogDetails, // Use AppRoutes
                          arguments: suggestedBlog,
                        );
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}