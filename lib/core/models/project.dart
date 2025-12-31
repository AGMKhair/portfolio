import 'package:flutter/material.dart';

class Project {
  final String title;
  final String description;
  final String tech;
  final String imageUrl;
  final String? company;
  final bool isPlayStore;
  final List<ProjectLink> links;

  Project({
    required this.title,
    required this.description,
    required this.tech,
    required this.imageUrl,
    this.company,
    this.isPlayStore = false,
    required this.links,
  });
}

class ProjectLink {
  final String label;
  final String url;
  final IconData icon;

  ProjectLink(this.label, this.url, this.icon);
}