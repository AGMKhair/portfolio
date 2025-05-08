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
          icon: const FaIcon(FontAwesomeIcons.linkedin),
          onPressed: () => _launch('https://linkedin.com/in/yourusername'),
        ),
        IconButton(
          icon: const FaIcon(FontAwesomeIcons.facebook),
          onPressed: () => _launch('https://facebook.com/yourusername'),
        ),
        IconButton(
          icon: const FaIcon(FontAwesomeIcons.instagram),
          onPressed: () => _launch('https://instagram.com/yourusername'),
        ),
        IconButton(
          icon: const FaIcon(FontAwesomeIcons.github),
          onPressed: () => _launch('https://github.com/yourusername'),
        ),
      ],
    );
  }
}
