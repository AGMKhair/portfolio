import 'package:flutter/material.dart';
import 'package:portfolio/core/models/project.dart';
import 'package:portfolio/ui/data/company_projects.dart';
import 'package:portfolio/ui/data/personal_project.dart';
import 'package:portfolio/ui/data/website_projects.dart';
import 'package:portfolio/widgets/project_image_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsScreen extends StatelessWidget {
  bool isHome = false;
  ProjectsScreen({super.key, this.isHome = false});

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


          _projectGrid(isMobile, companyProjects),

          const SizedBox(height: 70),

          // ===== SECTION 2 =====
          _sectionTitle('Client & Project Apps',''),
          _projectGrid(isMobile, clientProjects),

          const SizedBox(height: 70),

          // ===== SECTION 3 =====
          _sectionTitle('Websites & Web Apps',''),
          _projectGrid(isMobile, websiteProjects),
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
        childAspectRatio: isMobile ?  isHome ?  0.8 : 0.85 : isHome ? .8 :  1.1,
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ProjectImage(project: widget.project),

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
