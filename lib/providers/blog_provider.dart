import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BlogProvider with ChangeNotifier {
  List<Map<String, dynamic>> _blogs = [];
  List<Map<String, dynamic>> get blogs => _blogs;

  Future<void> fetchBlogs() async {
    final snapshot = await FirebaseFirestore.instance.collection('blogs').get();
    _blogs = snapshot.docs.map((doc) => {...doc.data(), 'id': doc.id}).toList();
    notifyListeners();
  }

  Future<void> addBlog(String title, String content, String category) async {
    await FirebaseFirestore.instance.collection('blogs').add({
      'title': title,
      'content': content,
      'category': category,
      'createdAt': Timestamp.now(),
      'authorId': FirebaseAuth.instance.currentUser?.uid,
    });
    await fetchBlogs();
  }

  Future<void> addComment(String blogId, String comment) async {
    await FirebaseFirestore.instance
        .collection('blogs')
        .doc(blogId)
        .collection('comments')
        .add({
      'comment': comment,
      'createdAt': Timestamp.now(),
      'authorId': FirebaseAuth.instance.currentUser?.uid,
    });
  }
}