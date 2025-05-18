import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ServiceProvider with ChangeNotifier {
  List<Map<String, dynamic>> _services = [];
  List<Map<String, dynamic>> get services => _services;

  Future<void> fetchServices() async {
    final snapshot = await FirebaseFirestore.instance.collection('services').get();
    _services = snapshot.docs.map((doc) => {...doc.data(), 'id': doc.id}).toList();
    notifyListeners();
  }

  Future<void> addService(String title, String description, String? iconUrl) async {
    await FirebaseFirestore.instance.collection('services').add({
      'title': title,
      'description': description,
      'iconUrl': iconUrl,
      'createdAt': Timestamp.now(),
      'authorId': FirebaseAuth.instance.currentUser?.uid,
    });
    await fetchServices();
  }
}
