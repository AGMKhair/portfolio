import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/utils/utils.dart';

class SocialLinks extends StatelessWidget {
  const SocialLinks({super.key});



  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          hoverColor: Colors.amber.withOpacity(0.2),
          color: Colors.white,
          splashRadius: 18,
          icon: const FaIcon(FontAwesomeIcons.whatsapp),
          onPressed: () => launch(
            'https://wa.me/8801823585800?text=Hello%20AGM%20Khair,%20I%20found%20your%20portfolio%20and%20would%20like%20to%20discuss%20a%20project.',
          ),
        ),
        IconButton(
          hoverColor: Colors.amber.withOpacity(0.2),
          color: Colors.white,
          splashRadius: 18,
          icon: const FaIcon(FontAwesomeIcons.linkedin),
          onPressed: () =>
              launch('https://www.linkedin.com/in/agmkhair'),
        ),

        IconButton(
          hoverColor: Colors.amber.withOpacity(0.2),
          color: Colors.white,
          splashRadius: 18,
          icon: const FaIcon(FontAwesomeIcons.github),
          onPressed: () => launch('https://github.com/agmkhair'),
        ),
        IconButton(
          hoverColor: Colors.amber.withOpacity(0.2),
          color: Colors.white,
          splashRadius: 18,
          icon: const FaIcon(FontAwesomeIcons.facebook),
          onPressed: () =>
              launch('https://www.facebook.com/agm.khair.sabbir.2025'),
        ),
        IconButton(
          hoverColor: Colors.amber.withOpacity(0.2),
          color: Colors.white,
          splashRadius: 18,
          icon: const FaIcon(FontAwesomeIcons.instagram),
          onPressed: () =>
              launch('https://www.instagram.com/agmkhair_'),
        ),
      ],
    );
  }
}
