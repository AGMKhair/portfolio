import 'package:flutter/material.dart';
import 'package:portfolio/widgets/social_links.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // margin: const EdgeInsets.only(top: 15),
      padding: const EdgeInsets.symmetric(vertical: 15),
      color: Colors.blueGrey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SocialLinks(),
          const SizedBox(height: 5),
          Text(
            '© ${DateTime.now().year} AGM Khair Sabbir. All rights reserved.',
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
