import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import 'package:portfolio/ui/data/service_info.dart';
import 'package:portfolio/widgets/animated_service_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  void _openWhatsApp() async {
    final uri = Uri.parse(
      'https://wa.me/8801823585800?text=Hello%20AGM%20Khair,%20I%20found%20your%20portfolio%20and%20would%20like%20to%20discuss%20a%20project.',
    );
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not open WhatsApp';
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 900;
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
          // ===== HEADER =====
          FadeInDown(
            duration: const Duration(milliseconds: 800),
            child: Column(
              children: [
                Text(
                  'Professional Services',
                  style: GoogleFonts.poppins(
                    fontSize: isMobile ? 32 : 48,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  width: 80,
                  height: 4,
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: isMobile ? double.infinity : 700,
                  child: Text(
                    'I provide high-quality development and consultation services to help businesses '
                    'and startups achieve their goals with reliable and scalable technology.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: isMobile ? 15 : 18,
                      color: Colors.blueGrey.shade700,
                      height: 1.6,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 80),

          // ===== SERVICES GRID =====
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: servicesData.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 1 : 3,
              crossAxisSpacing: 30,
              mainAxisSpacing: 30,
              childAspectRatio: isMobile ? 1.2 : 1.1,
            ),
            itemBuilder: (context, index) {
              return AnimatedServiceCard(
                service: servicesData[index],
                delay: index * 100,
              );
            },
          ),

          const SizedBox(height: 100),

          // ===== CTA =====
          FadeInUp(
            duration: const Duration(milliseconds: 1000),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(isMobile ? 32 : 60),
              decoration: BoxDecoration(
                color: Colors.blueGrey.shade50,
                borderRadius: BorderRadius.circular(32),
                border: Border.all(color: Colors.blueGrey.shade100),
              ),
              child: Column(
                children: [
                  Text(
                    'Have a specific project in mind?',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: isMobile ? 24 : 36,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'I am available for freelance projects and technical consultation. '
                    'Let’s build something great together.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: isMobile ? 15 : 18,
                      color: Colors.blueGrey.shade700,
                    ),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton.icon(
                    onPressed: _openWhatsApp,
                    icon: const Icon(Icons.chat_bubble_outline),
                    label: Text(
                      'Let’s Talk on WhatsApp',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 22,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 4,
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
}