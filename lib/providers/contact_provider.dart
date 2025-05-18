import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ContactProvider with ChangeNotifier {
  Future<void> submitContactForm(String name, String email, String message) async {
    try {
      await FirebaseFirestore.instance.collection('contacts').add({
        'name': name,
        'email': email,
        'message': message,
        'createdAt': Timestamp.now(),
        'userId': FirebaseAuth.instance.currentUser?.uid ?? 'anonymous',
      });
    } catch (e) {
      throw Exception('Failed to submit contact form: $e');
    }
  }
}