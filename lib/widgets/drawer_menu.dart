import 'package:flutter/material.dart';
import 'package:portfolio/widgets/app_menu.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        AppMenu(),
      ],
    );
  }
}
