import 'package:flutter/material.dart';
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
    final isMobile = MediaQuery.of(context).size.width < 900;

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 120,
        vertical: 70,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ===== HEADER =====
          Text(
            'Services',
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            'Professional services I offer to help you build reliable and scalable solutions.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),

          const SizedBox(height: 70),

          // ===== SERVICES GRID =====
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: servicesData.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 1 : 3,
              crossAxisSpacing: 28,
              mainAxisSpacing: 28,
              childAspectRatio: isMobile ? 1.25 : 1.4,
            ),
            itemBuilder: (context, index) {
              return AnimatedServiceCard(
                service: servicesData[index],
                delay: index * 120,
              );
            },
          ),

          const SizedBox(height: 90),

          // ===== CTA =====
          Container(
            padding: const EdgeInsets.all(36),
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade50,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                const Text(
                  'Have a project in mind?',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Let’s discuss your idea and build something impactful together.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15),
                ),
                const SizedBox(height: 26),
                ElevatedButton(
                  onPressed: _openWhatsApp,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 36,
                      vertical: 16,
                    ),
                  ),
                  child: const Text(
                    'Contact on WhatsApp',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}