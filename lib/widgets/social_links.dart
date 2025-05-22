import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialLinks extends StatelessWidget {
  const SocialLinks({super.key});

  void _launch(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri)) throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          hoverColor: Colors.amber.withOpacity(0.2),
          color: Colors.white,
          icon: const FaIcon(FontAwesomeIcons.linkedin),
          onPressed: () => _launch('https://www.linkedin.com/in/agmkhair'),
          splashRadius: 10.0,
        ),
        IconButton(
          color: Colors.white,
          hoverColor: Colors.amber.withOpacity(0.2),
          icon: const FaIcon(FontAwesomeIcons.facebook),
          onPressed: () => _launch('https://www.facebook.com/agm.khair.sabbir.2025'),
        ),
        IconButton(
          color: Colors.white,
          hoverColor: Colors.amber.withOpacity(0.2),
          icon: const FaIcon(FontAwesomeIcons.instagram),
          onPressed: () => _launch('https://www.instagram.com/agmkhair_'),
        ),
        IconButton(
          color: Colors.white,
          hoverColor: Colors.amber.withOpacity(0.2),
          icon: const FaIcon(FontAwesomeIcons.github),
          onPressed: () => _launch('https://github.com/agmkhair'),
        ),
      ],
    );
  }
}
