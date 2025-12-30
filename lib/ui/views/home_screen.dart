import 'package:flutter/material.dart';
import 'package:portfolio/providers/navigation_provider.dart';
import 'package:portfolio/ui/views/contact/contact_screen.dart';
import 'package:portfolio/ui/views/projects_screen.dart';
import 'package:portfolio/utils/size_extensions.dart';
import 'package:portfolio/utils/utils.dart';
import 'package:portfolio/widgets/feeature_card_widget.dart';
import 'package:portfolio/widgets/hero_badge_widget.dart';
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
            'Hi, I’m',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isMobile ? 16 : 18,
              color: Colors.blueGrey,
            ),
          ),

          const SizedBox(height: 6),

          // ===== NAME =====
          Text(
            'AGM Khair Sabbir',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isMobile ? 32 : 42, // 🔥 slightly reduced (classy)
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),

          const SizedBox(height: 10),

          // ===== ROLE =====
          Text(
            'Senior Flutter & Mobile Application Engineer',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isMobile ? 15 : 20,
              color: Colors.blueGrey.shade700,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 18),

          // ===== VALUE STATEMENT =====
          SizedBox(
            width: isMobile ? double.infinity : 620,
            child: Text(
              'I help businesses and startups build reliable, scalable, and '
                  'high-performance mobile applications that users trust.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isMobile ? 14 : 16,
                height: 1.7,
                color: Colors.grey.shade800,
              ),
            ),
          ),

          const SizedBox(height: 28),

          // ===== TRUST BADGES =====
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 14,
            runSpacing: 10,
            children: const [
              HeroBadge('5+ Years Experience'),
              HeroBadge('Large-Scale Production Apps'),
              HeroBadge('Fintech & Banking'),
              HeroBadge('Flutter Specialist'),

            ],
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
              FeatureCard(
                title: 'Flutter Mobile Apps',
                description:
                'Clean, scalable, and production-ready cross-platform mobile applications '
                    'built with Flutter.',
              ),

              FeatureCard(
                title: 'Android (Java / Kotlin)',
                description:
                'High-performance native Android applications with modern architecture '
                    'and long-term maintainability.',
              ),

              FeatureCard(
                title: 'Website',
                description:
                'Fast, responsive websites and web applications with clean UI, '
                    'optimized performance, and maintainable code.',
              ),

              FeatureCard(
                title: 'Backend, Firebase & APIs',
                description:
                'Spring Boot backend services, Firebase integration, authentication, '
                    'notifications, analytics, and RESTful APIs.',
              ),

              FeatureCard(
                title: 'Enterprise & Industry Solutions',
                description:
                'Secure, scalable solutions for industries including banking, fintech, '
                    'e-commerce, and enterprise platforms.',
              ),

              FeatureCard(
                title: 'Research',
                description:
                'Project research, feasibility analysis, and solution design using '
                    'any suitable programming language or technology based on project needs.',
              ),
              FeatureCard(
                title: 'App Deployment & Support',
                description:
                'Play Store deployment, release management, bug fixing, updates, '
                    'and long-term application support.',
              ),
              FeatureCard(
                title: 'Consultation & Planning',
                description:
                'Technical consultation, project planning, and architecture guidance '
                    'to help you make the right decisions.',
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
                ElevatedButton(
                  onPressed: () {
                    launch(
                      'https://wa.me/8801823585800?text=Hello%20AGM%20Khair,%20I%20found%20your%20portfolio%20and%20would%20like%20to%20discuss%20a%20project.',
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 16),
                  ),
                  child: const Text('Get in Touch'),
                ),
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



