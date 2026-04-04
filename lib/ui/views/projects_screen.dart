import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:portfolio/core/models/project.dart';
import 'package:portfolio/ui/data/company_projects.dart';
import 'package:portfolio/ui/data/personal_project.dart';
import 'package:portfolio/ui/data/website_projects.dart';
import 'package:portfolio/widgets/project_card_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsScreen extends StatelessWidget {
  final bool isHome;
  const ProjectsScreen({super.key, this.isHome = false});

  void _launch(String url) async {
    final uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 900;
    const primaryColor = Color(0xFF1A237E);

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : (isHome ? 0 : 140),
        vertical: isHome ? 0 : 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isHome) ...[
            FadeInDown(
              duration: const Duration(milliseconds: 800),
              child: Text(
                'Projects',
                style: GoogleFonts.poppins(
                  fontSize: isMobile ? 32 : 48,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ),
            ),
            const SizedBox(height: 12),
            FadeInDown(
              delay: const Duration(milliseconds: 200),
              duration: const Duration(milliseconds: 800),
              child: Text(
                'Production apps, client projects, and web solutions.',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  color: Colors.blueGrey.shade600,
                ),
              ),
            ),
            const SizedBox(height: 60),
          ],

          // ===== SECTION 1 =====
          _sectionTitle(
            'Professional & Production Apps',
            'Apps developed and maintained while working at reputed organizations.',
            primaryColor,
          ),
          _projectGrid(isMobile, companyProjects),

          const SizedBox(height: 100),

          // ===== SECTION 2 =====
          _sectionTitle(
            'Client & Project Apps',
            'Mobile applications built for various clients and startups.',
            primaryColor,
          ),
          _projectGrid(isMobile, clientProjects),

          const SizedBox(height: 100),

          // ===== SECTION 2 =====
          _sectionTitle(
            'Social Apps',
            'Mobile applications built for Social Organization and Education Platform.',
            primaryColor,
          ),
          _projectGrid(isMobile, socialProjects),

          const SizedBox(height: 100),

          // ===== SECTION 3 =====
          _sectionTitle(
            'Websites & Web Apps',
            'Responsive web solutions with modern UI/UX.',
            primaryColor,
          ),
          _projectGrid(isMobile, websiteProjects),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title, String des, Color primaryColor) {
    return FadeIn(
      duration: const Duration(milliseconds: 800),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 4,
                  height: 24,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
              ],
            ),
            if (des.isNotEmpty) ...[
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  des,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Colors.blueGrey.shade600,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _projectGrid(bool isMobile, List<Project> data) {
    return AnimationLimiter(
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: data.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isMobile ? 1 : 3,
          crossAxisSpacing: 30,
          mainAxisSpacing: 30,
          childAspectRatio: isMobile ? 1.1 : 1.2,
        ),
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredGrid(
            position: index,
            duration: const Duration(milliseconds: 500),
            columnCount: isMobile ? 1 : 3,
            child: ScaleAnimation(
              child: FadeInAnimation(
                child: ProjectCard(
                  project: data[index],
                  onLaunch: _launch,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
