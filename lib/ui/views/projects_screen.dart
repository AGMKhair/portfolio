import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  void _launch(String url) async {
    final uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 100,
        vertical: 60,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ===== PAGE HEADER =====
          const Text(
            'Projects',
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          const Text(
            'Production apps, client projects, and web solutions.',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 50),

          // ===== SECTION 1 =====
          _sectionTitle('Professional & Production Apps', 'Apps developed and maintained while working at reputed organizations.'),


          _projectGrid(isMobile, _companyProjects),

          const SizedBox(height: 70),

          // ===== SECTION 2 =====
          _sectionTitle('Client & Project Apps',''),
          _projectGrid(isMobile, _clientProjects),

          const SizedBox(height: 70),

          // ===== SECTION 3 =====
          _sectionTitle('Websites & Web Apps',''),
          _projectGrid(isMobile, _websiteProjects),
        ],
      ),
    );
  }

  // ================= HELPERS =================

  Widget _sectionTitle(String title, String des) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
           des,
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _projectGrid(bool isMobile, List<Project> data) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: data.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isMobile ? 1 : 3,
        crossAxisSpacing: 24,
        mainAxisSpacing: 24,
        childAspectRatio: 0.70,
      ),
      itemBuilder: (_, i) => _ProjectCard(
        project: data[i],
        onLaunch: _launch,
      ),
    );
  }
}

// ================= PROJECT CARD =================

class _ProjectCard extends StatefulWidget {
  final Project project;
  final Function(String) onLaunch;

  const _ProjectCard({
    required this.project,
    required this.onLaunch,
  });

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hover = true),
      onExit: (_) => setState(() => hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: hover
            ? (Matrix4.identity()..translate(0, -6))
            : Matrix4.identity(),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(hover ? 0.12 : 0.08),
              blurRadius: 22,
              offset: const Offset(0, 12),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ProjectImage(project: widget.project),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.project.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  if (widget.project.company != null)
                    Text(
                      widget.project.company!,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                      ),
                    ),

                  const SizedBox(height: 8),

                  Text(
                    widget.project.description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 14, height: 1.5),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    widget.project.tech,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.blueGrey,
                    ),
                  ),

                  const SizedBox(height: 14),

                  Wrap(
                    spacing: 8,
                    runSpacing: 6,
                    children: widget.project.links.map((link) {
                      return OutlinedButton.icon(
                        onPressed: () => widget.onLaunch(link.url),
                        icon: Icon(link.icon, size: 18),
                        label: Text(link.label),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class _ProjectImage extends StatelessWidget {
  final Project project;

  const _ProjectImage({required this.project});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: project.imageUrl,
            height: 180,
            width: double.infinity,
            fit: BoxFit.cover,
            placeholder: (_, __) => _shimmer(),
            errorWidget: (_, __, ___) => _placeholder(),
          ),

          if (project.isPlayStore)
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.green.shade600,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Play Store',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _shimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: 180,
        color: Colors.white,
      ),
    );
  }

  Widget _placeholder() {
    return Container(
      height: 180,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blueGrey, Colors.black87],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: const Center(
        child: Icon(Icons.image, size: 48, color: Colors.white70),
      ),
    );
  }
}

// ================= DATA MODELS =================

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

final projects = [
  Project(
    title: '10 Minute School',
    company: 'Robi 10 Minute School',
    description: 'Large-scale EdTech app with live classes.',
    tech: 'Flutter • Firebase',
    imageUrl:
    'https://play-lh.googleusercontent.com/your_real_image.png',
    isPlayStore: true,
    links: [
      ProjectLink('Play Store', 'https://play.google.com', Icons.shop),
    ],
  ),
];

// ================= DATA =================

final _companyProjects = [
  Project(
    title: '10 Minute School',
    company: 'Robi 10 Minute School',
    description:
    'Large-scale EdTech app with live classes and learning content.',
    imageUrl: 'assets/images/projects/10ms.png',
    tech: 'Flutter • Firebase',
    links: [
      ProjectLink(
        'Play Store',
        'https://play.google.com',
        Icons.shop,
      ),
    ],
  ),
];

final _clientProjects = [
  Project(
    title: 'Mobile Banking App',
    company: 'Banking Client',
    description:
    'Enterprise-grade mobile banking application.',
    imageUrl: 'assets/images/projects/banking.png',
    tech: 'Flutter • Kotlin • REST',
    links: [
      ProjectLink('APK', 'https://drive.google.com', Icons.download),
      ProjectLink('Demo', 'https://drive.google.com', Icons.play_circle),
    ],
  ),
];

final _websiteProjects = [
  Project(
    title: 'Corporate Website',
    description:
    'Responsive business website with modern UI.',
    imageUrl: 'assets/images/projects/web.png',
    tech: 'Flutter Web • HTML',
    links: [
      ProjectLink('Visit', 'https://example.com', Icons.language),
    ],
  ),
];
