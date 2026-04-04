import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:lottie/lottie.dart';
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
          // ===== HERO =====
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: isMobile
                      ? CrossAxisAlignment.center
                      : CrossAxisAlignment.start,
                  children: [
                    FadeInDown(
                      duration: const Duration(milliseconds: 800),
                      child: Text(
                        'Hi, I’m',
                        textAlign: isMobile ? TextAlign.center : TextAlign.left,
                        style: GoogleFonts.poppins(
                          fontSize: isMobile ? 16 : 18,
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    FadeInDown(
                      delay: const Duration(milliseconds: 200),
                      duration: const Duration(milliseconds: 800),
                      child: Text(
                        'AGM Khair Sabbir',
                        textAlign: isMobile ? TextAlign.center : TextAlign.left,
                        style: GoogleFonts.poppins(
                          fontSize: isMobile ? 32 : 54,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                          color: primaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    FadeInDown(
                      delay: const Duration(milliseconds: 400),
                      duration: const Duration(milliseconds: 800),
                      child: Text(
                        'Software Engineer',
                        textAlign: isMobile ? TextAlign.center : TextAlign.left,
                        style: GoogleFonts.poppins(
                          fontSize: isMobile ? 15 : 24,
                          color: Colors.blueGrey.shade700,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),
                    FadeInUp(
                      delay: const Duration(milliseconds: 600),
                      duration: const Duration(milliseconds: 800),
                      child: SizedBox(
                        width: isMobile ? double.infinity : 620,
                        child: Text(
                          'I help businesses and startups build reliable, scalable, and '
                          'high-performance mobile applications that users trust.',
                          textAlign:
                              isMobile ? TextAlign.center : TextAlign.left,
                          style: GoogleFonts.inter(
                            fontSize: isMobile ? 14 : 17,
                            height: 1.7,
                            color: Colors.grey.shade800,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 28),
                    FadeInUp(
                      delay: const Duration(milliseconds: 800),
                      duration: const Duration(milliseconds: 800),
                      child: Wrap(
                        alignment: isMobile
                            ? WrapAlignment.center
                            : WrapAlignment.start,
                        spacing: 14,
                        runSpacing: 10,
                        children: const [
                          HeroBadge('5+ Years Experience'),
                          HeroBadge('Large-Scale Production Apps'),
                          HeroBadge('Fintech & Banking'),
                          HeroBadge('Flutter Specialist'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 35),
                    FadeInUp(
                      delay: const Duration(milliseconds: 1000),
                      duration: const Duration(milliseconds: 800),
                      child: Wrap(
                        alignment: isMobile
                            ? WrapAlignment.center
                            : WrapAlignment.start,
                        spacing: 16,
                        runSpacing: 12,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              context.read<NavigationProvider>().setIndex(2);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 32, vertical: 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 4,
                            ),
                            child: Text(
                              'View My Work',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600, fontSize: 16),
                            ),
                          ),
                          OutlinedButton(
                            onPressed: () {
                              context.read<NavigationProvider>().setIndex(5);
                            },
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 32, vertical: 20),
                              side: const BorderSide(
                                  color: primaryColor, width: 2),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text(
                              'Contact Me',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (!isMobile)
                Expanded(
                  child: FadeInRight(
                    delay: const Duration(milliseconds: 1200),
                    duration: const Duration(milliseconds: 1000),
                    child: Stack(
                      alignment: Alignment.center, // এটি স্ট্যাকের সব উপাদানকে মাঝখানে রাখবে
                      children: [
                        // লট্টি এনিমেশন (পেছনে থাকবে)
                        Lottie.asset(
                          'assets/lottie/coding.json',
                          width: 550,
                          height: 550,
                          fit: BoxFit.contain,
                        ),

                        // আপনার ছবি (মাঝখানে গোল আকারে থাকবে)
                        ClipOval(
                          child: Image.asset(
                            'assets/images/mypic.png',
                            width: 220, // লট্টির সাইজ অনুযায়ী এটি ছোট-বড় করে অ্যাডজাস্ট করে নিন
                            height: 220,
                            fit: BoxFit.cover, // ছবি যেন ফেটে না যায় বা স্ট্রেচ না হয়
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),

          const SizedBox(height: 100),

          // ===== WHAT I BUILD =====
          FadeIn(
            duration: const Duration(milliseconds: 1000),
            child: Column(
              children: [
                Text(
                  'What I Build',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: isMobile ? 26 : 38,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: 60,
                  height: 4,
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),

          AnimationLimiter(
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 20,
              runSpacing: 20,
              children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 375),
                childAnimationBuilder: (widget) => SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                    child: widget,
                  ),
                ),
                children: const [
                  FeatureCard(
                    title: 'Flutter Mobile Apps',
                    description:
                        'Clean, scalable, and production-ready cross-platform mobile applications built with Flutter.',
                  ),
                  FeatureCard(
                    title: 'Android (Java / Kotlin)',
                    description:
                        'High-performance native Android applications with modern architecture and long-term maintainability.',
                  ),
                  FeatureCard(
                    title: 'Website',
                    description:
                        'Fast, responsive websites and web applications with clean UI, optimized performance, and maintainable code.',
                  ),
                  FeatureCard(
                    title: 'Backend, Firebase & APIs',
                    description:
                        'Spring Boot backend services, Firebase integration, authentication, notifications, analytics, and RESTful APIs.',
                  ),
                  FeatureCard(
                    title: 'Enterprise & Industry Solutions',
                    description:
                        'Secure, scalable solutions for industries including banking, fintech, e-commerce, and enterprise platforms.',
                  ),
                  FeatureCard(
                    title: 'Research',
                    description:
                        'Project research, feasibility analysis, and solution design using any suitable programming language or technology.',
                  ),
                  FeatureCard(
                    title: 'App Deployment & Support',
                    description:
                        'Play Store deployment, release management, bug fixing, updates, and long-term application support.',
                  ),
                  FeatureCard(
                    title: 'Consultation & Planning',
                    description:
                        'Technical consultation, project planning, and architecture guidance to help you make the right decisions.',
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 100),

          // ===== PROJECTS PREVIEW =====
          const ProjectsScreen(isHome: true),

          const SizedBox(height: 100),

          // ===== WHY ME =====
          FadeInUp(
            duration: const Duration(milliseconds: 800),
            child: Column(
              children: [
                Text(
                  'Why Work With Me?',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: isMobile ? 26 : 38,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: isMobile ? double.infinity : 800,
                  child: Text(
                    'I focus on quality, clear communication, and long-term maintainability. '
                    'I have worked on real production systems where reliability matters. '
                    'My clients trust me because I deliver what I promise — on time and with care.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: isMobile ? 15 : 18,
                      height: 1.6,
                      color: Colors.grey.shade800,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 100),

          // ===== CONTACT TEASER =====
          FadeIn(
            duration: const Duration(milliseconds: 1000),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(isMobile ? 32 : 60),
              decoration: BoxDecoration(
                color: Colors.blueGrey.shade50,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.blueGrey.shade100),
              ),
              child: Column(
                children: [
                  Text(
                    'Have a project in mind?',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: isMobile ? 24 : 36,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Let’s discuss your idea and build something great together.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: isMobile ? 15 : 18,
                      color: Colors.blueGrey.shade700,
                    ),
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton.icon(
                    onPressed: () {
                      launch(
                        'https://wa.me/8801823585800?text=Hello%20AGM%20Khair,%20I%20found%20your%20portfolio%20and%20would%20like%20to%20discuss%20a%20project.',
                      );
                    },
                    icon: const Icon(Icons.chat_bubble_outline, size: 24),
                    label: Text(
                      'Get in Touch',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 22),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 6,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 100),

          const ContactScreen(),
        ],
      ),
    );
  }
}
