import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialLinks extends StatelessWidget {
  const SocialLinks({super.key});

  void _launch(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          hoverColor: Colors.amber.withOpacity(0.2),
          color: Colors.white,
          splashRadius: 18,
          icon: const FaIcon(FontAwesomeIcons.whatsapp),
          onPressed: () => _launch(
            'https://wa.me/8801823585800?text=Hello%20AGM%20Khair,%20I%20found%20your%20portfolio%20and%20would%20like%20to%20discuss%20a%20project.',
          ),
        ),
        IconButton(
          hoverColor: Colors.amber.withOpacity(0.2),
          color: Colors.white,
          splashRadius: 18,
          icon: const FaIcon(FontAwesomeIcons.linkedin),
          onPressed: () =>
              _launch('https://www.linkedin.com/in/agmkhair'),
        ),

        IconButton(
          hoverColor: Colors.amber.withOpacity(0.2),
          color: Colors.white,
          splashRadius: 18,
          icon: const FaIcon(FontAwesomeIcons.github),
          onPressed: () => _launch('https://github.com/agmkhair'),
        ),
        IconButton(
          hoverColor: Colors.amber.withOpacity(0.2),
          color: Colors.white,
          splashRadius: 18,
          icon: const FaIcon(FontAwesomeIcons.facebook),
          onPressed: () =>
              _launch('https://www.facebook.com/agm.khair.sabbir.2025'),
        ),
        IconButton(
          hoverColor: Colors.amber.withOpacity(0.2),
          color: Colors.white,
          splashRadius: 18,
          icon: const FaIcon(FontAwesomeIcons.instagram),
          onPressed: () =>
              _launch('https://www.instagram.com/agmkhair_'),
        ),
      ],
    );
  }
}
