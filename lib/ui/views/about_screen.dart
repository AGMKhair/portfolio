import 'package:flutter/material.dart';
import 'package:portfolio/utils/size_extensions.dart';
import 'package:portfolio/widgets/hero_badge_widget.dart';
import 'package:portfolio/widgets/skill_chip_widget.dart';
import 'package:portfolio/widgets/trust_cart_widget.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = context.isMobile;

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 140,
        vertical: 70,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ===== PROFILE =====
          CircleAvatar(
            radius: isMobile ? 52 : 72,
            backgroundImage: const AssetImage('assets/images/logo.png'),
          ),
          const SizedBox(height: 18),

          // Name (slightly smaller than Home hero)
          Text(
            'AGM Khair Sabbir',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isMobile ? 22 : 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),

          // Role (calm, not loud)
          Text(
            'Software Engineer | Mobile (Flutter, Java, Kotlin) & Backend (Spring Boot)',
            textAlign: TextAlign.center,
            style: TextStyle(
              // fontSize: context.contentSize,
              color: Colors.grey[700],
            ),
          ),

          const SizedBox(height: 30),

          // ===== SHORT INTRO =====
          Text(
            'I help businesses and startups build reliable, scalable, and high-quality '
                'mobile applications using Flutter and Android.',
            textAlign: TextAlign.center,
            style: TextStyle(
              // fontSize: context.contentSize,
              height: 1.6,
            ),
          ),

          const SizedBox(height: 42),

          // ===== TRUST HIGHLIGHTS =====
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 14,
            runSpacing: 14,
            children: const [
              HeroBadge('5+ Years Experience'),
              HeroBadge('Large-Scale Production Apps'),
              HeroBadge('Fintech & Banking'),
              HeroBadge('Flutter Specialist'),

              // TrustCard(title: '5+ Years', subtitle: 'Experience'),
              // TrustCard(title: 'Large-Scale Apps', subtitle: 'Production Ready'),
              // TrustCard(title: 'Fintech & Banking', subtitle: 'Enterprise Systems'),
              // TrustCard(title: 'Flutter', subtitle: 'Specialist'),
            ],
          ),

          const SizedBox(height: 55),

          // ===== WHY TRUST ME =====
          _sectionTitle(context, 'Why Clients Trust Me'),
          _centerText(
            context,
            'I focus on clean architecture, performance, and long-term maintainability. '
                'I have worked on real production systems where reliability matters. '
                'My goal is simple — deliver software that works and keeps clients tension-free.',
          ),

          const SizedBox(height: 45),

          // ===== WHAT I CAN DO =====
          _sectionTitle(context, 'What I Can Help You With'),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 10,
            runSpacing: 10,
            children: const [
              SkillChip('Flutter App Development'),
              SkillChip('Android (Java / Kotlin)'),
              SkillChip('Backend Development (Spring Boot)'),
              SkillChip('Firebase & REST APIs'),
              SkillChip('Fintech & Banking Systems'),
              SkillChip('Performance Optimization'),
              SkillChip('App Deployment & Maintenance'),
              SkillChip('Technical Research & Planning'),

            ],
          ),

          const SizedBox(height: 55),

          // ===== CAREER SNAPSHOT =====
          _sectionTitle(context, 'Professional Background'),
          _centerText(
            context,
            'I started my career in 2019 and have worked with organizations such as '
                'Robi 10 Minute School, CIBL Technology Consultants, and Islami Bank '
                'Bangladesh PLC. Currently, I work as a Senior Associate Software Engineer '
                'building secure, scalable mobile solutions.',
          ),

          const SizedBox(height: 55),

          // ===== FINAL TRUST MESSAGE =====
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade50,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              '“If you want a developer who understands business needs, communicates clearly, '
                  'and delivers quality work on time — you can rely on me.”',
              textAlign: TextAlign.center,
              style: TextStyle(
                // fontSize: context.contentSize,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ================= HELPERS =================

  Widget _sectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: context.isMobile ? 18 : 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _centerText(BuildContext context, String text) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        // fontSize: context.contentSize,
        height: 1.6,
      ),
    );
  }
}

