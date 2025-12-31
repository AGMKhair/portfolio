import 'package:flutter/material.dart';
import 'package:portfolio/core/models/project.dart';
import 'package:portfolio/ui/data/company_projects.dart';
import 'package:portfolio/ui/data/personal_project.dart';
import 'package:portfolio/ui/data/website_projects.dart';
import 'package:portfolio/widgets/project_card_widget.dart';
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
      itemBuilder: (_, i) => ProjectCard(
        project: data[i],
        onLaunch: _launch,
      ),
    );
  }
}
