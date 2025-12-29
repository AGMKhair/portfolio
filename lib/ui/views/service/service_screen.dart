import 'package:flutter/material.dart';
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
        vertical: 60,
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
            'How I help businesses and startups build reliable mobile applications.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),

          const SizedBox(height: 60),

          // ===== SERVICES GRID =====
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: servicesData.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 1 : 3,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: isMobile ? 1.2 : 1.6, // 🔥 FIX
            ),
            itemBuilder: (context, index) {
              final service = servicesData[index];
              return _ServiceCard(service: service);
            },
          ),

          const SizedBox(height: 80),

          // ===== CTA =====
          Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade50,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              children: [
                const Text(
                  'Ready to start your project?',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Let’s discuss your idea and build something impactful together.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _openWhatsApp,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
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

// ================= SERVICE CARD =================

class _ServiceCard extends StatelessWidget {
  final Map<String, dynamic> service;

  const _ServiceCard({required this.service});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18), // 🔥 reduced
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 14,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // 🔥 center vertically
        children: [
          Icon(
            service['icon'],
            size: 36, // 🔥 smaller icon
            color: Theme.of(context).primaryColor,
          ),
          const SizedBox(height: 14),
          Text(
            service['title'],
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            service['description'],
            textAlign: TextAlign.center,
            maxLines: 3, // 🔥 prevent tall cards
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 13,
              height: 1.5,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}


final List<Map<String, dynamic>> servicesData = [
  {
    'title': 'Flutter App Development',
    'description':
    'High-quality cross-platform mobile applications built with Flutter. '
        'Clean architecture, smooth UI, and production-ready performance.',
    'icon': Icons.phone_iphone,
  },
  {
    'title': 'Android (Java / Kotlin)',
    'description':
    'Native Android applications with scalable architecture, modern UI, '
        'and long-term maintainability.',
    'icon': Icons.android,
  },
  {
    'title': 'Fintech & Banking Apps',
    'description':
    'Secure, enterprise-grade mobile applications for banking and fintech systems '
        'with real-world production experience.',
    'icon': Icons.account_balance,
  },
  {
    'title': 'Firebase & REST APIs',
    'description':
    'Authentication, Firestore, push notifications, analytics, and REST API '
        'integration for modern mobile apps.',
    'icon': Icons.cloud,
  },
  {
    'title': 'App Performance Optimization',
    'description':
    'Improve app speed, reduce crashes, fix memory issues, and enhance overall '
        'user experience.',
    'icon': Icons.speed,
  },
  {
    'title': 'App Maintenance & Support',
    'description':
    'Bug fixes, feature updates, Play Store support, and long-term application '
        'maintenance.',
    'icon': Icons.support_agent,
  },
];
