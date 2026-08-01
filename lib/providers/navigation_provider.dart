import 'package:flutter/material.dart';

class NavigationProvider with ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  // 9 nav items: Home, About, Experience, Projects, Products, Case Studies, Services, Blog, Contact
  static const int totalItems = 9;

  void setIndex(int index) {
    if (index >= 0 && index < totalItems) {
      _currentIndex = index;
      notifyListeners();
    }
  }

  // Named navigation helpers
  void goHome() => setIndex(0);
  void goAbout() => setIndex(1);
  void goExperience() => setIndex(2);
  void goProjects() => setIndex(3);
  void goProducts() => setIndex(4);
  void goCaseStudies() => setIndex(5);
  void goServices() => setIndex(6);
  void goBlog() => setIndex(7);
  void goContact() => setIndex(8);
}
