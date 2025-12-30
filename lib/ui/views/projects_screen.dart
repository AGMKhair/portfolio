import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  void launch(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 80,
        vertical: 50,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ===== TITLE =====
          Text(
            'Projects',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'A selection of my professional and personal projects.',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 40),

          // ===== PROJECT GRID =====
          GridView.count(
            crossAxisCount: isMobile ? 1 : 3,
            crossAxisSpacing: 24,
            mainAxisSpacing: 24,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _ProjectCard(
                title: 'Campus Guide App',
                description:
                'Award-winning student application featuring campus maps, notices, and utilities.',
                image:
                'https://yourserver.com/campus1.jpg',
                tech: 'Flutter • Firebase',
                playStore:
                'https://play.google.com/store/apps/details?id=com.example.campus',
              ),
              _ProjectCard(
                title: 'Mobile Banking App',
                description:
                'Enterprise-grade mobile banking application for NRBC & Prime Bank.',
                image:
                'https://yourserver.com/bank_thumbnail.jpg',
                tech: 'Flutter • Kotlin • REST API',
                apk:
                'https://drive.google.com/uc?export=download&id=yourApkId',
                video:
                'https://drive.google.com/file/d/yourVideoId/view',
              ),
              _ProjectCard(
                title: 'IoT Automation System',
                description:
                'Smart home automation system using Flutter, Firebase, and ESP8266.',
                image:
                'https://yourserver.com/iot1.png',
                tech: 'Flutter • Firebase • IoT',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ================= PROJECT CARD =================

class _ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final String tech;
  final String? playStore;
  final String? apk;
  final String? video;

  const _ProjectCard({
    required this.title,
    required this.description,
    required this.image,
    required this.tech,
    this.playStore,
    this.apk,
    this.video,
  });

  void launch(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ===== IMAGE =====
              Stack(
                children: [
                  Image.network(
                    image,
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.black87,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // ===== CONTENT =====
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      description,
                      style: const TextStyle(fontSize: 14, height: 1.5),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      tech,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Colors.blueGrey,
                      ),
                    ),
                    const SizedBox(height: 14),

                    // ===== ACTION BUTTONS =====
                    Wrap(
                      spacing: 10,
                      runSpacing: 8,
                      children: [
                        if (playStore != null)
                          _ActionButton(
                            icon: Icons.shop,
                            label: 'Play Store',
                            onTap: () => launch(playStore!),
                          ),
                        if (apk != null)
                          _ActionButton(
                            icon: Icons.download,
                            label: 'APK',
                            onTap: () => launch(apk!),
                          ),
                        if (video != null)
                          _ActionButton(
                            icon: Icons.play_circle,
                            label: 'Demo',
                            onTap: () => launch(video!),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ================= BUTTON =================

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 18),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      ),
    );
  }
}
