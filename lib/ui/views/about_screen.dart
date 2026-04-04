import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import 'package:lottie/lottie.dart';
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
    const primaryColor = Color(0xFF1A237E);
    const secondaryColor = Color(0xFFFFC107);

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 140,
        vertical: 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ================= HEADER =================
          FadeInDown(
            duration: const Duration(milliseconds: 800),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: primaryColor.withOpacity(0.1), width: 8),
                  ),
                  child: CircleAvatar(
                    radius: isMobile ? 60 : 80,
                    backgroundColor: Colors.white,
                    backgroundImage: const AssetImage('assets/images/logo.png'),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'AGM Khair Sabbir',
                  style: GoogleFonts.poppins(
                    fontSize: isMobile ? 32 : 42,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Software Engineer | Mobile (Flutter, Java, Kotlin) & Backend (Spring Boot)',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: isMobile ? 14 : 18,
                    color: Colors.blueGrey.shade700,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: isMobile ? double.infinity : 750,
                  child: Text(
                    'I build production-ready mobile applications and lead teams with a strong '
                    'focus on quality, performance, and long-term impact.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: isMobile ? 15 : 18,
                      height: 1.7,
                      color: Colors.grey.shade800,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 100),

          // ================= ACHIEVEMENTS =================
          FadeInUp(
            duration: const Duration(milliseconds: 800),
            child: Column(
              children: [
                _sectionHeader(
                  '🏆 Achievements & Recognition',
                  'assets/lottie/achievements.json',
                  primaryColor,
                  secondaryColor,
                  isMobile,
                ),
                const SizedBox(height: 40),
                Wrap(
                  spacing: 24,
                  runSpacing: 24,
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
              ],
            ),
          ),

          const SizedBox(height: 100),

          // ================= LEADERSHIP =================
          FadeInUp(
            duration: const Duration(milliseconds: 800),
            child: Column(
              children: [
                _sectionHeader(
                  '🎓 Leadership & Teaching',
                  'assets/lottie/education.json',
                  primaryColor,
                  secondaryColor,
                  isMobile,
                ),
                const SizedBox(height: 40),
                Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  alignment: WrapAlignment.center,
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
              ],
            ),
          ),

          const SizedBox(height: 100),

          // ================= SOCIAL =================
          FadeInUp(
            duration: const Duration(milliseconds: 800),
            child: Column(
              children: [
                _sectionHeader(
                  '🤝 Community Leadership',
                  'assets/lottie/coding.json',
                  primaryColor,
                  secondaryColor,
                  isMobile,
                ),
                const SizedBox(height: 40),
                Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  alignment: WrapAlignment.center,
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
              ],
            ),
          ),

          const SizedBox(height: 100),

          // ================= TRAINING =================
          FadeInUp(
            duration: const Duration(milliseconds: 800),
            child: Column(
              children: [
                _sectionHeader(
                  '📘 Training & Business',
                  'assets/lottie/backend.json',
                  primaryColor,
                  secondaryColor,
                  isMobile,
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: isMobile ? double.infinity : 900,
                  child: Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    alignment: WrapAlignment.center,
                    children: [
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
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 100),

          // ================= COMPANIES =================
          FadeInUp(
            duration: const Duration(milliseconds: 800),
            child: Column(
              children: [
                Text(
                  'Companies & Organizations I’ve Worked With',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: isMobile ? 22 : 28,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  width: 60,
                  height: 3,
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 40),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 20,
                  runSpacing: 20,
                  children: const [
                    CompanyBadge('Nec Money Transfer Limited'),
                    CompanyBadge('Islami Bank Bangladesh PLC'),
                    CompanyBadge('Red Technologies Ltd'),
                    CompanyBadge('Robi 10 Minute School'),
                    CompanyBadge('CIBL Technology Consultants Ltd'),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 100),

          // ================= FINAL QUOTE =================
          FadeIn(
            duration: const Duration(milliseconds: 1000),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(40),
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.05),
                borderRadius: BorderRadius.circular(32),
                border: Border.all(color: primaryColor.withOpacity(0.1)),
              ),
              child: Column(
                children: [
                  Icon(Icons.format_quote, size: 48, color: primaryColor.withOpacity(0.3)),
                  const SizedBox(height: 16),
                  Text(
                    '“I don’t just code features — I build systems, mentor people, '
                    'and take responsibility for the outcome.”',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: isMobile ? 18 : 24,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w500,
                      color: primaryColor,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionHeader(
    String title,
    String lottiePath,
    Color primaryColor,
    Color secondaryColor,
    bool isMobile,
  ) {
    return Column(
      children: [
        SizedBox(
          height: 100,
          width: 100,
          child: Lottie.asset(lottiePath),
        ),
        const SizedBox(height: 12),
        Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: isMobile ? 24 : 32,
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          width: 60,
          height: 4,
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }
}
