import 'package:flutter/material.dart';
import 'package:portfolio/utils/size_extensions.dart';

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
            'Senior Flutter & Mobile Application Engineer',
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
              _TrustCard(title: '5+ Years', subtitle: 'Experience'),
              _TrustCard(title: '1M+ Users', subtitle: 'Impact'),
              _TrustCard(title: 'Banking', subtitle: 'Fintech & Enterprise'),
              _TrustCard(title: 'Flutter', subtitle: 'Specialist'),
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
              _SkillChip('Flutter App Development'),
              _SkillChip('Android (Java / Kotlin)'),
              _SkillChip('Firebase & REST APIs'),
              _SkillChip('Fintech & Banking Apps'),
              _SkillChip('Performance Optimization'),
              _SkillChip('App Maintenance'),
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

// ================= COMPONENTS =================

class _TrustCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const _TrustCard({
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 165,
      padding: const EdgeInsets.all(18),
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
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class _SkillChip extends StatelessWidget {
  final String label;

  const _SkillChip(this.label);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.blueGrey.shade50,
    );
  }
}
