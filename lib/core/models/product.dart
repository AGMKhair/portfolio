import 'package:flutter/material.dart';

class Product {
  final String name;
  final String tagline;
  final String description;
  final String status; // 'Live', 'Beta', 'Building', 'Coming Soon'
  final List<String> technologies;
  final List<String> features;
  final Color? accentColor;
  final IconData icon;
  final String? url;
  final String? logoPath;

  const Product({
    required this.name,
    required this.tagline,
    required this.description,
    required this.status,
    required this.technologies,
    required this.features,
    this.accentColor,
    required this.icon,
    this.url,
    this.logoPath,
  });
}
