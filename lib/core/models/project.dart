
import 'package:portfolio/core/enums/project_type.dart';

class Project {
  final String title;
  final String description;
  final String image;
  final String tech;
  final ProjectType type;

  final String? playStoreUrl;
  final String? apkUrl;
  final String? demoUrl;   // video / demo
  final String? websiteUrl;

  final String? company;   // company name (optional)

  Project({
    required this.title,
    required this.description,
    required this.image,
    required this.tech,
    required this.type,
    this.playStoreUrl,
    this.apkUrl,
    this.demoUrl,
    this.websiteUrl,
    this.company,
  });
}