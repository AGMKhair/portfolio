import 'package:flutter/material.dart';
import 'package:portfolio/widgets/app_menu.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, // Changed to white for a cleaner look
      padding: const EdgeInsets.only(top: 60),
      child: const AppMenu(),
    );
  }
}
