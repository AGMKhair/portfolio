import 'package:flutter/material.dart';
import 'package:portfolio/utils/size_extensions.dart';
import 'package:portfolio/widgets/achievement_card_widget.dart';
import 'package:portfolio/widgets/company_badge_widget.dart';
import 'package:portfolio/widgets/experience_card_widget.dart';
import 'package:portfolio/widgets/impact_card_widget.dart';
import 'package:portfolio/widgets/training_card_widget.dart';

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
          // ================= HEADER =================
          CircleAvatar(
            radius: isMobile ? 54 : 74,
            backgroundImage: const AssetImage('assets/images/logo.png'),
          ),
          const SizedBox(height: 16),

          Text(
            'AGM Khair Sabbir',
            style: TextStyle(
              fontSize: isMobile ? 24 : 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),

          Text(
            'Software Engineer | Mobile (Flutter, Java, Kotlin) & Backend (Spring Boot)',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey[700]),
          ),

          const SizedBox(height: 40),

          _introText(
            'I build production-ready mobile applications and lead teams with a strong '
            'focus on quality, performance, and long-term impact.',
          ),

          const SizedBox(height: 60),

          // ================= ACHIEVEMENTS =================
          _sectionTitle('🏆 Achievements & Recognition'),
          const SizedBox(height: 24),

          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: const [
              AchievementCard(
                title: '1st Position',
                subtitle: 'DIU Foundation Day',
                description:
                    'Smart Campus (Android + IoT)\nDaffodil International University',
              ),
              AchievementCard(
                title: '5th Position',
                subtitle: 'DIU Carnival',
                description:
                    'Campus Guide Android Application\nDaffodil International University',
              ),
            ],
          ),

          const SizedBox(height: 70),

          // ================= LEADERSHIP =================
          _sectionTitle('🎓 Leadership & Teaching Experience'),
          const SizedBox(height: 24),
          Wrap(
            children: [
              ExperienceCard(
                icon: Icons.cast_for_education,
                title: 'Android Lecturer',
                organization: 'GraphView Inc',
              ),

              ExperienceCard(
                icon: Icons.cast_for_education,
                title: 'Android Lecturer',
                organization: 'Computer Programming Club, DIU',
              ),

              ExperienceCard(
                icon: Icons.star,
                title: 'Student Prefect (Java)',
                organization: 'Daffodil International University',
              ),
              const ExperienceCard(
                icon: Icons.person,
                title: 'Member',
                organization: 'Computer & Programming Club, DIU',
              ),
            ],
          ),

          const SizedBox(height: 70),

          // ================= SOCIAL =================
          _sectionTitle('🤝 Social & Community Leadership'),
          const SizedBox(height: 24),

          Wrap(
            children: [
              const ImpactCard(
                role: 'CTO',
                organization: 'Change of Community Organization (CCO)',
              ),
              const ImpactCard(
                role: 'CTO',
                organization: 'হিলফুল ফুজুল সমাজকল্যাণ সংস্থা',
              ),

            ],
          ),

          const SizedBox(height: 70),

          // ================= TRAINING =================
          _sectionTitle('📘 Training & Business Knowledge'),
          const SizedBox(height: 24),

          const TrainingCard(
            title: 'Project Management for Startups',
            institute: 'BASIS Institute of Technology & Management (BITM)',
          ),
          const TrainingCard(
            title: 'Entrepreneurship & Innovation',
            institute: 'BATIGOR Academy, Dhaka - Instructor: Coach Kanchon',
          ),
          const TrainingCard(
            title: 'Training on Android App Development',
            institute: 'BASIS Institute of Technology & Management (BITM)',
          ),
          const SizedBox(height: 70),

          _sectionTitle('Companies & Organizations I’ve Worked With'),
          const SizedBox(height: 24),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 16,
            runSpacing: 16,
            children: const [
              CompanyBadge('Islami Bank Bangladesh PLC'),
              CompanyBadge('Red Technologies Ltd'),
              CompanyBadge('Robi 10 Minute School'),
              CompanyBadge('CIBL Technology Consultants Ltd'),
            ],
          ),

          const SizedBox(height: 80),

          // ================= FINAL =================
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade50,
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Text(
              '“I don’t just code features — I build systems, mentor people, '
              'and take responsibility for the outcome.”',
              textAlign: TextAlign.center,
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ],
      ),
    );
  }

  // ================= HELPERS =================

  Widget _sectionTitle(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _introText(String text) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(height: 1.6),
    );
  }
}
