import 'package:flutter/material.dart';
import 'package:portfolio/core/models/project.dart';

final websiteProjects = [
  Project(
    title: 'FLy Orbit - Travels',
    description:
    'Responsive business website with modern UI.',
    imageUrl: 'assets/images/fly_orbit.png',
    tech: 'Flutter Web • HTML',
    links: [
      ProjectLink('Visit', 'https://flyorbittravels.com', Icons.language),
    ],
  ),
  Project(
    title: 'ValueTrip BD - Travels',
    description:
    'Responsive business website with modern UI.',
    imageUrl: 'assets/images/valutrips.png',
    tech: 'Flutter Web • HTML',
    links: [
      ProjectLink('Visit', 'https://valuetripbd.com', Icons.language),
    ],
  ),
  Project(
    title: 'My Edu Write',
    description:
    'Education Helper System',
    imageUrl: 'assets/images/edu.png',
    tech: 'Flutter Web • HTML',
    links: [
      ProjectLink('Visit', 'https://myeduwrite.com', Icons.language),
    ],
  ),
];