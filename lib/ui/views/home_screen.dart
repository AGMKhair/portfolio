import 'package:flutter/material.dart';
import 'package:portfolio/providers/navigation_provider.dart';
import 'package:portfolio/ui/views/contact/contact_screen.dart';
import 'package:portfolio/ui/views/projects_screen.dart';
import 'package:portfolio/utils/size_extensions.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = context.isMobile;

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 140,
        vertical: 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ===== HERO =====
          Text(
            'Hi, I’m AGM Khair Sabbir 👋',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isMobile ? 28 : 46,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),

          Text(
            'Senior Flutter & Mobile Application Engineer',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isMobile ? 16 : 22,
              color: Colors.blueGrey,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 20),

          Text(
            'I design and build reliable, scalable, and high-performance mobile applications '
                'for businesses, startups, and enterprises.',
            textAlign: TextAlign.center,
            style: TextStyle(
              height: 1.6,
            ),
          ),

          const SizedBox(height: 35),

          // ===== CTA =====
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 16,
            runSpacing: 12,
            children: [
              ElevatedButton(
                onPressed: ()
                {
                  context.read<NavigationProvider>().setIndex(2);

                },
                style: ElevatedButton.styleFrom(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
                ),
                child: const Text('View My Work'),
              ),
              OutlinedButton(
                onPressed: ()
                {
                  context.read<NavigationProvider>().setIndex(5);
                },
                child: const Text('Contact Me'),
              ),
            ],
          ),

          const SizedBox(height: 70),

          // ===== TRUST =====
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 18,
            runSpacing: 18,
            children: const [
              _StatCard(title: '5+ Years', subtitle: 'Experience'),
              _StatCard(title: '1M+', subtitle: 'Users Impacted'),
              _StatCard(title: 'Fintech', subtitle: 'Banking Apps'),
              _StatCard(title: 'Flutter', subtitle: 'Specialist'),
            ],
          ),

          const SizedBox(height: 80),

          // ===== WHAT I BUILD =====
          Text(
            'What I Build',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isMobile ? 22 : 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),

          Wrap(
            alignment: WrapAlignment.center,
            spacing: 20,
            runSpacing: 20,
            children: const [
              _FeatureCard(
                title: 'Flutter Mobile Apps',
                description:
                'Clean, scalable, and production-ready cross-platform applications.',
              ),
              _FeatureCard(
                title: 'Android (Java / Kotlin)',
                description:
                'High-performance native Android applications.',
              ),
              _FeatureCard(
                title: 'Banking & Fintech',
                description:
                'Secure enterprise-grade financial applications.',
              ),
              _FeatureCard(
                title: 'Firebase & APIs',
                description:
                'Authentication, notifications, analytics, and REST APIs.',
              ),
            ],
          ),

          const SizedBox(height: 80),

          ProjectsScreen(),

          // ===== WHY ME =====
          Text(
            'Why Work With Me?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isMobile ? 22 : 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),

          Text(
            'I focus on quality, clear communication, and long-term maintainability. '
                'I have worked on real production systems where reliability matters. '
                'My clients trust me because I deliver what I promise — on time and with care.',
            textAlign: TextAlign.center,
            style: TextStyle(
              height: 1.6,
            ),
          ),

          const SizedBox(height: 90),

          // ===== CONTACT TEASER =====
          Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade50,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              children: [
                Text(
                  'Have a project in mind?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: isMobile ? 20 : 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Let’s discuss your idea and build something great together.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    // fontSize: context.contentSize,
                  ),
                ),
                const SizedBox(height: 24),
             /*   ElevatedButton(
                  onPressed: () {
                    // TODO: Navigate to Contact page
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 16),
                  ),
                  child: const Text('Get in Touch'),
                ),*/
              ],
            ),
          ),

          ContactScreen(),

        ],
      ),
    );
  }
}

// ================= COMPONENTS =================

class _StatCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const _StatCard({
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final String title;
  final String description;

  const _FeatureCard({
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.isMobile ? double.infinity : 260,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
