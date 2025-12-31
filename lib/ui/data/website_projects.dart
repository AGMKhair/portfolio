import 'package:flutter/material.dart';
import 'package:portfolio/core/models/project.dart';
import '../views/projects_screen.dart';

final websiteProjects = [
  Project(
    title: 'Travels',
    description:
    'Responsive business website with modern UI.',
    imageUrl: 'assets/images/fly_orbit.png',
    tech: 'Flutter Web • HTML',
    links: [
      ProjectLink('Visit', 'https://flyorbittravels.com', Icons.language),
    ],
  ),
];